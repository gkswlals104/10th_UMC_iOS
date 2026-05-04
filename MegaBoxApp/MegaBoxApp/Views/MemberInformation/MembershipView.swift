//
//  MembershipView.swift
//  MegaBox
//
//  Created by 한지민 on 3/27/26.
//

import SwiftUI

struct MembershipView: View {
    
    var body: some View {
        HStack {
            Text("클럽 멤버십")
                .font(.pretendard(.semi, size: 16))
                .foregroundStyle(Color.white)
            
            Image(systemName: "chevron.right")
                .foregroundStyle(Color.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(
            LinearGradient(
                colors: [
                    Color(red: 177/255, green: 139/255, blue: 255/255), // 연보라
                    Color(red: 142/255, green: 174/255, blue: 243/255),  // 연파랑
                    Color(red: 93/255, green: 204/255, blue: 236/255)  // 연민트
                ],
                //왼->오 그라데이션
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.black, lineWidth: 1)
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    MembershipView()
}
