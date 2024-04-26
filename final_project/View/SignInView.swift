//
//  SignInView.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/8/24.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                    .frame(height: 20)
                Image("app-icon")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .scaledToFit()
                    .padding()
                Spacer()
                    .frame(height: 20)
                VStack(alignment: .leading) {
                    Text("Sign In")
                        .font(.title)
                        .bold()
                        .padding()
                        .padding(.bottom)
                    TextField("Email", text: $userViewModel.user.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    SecureField("Password", text: $userViewModel.user.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                    NavigationLink(destination: SignUpView().environmentObject(userViewModel)) {
                        Text("Don't have an account? Sign Up")
                    }
                    .foregroundColor(.gray)
                    .padding(.bottom)
                    
                    Button("Sign In") {
                        userViewModel.signIn()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .bold()
                    .cornerRadius(8)
                    .alert(isPresented: $userViewModel.showAlert, content: {
                        Alert(title: Text("Error"), message: Text(userViewModel.alertMessage), dismissButton: .default(Text("OK")))
                    })
            }
          Spacer()
        }
    }
}

#Preview {
    SignInView().environmentObject(UserViewModel())
}
