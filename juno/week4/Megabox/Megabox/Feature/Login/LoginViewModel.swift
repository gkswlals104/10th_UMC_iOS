//
//  LoginViewModel.swift
//  Megabox
//
//  Created by 이준성 on 3/21/26.
//

import Foundation
import Observation

@Observable
class LoginViewModel {
    var loginModel: LoginModel = LoginModel(id: "", pwd: "")
}
