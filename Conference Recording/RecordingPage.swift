//
//  RecordingPage.swift
//  Conference Recording
//
//  Created on 2022/8/6.
//

// 顯示正在進行中的會議

// 講話人、內容、時間，並且可編輯講話人。
// 右上有新增下一句的按鈕。

import SwiftUI

struct RecordingPage: View {
  var body: some View {
    VStack {
      Text("we need a list here")
      // list
    }
    .toolbar {
      ToolbarItem(id: "type", placement: .navigationBarTrailing, showsByDefault: true) {
        NavigationLink {
          TypingPage(uid: .constant("Typing"))
        } label: {
          Text("新增")
        }

      }
    }
  }
}

struct RecordingPage_Previews: PreviewProvider {
  static var previews: some View {
    RecordingPage()
  }
}
