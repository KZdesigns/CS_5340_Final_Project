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
            List {
                Text("Session 1")
                Text("Session 2")
                Text("Session 3")
                Text("Session 4")
            }
            .listStyle(.inset)
            .navigationTitle("Surf Sessions")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: SignInView()) { // navigating to signInView is a place holder for now, as I am finishing up the final project
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        viewModel.signOut()
                    }) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                }
            }
            .padding()
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            })
        }
    }
}

#Preview {
    HomeView().environmentObject(UserViewModel())
}

