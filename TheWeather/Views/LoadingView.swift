//
//  LoadingView.swift
//  TheWeather
//
//  Created by Muhammad Bin Sohail on 8/12/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        Text("Loading...")
            .font(.system(size: 30, weight: .bold, design: .default))
            .foregroundColor(.white)
    }
}

#Preview {
    LoadingView()
}
