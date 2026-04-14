//
//  BasicInfoView.swift
//  MegaBox
//
//  Created by 한지민 on 3/27/26.
//

import SwiftUI

struct BasicInfoView: View {
    var body: some View {
        HStack {
            Text("기본정보")
                .font(.pretendard(.bold, size: 18))
                .foregroundStyle(.black)
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    BasicInfoView()
}
