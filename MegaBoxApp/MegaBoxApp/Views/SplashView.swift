//
//  SplashView.swift
//  MegaBox
//
//  Created by 한지민 on 3/20/26.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color.white
                .ignoresSafeArea()

            Image("megaboxLogo")
        }
    }
}

#Preview("iPhone 11") {
    SplashView()
}

#Preview("iPhone 17 Pro") {
    SplashView()
}
