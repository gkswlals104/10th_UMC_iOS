//
//  EditMemberInfoView.swift
//  MegaBox
//
//  Created by 한지민 on 3/27/26.
//

import SwiftUI

struct EditMemberInfoView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            MemberNavigationView {
                
            }
            .padding(.bottom, 53)
            
            BasicInfoView()
            
            MemberInfoView()
                .padding(.top, 26)
            
            Spacer()
        }
    }
}

#Preview {
    EditMemberInfoView()
}
