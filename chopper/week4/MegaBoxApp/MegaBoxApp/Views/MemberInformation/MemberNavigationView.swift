//
//  NavigationView.swift
//  MegaBox
//
//  Created by 한지민 on 3/27/26.
//

import SwiftUI

struct MemberNavigationView: View {
    let backAction: () -> Void
    
    var body: some View {
        HStack {
            Button {
                backAction()
            } label: {
                Image(systemName: "arrow.left")
                    .foregroundStyle(Color.black)
                    
            }
            
            Spacer()
            Spacer()
            
            Text("회원정보 관리")
                .font(.pretendard(.medium, size: 16))
                .foregroundStyle(.primary)
            
            Spacer()
            
            Image(systemName: "arrow.left")
                .opacity(0)
        }
        .padding(.horizontal, 16)
    }
}


#Preview {
    MemberNavigationView {
    }
}
