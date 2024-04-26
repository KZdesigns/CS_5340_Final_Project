//
//  HomeView.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/10/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var sessionViewModel = SessionViewModel()
    @State var session = SessionModel(locationName: "", rating: 0, tideHeight: "", userId: "", userInput: "", waveHeight: 0, windDirection: "")


    var body: some View {
          NavigationView {
              VStack {
                  if sessionViewModel.loading  {
                        Spacer()
                  } else if sessionViewModel.sessions.isEmpty {
                      Text("Looks like you don't have any logged sessions! Get outside and go surfing, and when you're done make sure to log your sessions here.")
                          .font(.callout)
                          .multilineTextAlignment(.center)
                          .padding()
                          .padding()
                          .padding(.vertical)
                          .padding(.vertical)
                      Spacer()
                  } else {
                      List {
                          ForEach($sessionViewModel.sessions) { $session in
                              NavigationLink {
                                  LogView(session: $session, editable: true)
                              } label: {
                                  Text(session.locationName)
                                  Spacer()
                                  Text("Ranking: \(session.rating)")
                              }
                          }
                          
                      }
                      .listStyle(.inset)
                  }
                     
                  Button(action: {
                      userViewModel.signOut()
                  }, label: {
                      Text("Log Out")
                          .font(.headline)
                  })
                  .padding()
              }
              .onAppear {
                  if let userId = userViewModel.user.id {
                      sessionViewModel.fetchSessions(userId: userId)
                     }
              }
              .refreshable {
                  if let userId = userViewModel.user.id {
                      sessionViewModel.fetchSessions(userId: userId)
                     }
              }
              .navigationTitle("Surf Sessions")
              .toolbar {
                  ToolbarItem(placement: .navigationBarTrailing) {
                      NavigationLink(destination: LogView(session: $session).environmentObject(userViewModel).navigationTitle("Session Details").navigationBarTitleDisplayMode(.large)) {
                          Image(systemName: "plus")
                      }
                  }
              }
              .alert(isPresented: $userViewModel.showAlert, content: {
                  Alert(title: Text("Error"), message: Text(userViewModel.alertMessage), dismissButton: .default(Text("OK")))
              })
              .alert(isPresented: $sessionViewModel.showAlert, content: {
                  Alert(title: Text("Error"), message: Text(sessionViewModel.alertMessage), dismissButton: .default(Text("OK")))
              })
          }
      }
  }

#Preview {
    HomeView().environmentObject(UserViewModel())
}
