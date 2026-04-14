//
//  TheaterViewModel.swift
//  Megabox
//
//  Created by 이준성 on 3/27/26.
//

import Foundation
import Observation

@Observable
class TheaterViewModel{
    var selectedTheater: TheaterModel?
    
    var theaters : [TheaterModel] = [
        TheaterModel(logoImg: "dolbyCinemaLogo", theaterImg: "dolbyCinemaImg", theaterTitle: "DOLBY CINEMA", theaterDesc: "완벽한 영화 관람을 완성하는\n하이엔드 시네마"),
         TheaterModel(logoImg: "dolbyVisionAtmosLogo", theaterImg: "dolbyVisionAtmosImg", theaterTitle: "DOLBY VISION+ATMOS", theaterDesc: "돌비 시네마의 선명한 영상과 압도적인 사운드,\n리클라이너를 더한 프리미엄 클래스"),
         TheaterModel(logoImg: "mx4dLogo", theaterImg: "mx4dImg", theaterTitle: "MEGA|MX4D", theaterDesc: "다이내믹 이팩트가 선사하는 \n새로운 영화 체험"),
         TheaterModel(logoImg: "dolbyAtmosLogo", theaterImg: "dolbyAtmosImg", theaterTitle: "MEGA|DOLBY ATMOS", theaterDesc: "차원이 다른 공간감과 디테일한 사운드"),
         TheaterModel(logoImg: "ledLogo", theaterImg: "ledImg", theaterTitle: "MEGA|LED", theaterDesc: "무한대의 명암비, 완벽한 컬러 재현력"),
         TheaterModel(logoImg: "boutiquePrivateLogo", theaterImg: "boutiquePrivateImg", theaterTitle: "BOUTIQUE PRIVATE by MEGA", theaterDesc: "오직 나와 소중한 사람들을 위한 \n프라이빗한 극장 경험"),
         TheaterModel(logoImg: "boutiqueSuiteLogo", theaterImg: "boutiqueSuiteImg", theaterTitle: "BOUTIQUE SUITE by MEGA", theaterDesc: "웰컴 패키지가 더해진 \n럭셔리한 공간 경험"),
         TheaterModel(logoImg: "boutiqueLogo", theaterImg: "boutiqueImg", theaterTitle: "BOUTIQUE by MEGA", theaterDesc: "섬세하게 디자인된 감각적인 \n극장 경험"),
         TheaterModel(logoImg: "leReclinerLogo", theaterImg: "leReclinerImg", theaterTitle: "LE RECLINER by MEGA", theaterDesc: "맞춤형 리클라이닝 시스템이 구현하는 \n극장의 편안함"),
         TheaterModel(logoImg: "comfortLogo", theaterImg: "comfortImg", theaterTitle: "COMFORT by MEGA", theaterDesc: "컴포트 체어로 누리는 \n더 안락한 영화 경험"),
        ]
    
        init() {
            if let firstTheater = theaters.first {
                self.selectedTheater = firstTheater
        }
    }
}
