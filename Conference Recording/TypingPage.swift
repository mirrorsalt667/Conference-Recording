//
//  TypingPage.swift
//  Conference Recording
//
//  Created on 2022/8/6.
//

// 打字的頁面

import SwiftUI

struct TypingPage: View {
  @Binding var uid: String
  @State private var textEditorString: String = "Typing"
  @State private var showingPopover: Bool = false
  @State private var missionPopover: Bool = false

  let width = UIScreen.main.bounds.width

  var body: some View {
    VStack {
      HStack {
        Button {
          print("the last page")
        } label: {
          Text("取消")
            .padding(20)
        }
        Spacer()
        Button {
          print("saving")
        } label: {
          Text("儲存")
            .padding(20)
        }
      }
      HStack {
        Text("說話者: ")
          .frame(width: width/3, height: 45, alignment: .leading)
          .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        Button {
          print("select people")
        } label: {
          Text("someone")
        }
        .padding()
        Button("選擇") {
          showingPopover = true
        }
        .popover(isPresented: $showingPopover) {
//          List(anewArr) {_ in
          Text("pick")
//          }
        }
        Spacer()
      }
      HStack(alignment: .center) {
        Text("任務賦予: ")
          .frame(width: width/3, height: 45, alignment: .leading)
          .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        Button {
          print("select people")
        } label: {
          Text("someone")
        }
        .padding()
        Spacer()
      }
      HStack {
        Text("內容: ")
          .frame(width: width/3, height: 45, alignment: .leading)
          .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        Spacer()
      }
      .navigationBarHidden(true)
      TextEditor(text: $textEditorString)
        .padding()
        .foregroundColor(.purple)
    }
  }
}

struct TypingPage_Previews: PreviewProvider {
  static var previews: some View {
    // 要在此處constant binding一個字串，上面的textEditor才不會報錯
    TypingPage(uid: .constant("Typing"))
  }
}
