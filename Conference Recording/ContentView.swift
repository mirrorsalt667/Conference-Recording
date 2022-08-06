//
//  ContentView.swift
//  Conference Recording
//
//  Created by 黃肇祺 on 2022/8/1.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject var db: SQLiteManager

//  let tSQLiteManager = SQLiteManager()
//  let array = [
//    conferenceTitleType(title: "標題", timeStr: "日期"),
//    conferenceTitleType(title: "會議1", timeStr: "2022/07/23"),
//    conferenceTitleType(title: "會議2", timeStr: "2022/07/26")
//  ]

  var body: some View {
    NavigationView {
      List(db.users, id: \.self) { user in
        HStack {
          Text("\(user.image)")
          Spacer()
          Text(user.fact)
        }
      }
      .navigationTitle("USERS")
      .toolbar {
        ToolbarItem(id: "plus", placement: .navigationBarTrailing, showsByDefault: true) {
          Button {
            createRandomUser()
          } label: {
            Image(systemName: "plus")
          }
        }
      }
    }
    .onAppear {
      print("view show out")
    }
    .onDisappear {
      print("view disappear")
    }
  }

  private func createRandomUser() {
    let url = URL(string: "https://some-random-api.ml/animal/dog")!
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data else {
        fatalError("no data")
      }
      do {
        let user = try JSONDecoder().decode(User.self, from: data)
        DispatchQueue.main.async {
          db.insert(user)
        }
      } catch {
        print("解析錯誤", error, "<--<")
      }
    }
    task.resume()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

// struct conferenceTitleType: Identifiable {
//  let id = UUID()
//  let title: String
//  let timeStr: String
// }
