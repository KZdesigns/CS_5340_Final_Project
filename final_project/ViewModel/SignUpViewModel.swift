//
//  UserViewModel.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/8/24.
//

import Foundation
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    @Published var user = User(email: "", password: "")
    
    // TODO: If sign-up was not successful display and alert letting the user know
    func signUp() {
        Auth.auth().createUser(withEmail: user.email, password: user.email) { authResult, error in
            if let error = error {
                print("Error signing up: ", error.localizedDescription)
            } else {
                print("Sign-up was successful")
            }
        }
    }

    // TODO: add validation func for email
    
    // TODO: add validation func for password
}
