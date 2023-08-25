//
//  BackgroundView.swift
//  WSIDT
//
//  Created by Aaron Ciminelli on 8/24/23.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("appicon1") // Assuming "appicon1.png" is in your asset catalog
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundView()
}
