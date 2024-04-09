//
//  SignUpView.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/8/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()

    
    var body: some View {
        VStack {
            Text("Sign Up")
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
            
            Button("Sign Up") {
                viewModel.signUp()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .bold()
            .cornerRadius(8)
        }
    }
}

#Preview {
    SignUpView()
}
