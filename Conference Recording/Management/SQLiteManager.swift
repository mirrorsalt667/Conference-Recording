//
//  SQLiteManager.swift
//  Conference Recording
//
//  Created by 黃肇祺 on 2022/8/6.
//

// sqlite 新增資料庫、表單、讀取資料、新增資料
// 還沒用到修改刪除？

import FMDB
import Foundation
import SwiftUI

final class SQLiteManager: ObservableObject {
  private let db: FMDatabase
  @Published var users = [User]()
  
  init(fileName: String = "dogTest") {
    // Get filePath of the SQLite file
    let fileURL = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("\(fileName).sqlite")
    // Create FMDatabase from filePath
    let db = FMDatabase(url: fileURL)
    
    // open connection to db
    guard db.open() else {
      fatalError("unable to open db")
    }
    
    // initial table creation
    do {
      try db.executeUpdate("create table if not exists users(image text not null, fact text not null)", values: nil)
    } catch {
      fatalError("cannot execute query")
    }
    
    self.db = db
    self.users = getAllUsers()
  }
  
  func getAllUsers() -> [User] {
    var users = [User]()
    do {
      let result = try db.executeQuery("select image, fact from users", values: nil)
      while result.next() {
        if let user = User(from: result) {
          users.append(user)
        }
      }
      return users
    } catch {
      return users
    }
  }
  
  func insert(_ user: User) {
    do {
      try db.executeUpdate(
        """
        insert into users (image, fact)
        values (?, ?)
        """,
        values: [user.image, user.fact])
      users.append(user)
    } catch {
      fatalError("can't insert user \(error)")
    }
  }
  
  
}
