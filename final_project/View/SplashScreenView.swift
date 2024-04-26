//
//  SplashScreenView.swift
//  final_project
//
//  Created by Kyle Zimmerman on 4/25/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all)
            Image("app-icon")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFit()
        }
    }
}

#Preview {
    SplashScreenView()
}
