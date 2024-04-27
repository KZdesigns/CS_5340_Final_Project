//
//  SessionViewModel.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/25/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class SessionViewModel: ObservableObject {
    
    @Published var sessions = [SessionModel]()
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var loading = false
    let db = Firestore.firestore()
    
    
    func filter(searchTerm: String) -> [SessionModel] {
        let lowercasedTerm = searchTerm.lowercased()
        return sessions.filter { session in
            session.locationName.lowercased().contains(lowercasedTerm)
        }
    }

    
    func fetchSessions(userId: String) {
        loading = true
        self.sessions.removeAll()
        db.collection("sessions").whereField("userId", isEqualTo: userId)
            .getDocuments() { (querySnapshot, err) in
                self.loading = false
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.sessions.append(try document.data(as: SessionModel.self))
                        } catch {
                            print(error)
                            self.alertMessage = "Error signing in: \(error.localizedDescription)"
                            self.showAlert = true
                        }
                    }
                }
            }
       
    }
    
    
    func saveSession(session: SessionModel) {
        if let id = session.id {
            if !session.locationName.isEmpty {
                let docRef = db.collection("sessions").document(id)
                
                docRef.updateData([
                    "locationName": session.locationName,
                    "rating": session.rating,
                    "tideHeight": session.tideHeight,
                    "userId": session.userId,
                    "userInput": session.userInput,
                    "waveHeight": session.waveHeight,
                    "windDirection": session.windDirection,
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                        self.alertMessage = "Error signing in: \(err.localizedDescription)"
                        self.showAlert = true
                    } else {
                        print("Document successfully updated")
                    }
                }
            }
        } else {
            if !session.locationName.isEmpty || !session.userId.isEmpty {
                var ref: DocumentReference? = nil
                ref = db.collection("sessions").addDocument(data: [
                    "locationName": session.locationName,
                    "rating": session.rating,
                    "tideHeight": session.tideHeight,
                    "userId": session.userId,
                    "userInput": session.userInput,
                    "waveHeight": session.waveHeight,
                    "windDirection": session.windDirection,
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                        self.alertMessage = "Error signing in: \(err.localizedDescription)"
                        self.showAlert = true
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
            
        }
    }
    
    func deleteSession(id: String) {
        db.collection("sessions").document(id).delete() { error in
            if let error = error {
                print("Error deleting session: \(error)")
                self.alertMessage = "Error signing in: \(error.localizedDescription)"
                self.showAlert = true
            } else {
                print("Session successfully deleted")
            }
        }
    }
}
