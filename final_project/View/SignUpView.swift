//
//  SignUpView.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/8/24.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Sign Up")
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
        
        HStack(alignment: .center) {
            VStack {
                Text("Must contain 3 characters")
                    .lineLimit(1)
                Text("Must contain 1 capital letter")
                    .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
                
                       
            VStack {
                Text("Must include one number")
                    .lineLimit(1)
                Text("Must have 1 special character")
                    .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
        }
        .font(.caption2)
        .padding()
        
        Button("Sign Up") {
            userViewModel.signUp()
        }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .bold()
            .cornerRadius(8)
            .alert(isPresented: $userViewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text(userViewModel.alertMessage), dismissButton: .default(Text("OK")))
            })
        Spacer()
            .frame(height: 30)
    }
}

#Preview {
    SignUpView().environmentObject(UserViewModel())
}
