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
                    NavigationLink(destination: SignInView()) {
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
            
        }
    }
}

#Preview {
    HomeView().environmentObject(UserViewModel())
}

