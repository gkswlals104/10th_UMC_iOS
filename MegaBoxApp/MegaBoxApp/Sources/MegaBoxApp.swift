import SwiftUI
import KakaoSDKCommon //
import KakaoSDKAuth   //

@main
struct MegaBoxApp: App {
    
    //MARK: 앱이 켜질 때 카카오 SDK를 초기화
    init() {
        //MARK: 아까 확인한 네이티브 앱 키를 여기에 넣기
        KakaoSDK.initSDK(appKey: "0a48170795842d5aa700f0cdd79fbf79")
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
                // ⭐️ 추가: 카카오톡에서 로그인을 마치고 다시 우리 앱으로 돌아올 때 처리하는 코드입니다.
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
}
