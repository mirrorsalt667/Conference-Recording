//
//  RecordModel.swift
//  Conference Recording
//
//  Created on 2022/8/6.
//

import Foundation
import SwiftUI
import FMDB

struct User: Hashable, Decodable {
  let image: URL
  let fact: String
  
  init(image: URL, fact: String) {
    self.image = image
    self.fact = fact
  }
  
  init?(from result: FMResultSet) {
    if let image = result.string(forColumn: "image"),
       let fact = result.string(forColumn: "fact"),
       let url = URL(string: image) {
      self.image = url
      self.fact = fact
    }else{
      return nil
    }
  }
  
//  private enum CodingKeysEnum: String, CodingKey {
//    case image = "image"
//  }
//  
//  init(from decoder: Decoder) throws {
//    let container = try decoder.container(keyedBy: CodingKeysEnum.self)
//    image = try container.decode(URL.self, forKey: .image)
//    fact = String(Int.random(in: 1..<100))
//  }
}
