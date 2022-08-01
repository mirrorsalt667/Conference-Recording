//
//  ContentView.swift
//  Conference Recording
//
//  Created by 黃肇祺 on 2022/8/1.
//

import SwiftUI

struct ContentView: View {
  let array = [
//    conferenceTitleType(title: "標題", timeStr: "日期"),
    conferenceTitleType(title: "會議1", timeStr: "2022/07/23"),
    conferenceTitleType(title: "會議2", timeStr: "2022/07/26")
  ]

  var body: some View {
    List(array) { arr in
      HStack {
        Text(arr.title)
          Spacer()
        Text(arr.timeStr)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct conferenceTitleType: Identifiable {
  let id = UUID()
  let title: String
  let timeStr: String
}
