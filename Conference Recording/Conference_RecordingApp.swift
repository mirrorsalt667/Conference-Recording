//
//  Conference_RecordingApp.swift
//  Conference Recording
//
//  Created by 黃肇祺 on 2022/8/1.
//

import SwiftUI

// App 剛進來的頁面
@main
struct Conference_RecordingApp: App {
  @StateObject private var db = SQLiteManager()
    var body: some Scene {
        WindowGroup {
          // 在初始頁加入environmentObject 解決 swift:70: Fatal error: No ObservableObject of 錯誤。
          ContentView().environmentObject(db)
        }
    }
}
