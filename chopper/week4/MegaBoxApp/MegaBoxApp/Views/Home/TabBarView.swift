//
//  TabBarView.swift
//  MegaBoxApp
//
//  Created by 한지민 on 3/30/26.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            Tab("홈", systemImage: "house") {
                HomeView()
            }

            Tab("바로예매", systemImage: "play.laptopcomputer") {
                CombineView()
            }
            
            Tab("모바일오더", systemImage: "popcorn") {
                CombineView()
            }
            
            Tab("마이페이지", systemImage: "person") {
                CombineView()
            }

        }
    }
}

#Preview {
    TabBarView()
}
