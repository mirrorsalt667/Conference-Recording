//
//  ShowRecordPage.swift
//  Conference Recording
//
//  Created on 2022/8/7.
//

// 歷史紀錄

import SwiftUI

struct ShowRecordPage: View {
  var body: some View {
    VStack {
      Text("test")
    }
    .toolbar {
      ToolbarItem(id: "more", placement: .navigationBarTrailing, showsByDefault: true) {
        Image(systemName: "moon")
      }
    }
  }
}

struct ShowRecordPage_Previews: PreviewProvider {
  static var previews: some View {
    ShowRecordPage()
  }
}
