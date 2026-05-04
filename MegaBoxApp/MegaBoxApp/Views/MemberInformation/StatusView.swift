//
//  StatusView.swift
//  MegaBox
//
//  Created by 한지민 on 3/27/26.
//

import SwiftUI

struct StatusView: View {
    
    var body: some View {
        HStack {
            
            // 쿠폰
            VStack {
                Spacer()
                Text("쿠폰")
                    .font(.pretendard(.semi, size: 16))
                    .foregroundStyle(Color.gray02)
                
                Spacer()
                
                Text("2")
                    .font(.pretendard(.semi, size: 18))
                    .foregroundStyle(Color.black)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            
            Divider()
                .frame(height: 31)
            
            // 스토어 교환권
            VStack {
                Spacer()
                Text("스토어 교환권")
                    .font(.pretendard(.semi, size: 16))
                    .foregroundStyle(Color.gray02)
                
                Spacer()
                
                Text("0")
                    .font(.pretendard(.semi, size: 18))
                    .foregroundStyle(Color.black)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            
            
            Divider()
                .frame(height: 31)
            
            
            // 모바일 티켓
            VStack {
                Spacer()
                Text("모바일 티켓")
                    .font(.pretendard(.semi, size: 16))
                    .foregroundStyle(Color.gray02)
                
                Spacer()
                
                Text("0")
                    .font(.pretendard(.semi, size: 18))
                    .foregroundStyle(Color.black)
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 76) // ⭐ 핵심 (Spacer 효과 살리기)
        .padding(.horizontal, 12)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray02, lineWidth: 1)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    StatusView()
}
