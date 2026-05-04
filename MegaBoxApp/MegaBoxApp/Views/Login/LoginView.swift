import SwiftUI
import KakaoSDKUser
import KakaoSDKAuth

struct LoginView: View {
    @State private var viewModel = LoginViewModel() //아이디/비번 저장하고 관리
    @State private var isLoginSuccess: Bool = false //로그인 성공 여부 저장 후 화면 이동
    
    //MARK: AppStorage에 아이디/비번 저장
    // @AppStorage("id") private var savedId: String = ""
    // @AppStorage("pwd") private var savedPwd: String = ""
    
    var body: some View {
        if isLoginSuccess {
            TabBarView()
        } else {
            VStack(spacing: 0) {
                titleGroup
                
                Spacer()
                
                inputGroup
                
                buttonGroup
                    .padding(.top, 66)
                
                joinGroup
                    .padding(.top, 17)
                
                socialGroup
                    .padding(.top, 35)
                    .padding(.bottom, 39)
                
                umcGroup
                    .padding(.bottom, 200)
            }
            .padding(.horizontal, 15)
        }
    }
    
    //MARK: 로그인
    private var titleGroup: some View {
        HStack {
            Text("로그인")
                .font(.pretendard(.semi, size: 24))
                .foregroundStyle(Color.black)
                .padding(.horizontal, 17)
        }
    }
    
    //MARK: 아이디/비번
    private var inputGroup: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("아이디", text: $viewModel.loginModel.id)
                .font(.pretendard(.medium, size: 16))
                .foregroundStyle(Color.black)
            
            Divider()
            
            SecureField("비밀번호", text: $viewModel.loginModel.pwd)
                .font(.pretendard(.medium, size: 16))
                .foregroundStyle(Color.black)
            
            Divider()
        }
        .padding(.horizontal, 15)
    }
    
    //MARK: 로그인 버튼
        private var buttonGroup: some View {
            Button {
                // ⭐️ AppStorage 대신 키체인에 저장!
                KeychainService.shared.savePasswordToKeychain(account: "myLoginID", service: "com.myApp.login", password: viewModel.loginModel.id)
                KeychainService.shared.savePasswordToKeychain(account: "myLoginPW", service: "com.myApp.login", password: viewModel.loginModel.pwd)
                
                isLoginSuccess = true // 저장 후 화면 이동
            } label: {
                Text("로그인")
                    .font(.pretendard(.bold, size: 18))
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(Color.mainPurple)
                    .clipShape(RoundedRectangle(cornerRadius: 36))
            }
        }
    
    //MARK: 회원가입
    private var joinGroup: some View {
        Text("회원가입")
            .font(.pretendard(.medium, size: 13))
            .foregroundStyle(Color.gray)
    }
    
    //MARK: 소셜 로그인
    private var socialGroup: some View {
        HStack {
            Spacer()
            Image("naver")
            
            Spacer()
            Button {
                            // 카카오 로그인 로직 실행
                            kakaoLogin()
                        } label: {
                            Image("kakao")
                        }
            
            Spacer()
            Image("apple")
            
            Spacer()
        }
    }
    
    //MARK: umc 홍보 사진
    private var umcGroup: some View {
        Image("umc")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
    }
    
        // ⭐️ 카카오 로그인을 실행하는 함수입니다.
    private func kakaoLogin() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print("카카오톡 앱 로그인 실패: \(error)")
                }
                else {
                    print("카카오톡 앱 로그인 성공!")
                    if let accessToken = oauthToken?.accessToken {
                        print("받아온 토큰: \(accessToken)")
                        // 과제 조건: 토큰 정보를 키체인에 저장!
                        KeychainService.shared.savePasswordToKeychain(account: "kakaoToken", service: "com.myApp.login", password: accessToken)
                        // isLoginSuccess = true // 원하시면 로그인 성공 처리
                    }
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print("카카오 웹 로그인 실패: \(error)")
                }
                else {
                    print("카카오 웹 로그인 성공!")
                    if let accessToken = oauthToken?.accessToken {
                        print("받아온 토큰: \(accessToken)")
                        // 과제 조건: 토큰 정보를 키체인에 저장!
                        KeychainService.shared.savePasswordToKeychain(account: "kakaoToken", service: "com.myApp.login", password: accessToken)
                        // isLoginSuccess = true // 원하시면 로그인 성공 처리
                    }
                }
            }
        }
    }
}

#Preview("iPhone 11") {
    LoginView()
}

#Preview("iPhone 17 Pro") {
    LoginView()
}
