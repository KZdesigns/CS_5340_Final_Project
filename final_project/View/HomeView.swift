//
//  HomeView.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/10/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
          NavigationView {
              VStack {
                  List {
                      HStack {
                          Text("Session 1")
                          Spacer()
                          Image(systemName: "arrow.forward")
                      }
                      HStack {
                          Text("Session 2")
                          Spacer()
                          Image(systemName: "arrow.forward")
                      }
                      HStack {
                          Text("Session 3")
                          Spacer()
                          Image(systemName: "arrow.forward")
                      }
                      HStack {
                          Text("Session 4")
                          Spacer()
                          Image(systemName: "arrow.forward")
                      }
                      HStack {
                          Text("Session 5")
                          Spacer()
                          Image(systemName: "arrow.forward")
                      }
                      HStack {
                          Text("Session 6")
                          Spacer()
                          Image(systemName: "arrow.forward")
                      }
                      HStack {
                          Text("Session 7")
                          Spacer()
                          Image(systemName: "arrow.forward")
                      }
                      HStack {
                          Text("Session 8")
                          Spacer()
                          Image(systemName: "arrow.forward")
                      }
                      HStack {
                          Text("Session 9")
                          Spacer()
                          Image(systemName: "arrow.forward")
                      }
                      HStack {
                          Text("Session 10")
                          Spacer()
                          Image(systemName: "arrow.forward")
                      }
                  }
                  .listStyle(.inset)
                  
                  Button(action: {
                      viewModel.signOut()
                  }, label: {
                      Text("Log Out")
                          .font(.headline)
                  })
                  .padding()
              }
              .navigationTitle("Surf Sessions")
              .toolbar {
                  ToolbarItem(placement: .navigationBarTrailing) {
                      NavigationLink(destination: LogView().navigationTitle("Session Details").navigationBarTitleDisplayMode(.large)) {
                          Image(systemName: "plus")
                      }
                  }
              }
              .alert(isPresented: $viewModel.showAlert, content: {
                  Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
              })
          }
      }
  }

#Preview {
    HomeView().environmentObject(UserViewModel())
}


//
//ToolbarItem(placement: .topBarLeading) {
//    Button(action: {
//        viewModel.signOut()
//    }) {
//        Image(systemName: "rectangle.portrait.and.arrow.right")
//    }
//}
