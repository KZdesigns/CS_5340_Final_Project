//
//  LogView.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/24/24.
//

import SwiftUI

struct LogView: View {
    @State private var locationName: String = ""
    @State private var waveHeight: Int = 0
    @State private var windDirection: String = ""
    @State private var tideHeight: String = ""
    @State private var rating: Int = 0
    @State private var userInput: String = ""
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Surf Session Details")) {
                    VStack(alignment: .leading, content: {
                        Text("Enter Surf Location")
                            .font(.headline)
                        TextField("Location Name", text: $locationName)
                    })
                    
                    
                    VStack(alignment: .leading, content: {
                        Text("Wave Height")
                            .font(.headline)
                        Picker("waveHeight", selection: $waveHeight) {
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
                        Picker("tideHeight", selection: $tideHeight) {
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
                        Picker("windDirection", selection: $windDirection) {
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
                                           
                        Picker("rating", selection: $rating) {
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
                    TextEditor(text: $userInput)
                        .frame(height: 50) // Set a fixed height
                })
                
                Section {
                    Button {
                        print("Save Session")
                    } label: {
                        Text("Save Session")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .disabled(locationName.isEmpty && ((waveHeight > 0) || windDirection.isEmpty || tideHeight.isEmpty) || (rating > 0))
                }
            }
        }
    }
}

#Preview {
    LogView()
}
