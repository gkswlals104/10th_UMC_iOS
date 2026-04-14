//
//  TheaterView.swift
//  Megabox
//
//  Created by 이준성 on 3/27/26.
//


import SwiftUI

struct TheaterView: View {
    @State private var theaterViewModel = TheaterViewModel()
    
    var body: some View {
        
        @Bindable var bindableViewModel = theaterViewModel
        
        VStack{
            //버튼 영역
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 1){
                    ForEach(theaterViewModel.theaters) { theater in
                        VStack{
                            Button {
                                withAnimation {
                                    theaterViewModel.selectedTheater = theater
                                }
                            } label: {
                                Image(theater.logoImg)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                            }
                            .buttonBorderShape(.circle)
                            .buttonStyle(.glass)
                            
                            Circle()
                                .fill(theaterViewModel.selectedTheater?.id == theater.id ? Color.purple03 : Color.clear)
                                .frame(width: 10, height: 10)
                            
                        }
                    }
                }
                .padding(.top, 10)
            }
            
            // 버튼별 사진 영역
            //GeometryReader를 사용해 현재 기기의 가로 너비를 가져옴
            GeometryReader { geometry in
                let cardSize = geometry.size.width
                
                TabView(selection: $bindableViewModel.selectedTheater) {
                    ForEach(theaterViewModel.theaters) { theater in
                        ZStack(alignment: .topLeading) {
                            
                            Image(theater.theaterImg)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: cardSize, height: cardSize) // 측정한 가로 너비로 정사각형 만듬
                            
                            VStack(alignment: .leading){
                                Text(theater.theaterTitle)
                                    .font(.bold28)
                                    .foregroundStyle(.white)
                                
                                Text(theater.theaterDesc)
                                    .font(.medium18)
                                    .foregroundStyle(.white)
                                    .padding(.top, 2)
                            }
                            .padding(32)
                        }
                        // ZStack 자체를 잘라냄
                        .clipShape(RoundedRectangle(cornerRadius: 36))
                        .tag(theater as TheaterModel?)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }
            // GeometryReader 영역 자체가 정사각형 되도록
            .aspectRatio(1.0, contentMode: .fit)
        }
    }
}

#Preview {
    TheaterView()
}

