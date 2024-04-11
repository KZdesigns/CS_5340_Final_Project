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
        Text("Welcome! You have successfully logged in!")
        Button("Logout") {
            viewModel.signOut()
        }
    }
}
