//
//  HomeViewModel.swift
//  MegaBoxApp
//
//  Created by 한지민 on 3/30/26.
//

import Foundation
import Observation

@Observable
class HomeViewModel {
    var movieList: [MovieModel] = [
        MovieModel(
            title: "왕과 사는 남자",
            englishTitle: "The King's Warden",
            audience: "1475만",
            cardImageName: "kings",
            detailImageName: "king2",
            description: "“나는 이제 어디로 갑니까...”\n\n계유정난이 조선을 뒤흔들고 어린 왕 이홍위는 왕위에서 쫓겨나 유배길에 오른다.\n“무슨 수를 쓰더라도 그 대감을 우리 광친골로 오게 해야지”\n한편, 강원도 영월 산골 마을 광친골의 촌장 임호든은 먹고 살기 힘든 마을 사람들을 위해 청령포를 유배지로 만들기 위해 노력한다.\n그러나 춘장이 꾸꾼 꿈으로 맞이한 이는 왕위에서 쫓겨난 이홍위였다.\n유배지로 지키는 보수구인으로서 그와 모든 일상을 감시해야 하는 춘장은 삶의 의지를 잃어버린 이홍위가 점점 신경 쓰이는데...\n\n1457년 청령포, 역사가 지우려 했던 이야기.",
            age: "12세 이상 관람가",
            openInfo: "2026.02.04. 개봉 · 117분",
            genre: "드라마, 사극",
            type: "2D, 2D ATMOS, 디지털영문자막",
            director: "장하준",
            cast: "유해진, 박지훈, 유기태, 전미도, 김민, 박지환, 이준혁, 안재홍"
        ),
        MovieModel(
            title: "프로젝트 해일",
            englishTitle: "Project Tide",
            audience: "56만",
            cardImageName: "hail",
            detailImageName: "hail",
            description: "거대한 재난 속에서 살아남기 위한 사람들의 이야기.",
            age: "12세 이상 관람가",
            openInfo: "2026.02.11. 개봉 · 110분",
            genre: "재난, 드라마",
            type: "2D",
            director: "홍길동",
            cast: "배우1, 배우2"
        ),
        MovieModel(
            title: "호피스",
            englishTitle: "Hoppies",
            audience: "32만",
            cardImageName: "hoppers",
            detailImageName: "hoppers",
            description: "귀여운 친구들이 펼치는 모험 이야기.",
            age: "전체 관람가",
            openInfo: "2026.02.18. 개봉 · 98분",
            genre: "애니메이션",
            type: "2D",
            director: "김감독",
            cast: "성우1, 성우2"
        )
    ]
    
    var selectedMovie: MovieModel?
}
