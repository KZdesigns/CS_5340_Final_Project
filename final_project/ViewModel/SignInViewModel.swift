//
//  SignInViewModel.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/8/24.
//

import Foundation
import FirebaseAuth


class SignInViewModel: ObservableObject {
    @Published var user = User(email: "", password: "")
    
    // TODO: If sign-in was not successful display and alert letting the user know
    
    func signIn() {
        Auth.auth().signIn(withEmail: user.email, password: user.email) { [weak self] authResult, error in
            guard self != nil else { return }
            
            if let error = error {
                print("Error signing in: ", error.localizedDescription)
            } else {
                print("Sign-in successful")
            }
        }
    }
}
