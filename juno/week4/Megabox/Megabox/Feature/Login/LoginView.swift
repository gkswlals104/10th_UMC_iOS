//
//  LoginView.swift
//  Megabox
//
//  Created by 이준성 on 3/16/26.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("saved_id") var savedId: String = ""
    @AppStorage("saved_pwd") var savedPwd: String = ""
    
    @Environment(LoginViewModel.self) private var loginViewModel
    @Environment(AuthManager.self) private var authManager
    
    var body: some View {
        GeometryReader{_ in //키보드 올라왔을때 화면 올라오기 방지
            VStack{
                loginHeaderView
                Spacer()
                loginInputSection
                loginActionButton
                signUpLinkView
                socialLoginGroup
                promotionBannerView
            }
            .padding(.horizontal, 17)
        }
        .ignoresSafeArea(.keyboard, edges: .all)
    }
        
    private var loginHeaderView: some View {
        HStack{
            Text("로그인")
                .font(.semiBold24)
                .foregroundStyle(.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 20)
    }
        
    private var loginInputSection: some View {
        @Bindable var bindableViewModel = loginViewModel
        return VStack{
            VStack{
                TextField("아이디", text: $bindableViewModel.loginModel.id)
                    .foregroundStyle(Color.gray03)

                Divider()
                    .background(Color.gray02)
            }
            .padding(.bottom, 24)
            VStack{
                SecureField("비밀번호", text: $bindableViewModel.loginModel.pwd)
                    .foregroundStyle(Color.gray03)
                
                Divider()
                    .background(Color.gray02)
            }
        }
    }
    
    private var loginActionButton: some View {
        Button { // 회원가입 페이지 없으므로 일단 그냥 저장하고 바로 인증
            savedId = loginViewModel.loginModel.id
            savedPwd = loginViewModel.loginModel.pwd
            
            if(savedId == loginViewModel.loginModel.id && savedPwd == loginViewModel.loginModel.pwd){
                authManager.isLoggedIn = true
            }
        } label: {
            Text("로그인")
                .font(.bold18)
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(Color(.purple03))
                .clipShape(RoundedRectangle(cornerRadius: 46))
                .foregroundStyle(Color.white)
        }
        .padding(.top, 74.98)
    }
    
    private var signUpLinkView: some View {
        Button {
            print("signUp btn clicked")
        } label: {
            Text("회원가입")
                .foregroundStyle(.gray04)
        }
        .padding(.top, 17)

    }
    
    private var socialLoginGroup: some View {
        HStack{
            Button {
                print("naver btn clicked")
            } label : {
                Image("NaverLoginBtn")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            
            Spacer()
            
            Button {
                print("kakao btn clicked")
            } label : {
                Image("KakaoLoginBtn")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            
            Spacer()
            
            Button {
                print("apple btn clicked")
            } label : {
                Image("AppleLoginBtn")
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            
        }
        .padding(.horizontal, 71)
        .padding(.vertical, 35)
    }
    
    private var promotionBannerView: some View {
        Image("umc")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 210)
    }
    
}


#Preview {
    LoginView()
        .environment(LoginViewModel())
        .environment(AuthManager())
}
