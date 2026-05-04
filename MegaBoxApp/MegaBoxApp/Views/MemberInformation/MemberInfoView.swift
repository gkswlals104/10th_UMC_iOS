//
//  MemberInfoView.swift
//  MegaBox
//
//  Created by 한지민 on 3/27/26.
//

import SwiftUI

struct MemberInfoView: View {
    
    // ⭐️ 1. AppStorage를 지우고 State로 바꿨습니다.
    @State private var userId: String = ""
    @State private var userName: String = "" // 필요하다면 이름도 키체인에 따로 저장할 수 있지만, 우선 State로 둡니다.
    
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
                    // 💡 참고: 변경된 이름을 유지하고 싶다면 여기서도 키체인이나 서버에 저장하는 로직이 들어가야 합니다.
                    // 이번 과제의 필수 조건은 아니니 일단 둡니다!
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
            // ⭐️ 2. 화면이 뜰 때(onAppear) 키체인에서 아까 로그인할 때 저장한 아이디를 불러옵니다!
            if let savedID = KeychainService.shared.load(account: "myLoginID", service: "com.myApp.login") {
                self.userId = savedID
                self.inputName = savedID // 텍스트필드 기본값으로도 넣어줍니다.
            }
        }
    }
}

#Preview {
    MemberInfoView()
}
