//
//  MovieCardView.swift
//  Megabox
//
//  Created by 이준성 on 3/27/26.
//

import SwiftUI

struct MovieCardView: View {
    var movie: MovieInfoModel
    
    var body: some View {
        VStack(alignment:. leading){
            Image(movie.movieImg)
            Button {
                
            } label: {
                Text("바로 예매")
                    .font(.medium16)
                    .frame(width: 148, height: 36, alignment: .center)
                    .foregroundStyle(.purple03)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.purple03)
                    )
                
            }
            .padding(.top, 6)
            Text(movie.movieTitle)
                .font(.bold22)
                .lineLimit(1)
                .padding(.top, 4)
            
            Text("누적관객수 \(movie.totalAdmissions)만")
                .font(.medium18)
                

        }
    }
}

#Preview {
    MovieCardView(movie: MovieInfoModel(
            movieImg: "kingsWardenPoster",
            movieTitle: "왕과 사는 남자",
            totalAdmissions: 1475
        ))}
