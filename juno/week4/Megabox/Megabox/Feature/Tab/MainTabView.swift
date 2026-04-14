//
//  MainTabView.swift
//  Megabox
//
//  Created by 이준성 on 3/27/26.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            Tab("홈", systemImage: "house", value: 0){
                HomeView()
            }
            Tab("바로 예매", systemImage: "play.laptopcomputer", value: 1){
                TicketingView()
            }
            Tab("모바일 오더", systemImage : "popcorn", value: 2){
                Text("오더 화면")
            }
            Tab("마이 페이지", systemImage: "person", value: 3){
                UserInfoView()
            }
        }
        .tint(.black)
        
    }
}

#Preview {
    MainTabView()
}
