import SwiftUI

struct LoginView: View {
    @State private var viewModel = LoginViewModel() //아이디/비번 저장하고 관리
    @State private var isLoginSuccess: Bool = false //로그인 성공 여부 저장 후 화면 이동
    
    //MARK: AppStorage에 아이디/비번 저장
    @AppStorage("id") private var savedId: String = ""
    @AppStorage("pwd") private var savedPwd: String = ""
    
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
            savedId = viewModel.loginModel.id
            savedPwd = viewModel.loginModel.pwd
            isLoginSuccess = true
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
            Image("kakao")
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
}

#Preview("iPhone 11") {
    LoginView()
}

#Preview("iPhone 17 Pro") {
    LoginView()
}
