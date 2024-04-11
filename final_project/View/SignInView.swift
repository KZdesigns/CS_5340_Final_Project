//
//  SignInView.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/8/24.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Sign In")
                    .font(.title)
                    .bold()
                    .padding()
                    .padding(.bottom)
                TextField("Email", text: $viewModel.user.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                SecureField("Password", text: $viewModel.user.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
                NavigationLink(destination: SignUpView().environmentObject(viewModel)) {
                    Text("Don't have an account? Sign Up")
                }
                .foregroundColor(.gray)
                .padding(.bottom)
                
                Button("Sign In") {
                    viewModel.signIn()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .bold()
                .cornerRadius(8)
        }
    }
}
