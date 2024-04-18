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
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    func signIn() {
        guard isValidEmail(user.email) && isValidPassword(user.password) else {
            alertMessage = "Invalid email or password format."
            showAlert = true
            return
        }
        
        Auth.auth().signIn(withEmail: user.email, password: user.password) { [weak self] authResult, error in
            guard self != nil else { return }
            
            if let error = error {
                print("Error signing in: ", error.localizedDescription)
                self?.alertMessage = "Error signing in: \(error.localizedDescription)"
                self?.showAlert = true
            } else {
                print("Sign-in successful")
                self?.user.signedIn = true
                self?.resetCredentials()
            }
        }
    }
    
    func signUp() {
        guard isValidEmail(user.email) && isValidPassword(user.password) else {
            alertMessage = "Invalid email or password format."
            showAlert = true
            return
        }
        
        Auth.auth().createUser(withEmail: user.email, password: user.password) { authResult, error in
            if let error = error {
                print("Error signing up: ", error.localizedDescription)
                self.alertMessage = "Error signing up: \(error.localizedDescription)"
                self.showAlert = true
            } else {
                print("Sign-up was successful")
                self.user.signedIn = true
                self.resetCredentials()
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user.signedIn = false
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError.localizedDescription)")
            self.alertMessage = "Error signing out: \(signOutError.localizedDescription)"
            self.showAlert = true
        }
    }
    
    private func resetCredentials() {
        user.email = ""
        user.password = ""
    }
    
    private func isValidEmail(_ email: String) -> Bool {
            let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPattern)
            return emailPredicate.evaluate(with: email)
        }
        
    private func isValidPassword(_ password: String) -> Bool {
        let passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*])[A-Za-z\\d!@#$%^&*]{3,}"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
        return passwordPredicate.evaluate(with: password)
    }
}
