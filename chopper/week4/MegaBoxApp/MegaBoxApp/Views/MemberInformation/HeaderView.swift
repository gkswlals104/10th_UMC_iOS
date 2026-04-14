//
//  HeaderView.swift
//  MegaBox
//
//  Created by 한지민 on 3/27/26.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - 로그인 할 때 저장한 거 가져오기
    @Binding var isMoveToEdit: Bool
    @AppStorage("name") private var userName: String = ""
    
    var body: some View {
        HStack(alignment: .top) {
            leftSection
            
            Spacer()
            
            memberButton
        }
        .padding(.horizontal, 16)
        .padding(.top, 59)
    }
    
    // MARK: - 왼쪽 영역
    private var leftSection: some View {
        VStack(alignment: .leading, spacing: 9) {
            
            
            HStack(spacing: 5) {
                Text("\(userName)님")
                    .font(.pretendard(.bold, size: 24))
                
                Text("WELCOME")
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.teal)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            
            HStack(spacing: 9) {
                Text("멤버십 포인트")
                    .font(.pretendard(.semi, size: 14))
                    .foregroundStyle(Color.gray04)
                
                Text("포인트 값 입력")
                    .font(.pretendard(.medium, size: 14))
                    .foregroundStyle(Color.black)
            }
            
        }
    }
    
    // MARK: - 회원정보 버튼
    private var memberButton: some View {
        Button {
            isMoveToEdit.toggle()
        } label: {
            Text("회원정보")
                .font(.pretendard(.semi, size: 14))
                .foregroundStyle(Color.white)
                .padding(.horizontal, 11.5)
                .padding(.vertical, 4)
                .background(Color.gray07)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#Preview {
    HeaderView(isMoveToEdit: .constant(false))
}
