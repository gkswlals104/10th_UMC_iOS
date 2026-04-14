//
//  UserInfoView.swift
//  Megabox
//
//  Created by 이준성 on 3/22/26.
//

import SwiftUI

struct UserInfoView: View {
    @AppStorage("userName") var userName: String = ""
    
    var body: some View {
        NavigationStack {
            VStack{
                ProfileHeader
                ClubMembershipBtn
                StatusInfo
                TicketingView
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 59)
        }
    }
    
    //MARK: ProfileHeader
    private var ProfileHeader: some View{
        VStack{
            HStack{
                HStack(spacing: 10){
                    Text("\(userName)님")
                        .font(.bold24)
                    Text("WELCOME")
                        .font(.medium14)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(.customLightBlue))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                }
                Spacer()
                
                NavigationLink(destination: UserInfoManageView()){
                    Text("회원정보")
                        .font(.semiBold14)
                        .padding(4)
                        .padding(.horizontal, 6)
                        .background(Color(.gray07))
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            
            HStack(spacing: 9){
                Text("멤버십 포인트")
                    .font(.semiBold14)
                    .foregroundStyle(.gray04)
                Text("포인트값 입력")
                    .font(.medium14)
                Spacer()
            }
        }
    }
    
    //MARK: ClubMembershipBtn
    private var ClubMembershipBtn: some View{
        Button{
            
        } label:{
            HStack{
                Text("클럽 멤버십")
                    .font(.semiBold16)
                    .foregroundStyle(.white)
                Image(systemName: "chevron.right")
                    .font(.system(size:16))
                    .foregroundStyle(.white)
            }
            .padding(.vertical, 12)
            .padding(.leading, 8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 46)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.67, green: 0.56, blue: 0.96),
                        Color(red: 0.56, green: 0.76, blue: 0.92),
                        Color(red: 0.36, green: 0.76, blue: 0.92)
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.top, 15)
    }
    
    //MARK: StatusInfo
    private var StatusInfo: some View{
        HStack{
            VStack{
                Text("쿠폰")
                    .font(.system(size: 18))
                    .foregroundStyle(.gray02)
                Text("2")
                    .font(.system(size: 19, weight: .medium))
                    .padding(.top, 2)
            }
            .frame(maxWidth:.infinity)

            Divider()
                .frame(height: 31)
                .background(Color(.gray02))
            VStack{
                Text("스토어 교환권")
                    .font(.system(size: 18))
                    .foregroundStyle(.gray02)
                Text("0")
                    .font(.system(size: 19, weight: .medium))
                    .padding(.top, 2)
            }
            .frame(maxWidth:.infinity)

            Divider()
                .frame(height: 31)
                .background(Color(.gray02))
            VStack{
                Text("모바일 티켓")
                    .font(.system(size: 18))
                    .foregroundStyle(.gray02)
                Text("0")
                    .font(.system(size: 19, weight: .medium))
                    .padding(.top, 2)
            }
            .frame(maxWidth:.infinity)
        }
        .padding(.vertical, 12)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.gray02), lineWidth: 1)
        )
        .padding(.top, 33)
    }
    
    //MARK: TicketingView
    private var TicketingView: some View{
        HStack{
            Button{
                
            } label: {
                VStack{
                    Image("ticketFilm")
                    Text("영화별예매")
                        .font(.medium16)
                        .foregroundStyle(.black)
                        .padding(.top, 2)
                }
            }
            Spacer()
            Button{
                
            } label: {
                VStack{
                    Image("ticketPin")
                    Text("극장별예매")
                        .font(.medium16)
                        .foregroundStyle(.black)
                        .padding(.top, 2)
                }
            }
            Spacer()
            Button{
                
            } label: {
                VStack{
                    Image("ticketSofa")
                    Text("특별관예매")
                        .font(.medium16)
                        .foregroundStyle(.black)
                        .padding(.top, 2)
                }
            }
            Spacer()
            Button{
                
            } label: {
                VStack{
                    Image("ticketPopcorn")
                    Text("모바일오더")
                        .font(.medium16)
                        .foregroundStyle(.black)
                        .padding(.top, 2)
                }
            }
        }
        .padding(.top, 33)
    }

}



#Preview {
    UserInfoView()
}
