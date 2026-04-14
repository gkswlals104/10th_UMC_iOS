//
//  CombineView.swift
//  MegaBox
//
//  Created by 한지민 on 3/27/26.
//

import SwiftUI

struct CombineView: View {
    
    @State private var isMoveToEdit: Bool = false //편집화면 이동 여부 저장
    
    var body: some View {
        NavigationStack {
            VStack {
                
                HeaderView(isMoveToEdit: $isMoveToEdit)
                
                MembershipView()
                    .padding(.top, 15)
                
                StatusView()
                    .padding(.top, 33)
                
                ReservationView()
                    .padding(.top, 33)
                
                Spacer()
            }

            .background(Color.white)
            .navigationDestination(isPresented: $isMoveToEdit) {
                EditMemberInfoView() //EditMemberInfoView로 이동
            }
        }
    }
}

#Preview {
    CombineView()
}
