//
//  SessionModel.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/24/24.
//

import Foundation
import FirebaseFirestore

struct SessionModel: Codable, Identifiable {
    @DocumentID var id: String?
    var locationName: String
    var rating: Int
    var tideHeight: String
    var userId: String
    var userInput: String
    var waveHeight: Int
    var windDirection: String
}
