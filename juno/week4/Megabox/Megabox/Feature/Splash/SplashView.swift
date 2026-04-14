//
//  SplashView.swift
//  Megabox
//
//  Created by 이준성 on 3/16/26.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            
            Image("megaboxLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 249, height: 84)
        }
    }
}

#Preview {
    SplashView()
}
