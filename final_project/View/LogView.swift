//
//  LogView.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/24/24.
//

import SwiftUI

struct LogView: View {
    @Binding var session: SessionModel
    var editable = false
    @ObservedObject var sessionViewModel = SessionViewModel()
    @EnvironmentObject var userViewModel: UserViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Surf Session Details")) {
                    VStack(alignment: .leading, content: {
                        Text("Enter Surf Location")
                            .font(.headline)
                        TextField("Location Name", text: $session.locationName)
                    })
                    
                    
                    VStack(alignment: .leading, content: {
                        Text("Wave Height")
                            .font(.headline)
                        Picker("waveHeight", selection: $session.waveHeight) {
                            ForEach(1...10, id: \.self) { num in
                                Text("\(num)")
                                    .tag(num)
                            }
                        }
                        .pickerStyle(.palette)
                    })
                    
                    VStack(alignment: .leading, content: {
                        Text("Tide")
                            .font(.headline)
                        Picker("tideHeight", selection: $session.tideHeight) {
                            ForEach(["Low", "Mid", "High"], id: \.self) { tide in
                                Text(tide)
                                    .tag(tide)
                            }
                        }
                        .pickerStyle(.palette)
                    })
                    

                    VStack(alignment: .leading, content: {
                        Text("Wind Direction")
                            .font(.headline)
                        Picker("windDirection", selection: $session.windDirection) {
                            ForEach(["N", "NW", "SW", "S", "SE", "NE"], id: \.self) { direction in
                                    Text(direction)
                                        .tag(direction)
                                }
                        }
                        .pickerStyle(.palette)
                    })
                    
                    VStack(alignment: .leading) {
                        Text("Rating")  // This acts as your label
                            .font(.headline)
                                           
                        Picker("rating", selection: $session.rating) {
                            ForEach(1...5, id: \.self) { num in
                                Text("\(num)")
                                    .tag(num)
                            }
                        }
                        .pickerStyle(.palette)
                    }
                }
                
                VStack(alignment: .leading, content: {
                    Text("Notes: ")
                        .font(.headline)
                    TextEditor(text: $session.userInput)
                        .frame(height: 50) // Set a fixed height
                })
                
                Section {
                    Button {
                        if session.userId.isEmpty {
                            session.userId = userViewModel.user.id!
                        }
                        sessionViewModel.saveSession(session: session)
                        session.locationName = ""
                        session.rating = 0
                        session.tideHeight = ""
                        session.userInput = ""
                        session.waveHeight = 0
                        session.windDirection = ""
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save Session")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .disabled(session.locationName.isEmpty && ((session.waveHeight <= 0) || session.windDirection.isEmpty || session.tideHeight.isEmpty) || (session.rating <= 0))
                }
                .alert(isPresented: $sessionViewModel.showAlert, content: {
                    Alert(title: Text("Error"), message: Text(sessionViewModel.alertMessage), dismissButton: .default(Text("OK")))
                })
            }
        }
        .navigationTitle("Session Details").navigationBarTitleDisplayMode(.large).toolbar {
            if editable {
                ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            sessionViewModel.deleteSession(id: session.id!)
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "trash")
                                .foregroundStyle(Color.red)
                        }
                    }
            }
       
            }
    }
}

#Preview {
    LogView(session: .constant(SessionModel(
        locationName: "", rating: 0, tideHeight: "", userId: "", userInput: "", waveHeight: 0, windDirection: ""
    )))
}
