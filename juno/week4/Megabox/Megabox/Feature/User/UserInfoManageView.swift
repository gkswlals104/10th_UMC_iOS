//
//  UserInfoManageView.swift
//  Megabox
//
//  Created by 이준성 on 3/22/26.
//

import SwiftUI

struct UserInfoManageView: View {
    @Environment(\.dismiss) private var dismiss
    
    @AppStorage("saved_id") var userId: String = ""
    @AppStorage("userName") var userName: String = "이준성"
    
    @State private var inputName: String = ""
    
    var body: some View {
        VStack{
            NavigationHeader
            BasicInfo
            UserTextField
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden(true)
    }
    
    private var NavigationHeader: some View {
        ZStack{
            HStack{
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 17))
                        .foregroundStyle(.black)
                }
                Spacer()
            }
            Text("회원정보 관리")
                .font(.medium16)
        }
    }
    
    private var BasicInfo: some View {
        HStack{
            Text("기본정보")
                .font(.bold18)
            Spacer()
        }
        .padding(.top, 53)
    }
    
    private var UserTextField: some View {
        VStack{
            HStack{
                Text(userId)
                    .font(.medium18)
                    .padding(.top, 26)
                Spacer()
            }
            Divider()
                .background(Color(.gray02))
            
            HStack{
                TextField("이름", text: $inputName)
                    .font(.medium18)
                
                Button(action: {
                    userName = inputName
                }) {
                    Text("변경")
                        .font(.medium10)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .foregroundStyle(.gray03)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color(.gray02), lineWidth: 1)
                        )
                }
            }
            .padding(.top, 24)

            Divider()
                .background(Color(.gray02))
        }
    }
    
}

#Preview {
    UserInfoManageView()
}
