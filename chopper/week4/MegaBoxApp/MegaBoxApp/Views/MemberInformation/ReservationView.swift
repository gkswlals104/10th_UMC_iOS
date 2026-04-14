//
//  ReservationView.swift
//  MegaBox
//
//  Created by 한지민 on 3/27/26.
//

import SwiftUI

struct ReservationView: View {
    
    var body: some View {
        HStack {
        
            // 영화별 예매
            VStack(spacing: 12) {
                Image("movie")
                    .resizable()
                    .frame(width: 36, height: 36)
                
                Text("영화별예매")
                    .font(.pretendard(.medium, size: 16))
                    .foregroundStyle(Color.black)
            }
            Spacer()
            
            // 극장별 예매
            VStack(spacing: 12) {
                Image("theater")
                    .resizable()
                    .frame(width: 36, height: 36)
                
                Text("극장별예매")
                    .font(.pretendard(.medium, size: 16))
                    .foregroundStyle(Color.black)
            }
            Spacer()
            
            
            // 특별관 예매
            VStack(spacing: 12) {
                Image("special")
                    .resizable()
                    .frame(width: 36, height: 36)
                
                Text("특별관예매")
                    .font(.pretendard(.medium, size: 16))
                    .foregroundStyle(Color.black)
            }
            Spacer()
            
            // 모바일 오더
            VStack(spacing: 12) {
                Image("mobile")
                    .resizable()
                    .frame(width: 36, height: 36)
                
                Text("모바일오더")
                    .font(.pretendard(.medium, size: 16))
                    .foregroundStyle(Color.black)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    ReservationView()
}
