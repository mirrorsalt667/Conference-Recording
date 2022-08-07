//
//  StartingNewPage.swift
//  Conference Recording
//
//  Created on 2022/8/7.
//

// 建立新的會議

import SwiftUI

struct StartingNewPage: View {
  var body: some View {
    HStack {
      Text("key conference title here")
    }
    .toolbar {
      ToolbarItem(id: "start", placement: .navigationBarTrailing, showsByDefault: true) {
        NavigationLink {
          RecordingPage()
        } label: {
          Image(systemName: "play")
        }
      }
    }
  }
}

struct StartingNewPage_Previews: PreviewProvider {
  static var previews: some View {
    StartingNewPage()
  }
}
