//
//  ContentView.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/8/24.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        if userViewModel.user.signedIn {
            HomeView().environmentObject(userViewModel)
        } else {
            SignInView().environmentObject(userViewModel)
        }
    }
}

#Preview {
    ContentView().environmentObject(UserViewModel())
}
