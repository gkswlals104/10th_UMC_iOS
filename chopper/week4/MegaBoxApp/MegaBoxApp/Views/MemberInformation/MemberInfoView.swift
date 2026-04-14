//
//  MemberInfoView.swift
//  MegaBox
//
//  Created by 한지민 on 3/27/26.
//

import SwiftUI

struct MemberInfoView: View {
    
    @AppStorage("id") private var userId: String = ""
    @AppStorage("name") private var userName: String = ""
    
    @State private var inputName: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // 아이디
            Text(userId)
                .font(.pretendard(.medium, size: 18))
                .foregroundStyle(.black)
            
            Divider()
                .foregroundStyle(Color.gray02)
                .padding(.top, 3)
            
            // 이름 + 버튼
            HStack {
                TextField("", text: $inputName)
                    .font(.pretendard(.medium, size: 18))
                    .foregroundStyle(.black)
                
                Button {
                    userName = inputName
                } label: {
                    Text("변경")
                        .font(.pretendard(.medium, size: 10))
                        .foregroundStyle(Color.gray03)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 1)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray03, lineWidth: 1)
                        }
                }
            }
            .padding(.top, 24) //로그인 밑줄과 이름 사이 간격
            
            Divider()
                .foregroundStyle(Color.gray02)
                .padding(.top, 3)
        }
        .padding(.horizontal, 16)
        .onAppear {
            inputName = userName
        }
    }
}

#Preview {
    MemberInfoView()
}
