//
//  UserViewModel.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/8/24.
//

import Foundation
import FirebaseAuth

class UserViewModel: ObservableObject {
    @Published var user = User(email: "", password: "", signedIn: false)
    
    // TODO: If signIn was not successful display and alert letting the user know
    func signIn() {
        Auth.auth().signIn(withEmail: user.email, password: user.password) { [weak self] authResult, error in
            guard self != nil else { return }
            
            if let error = error {
                print("Error signing in: ", error.localizedDescription)
            } else {
                print("Sign-in successful")
                self?.user.signedIn = true
            }
        }
    }
    
    // TODO: If signUp was not successful display and alert letting the user know
    func signUp() {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { authResult, error in
            if let error = error {
                print("Error signing up: ", error.localizedDescription)
            } else {
                print("Sign-up was successful")
                self.user.signedIn = true
            }
        }
    }
    
    // TODO: If signOut was not successful display and alert letting the user know
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user.signedIn = false
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
        }
    }
    
    // TODO: add validation func for email
    
    // TODO: add validation func for password
}
