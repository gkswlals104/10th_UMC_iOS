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
        }
    }
}
