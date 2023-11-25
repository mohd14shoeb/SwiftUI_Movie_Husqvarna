//
//  ProgressCircleView.swift
//  Movie_Husqvarna
//
//  Created by Shoeb Khan on 25/11/23.
//

import SwiftUI

struct ProgressCircleView: View {

    // MARK: Body
    var body: some View {
        VStack(alignment: .center) {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                .padding(.vertical, 20)
        }
        .frame(width: 30, height: 30)
    }
}

#Preview {
    ProgressCircleView()
}
