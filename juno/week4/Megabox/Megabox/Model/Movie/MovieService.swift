//
//  MovieService.swift
//  Megabox
//
//  Created by 이준성 on 4/5/26.
//

import Foundation

class MovieService {
    static let shared = MovieService()
    
    var chartMovies: [MovieInfoModel] = [
        MovieInfoModel(
            movieImg: "kingsWardenPoster",
            movieTitle: "왕과 사는 남자",
            totalAdmissions: 1475,
            detailImg: "kingsWardenDetailPoster",
            engtitle: "The King's Warden",
            synopsis: "“나는 이제 어디로 갑니까...”\n\n계유정난이 조선을 뒤흔들고\n어린 왕 이홍위는 왕위에서 쫓겨나 유배길에 오른다.\n“무슨 수를 쓰더라도 그 대감을 우리 광천골로 오게 해야지”\n한편, 강원도 영월 산골 마을 광천골의 촌장 엄흥도는 먹고 살기 \n힘든 마을 사람들을 위해 청령포를 유배지로 만들기 위해 노력한다.\n그러나 촌장이 부푼 꿈으로 맞이한 이는 왕위에서 쫓겨난 이홍위였다.\n유배지를 지키는 보수주인으로서 그의 모든 일상을 감시해야만 하는 촌장은 삶의 의지를 잃어버린 이홍위가 점점 신경쓰이는데...\n\n1475년 청령포, 역사가 지우려 했던 이야기.",
            rating: "12",
            releaseDate: "2026.02.04.",
            runningTime: "117",
            genre: "드라마, 사극",
            format: "2D, 2D ATMOS, 디지털영문자막",
            director: "장항준",
            cast: "유해진,박지훈,유지태,전미도,김민,박지환,이준혁,안재홍",
            userReviews: "등록된 관람평이 없어요"
        ),
        
        MovieInfoModel(
            movieImg: "projectPoster",
            movieTitle: "프로젝트 헤일메리",
            totalAdmissions: 56,
            detailImg: "megaBoxDetailPoster",
            engtitle: "Project Hail Mary",
            synopsis: "“죽어가는 태양, 종말 위기에 놓인 지구. 인류의 운명을 건 단 하나의 미션.”\n\n눈을 떠보니 아득한 우주의 한가운데에서 깨어난 중학교 과학교사 '그레이스'는 희미한 기억 속에서 자신이 죽어가는 태양으로부터 지구와 인류를 살릴 마지막 희망으로 이곳에 왔다는 사실을 알게 된다.\n잃어버린 기억으로 인해 혼란스러운 상황 속에서, 그는 우연히 같은 목적으로 온 뜻밖의 존재 '로키'를 만나게 되는데...\n두 행성의 운명을 건 마지막 미션이 시작된다!",
            rating: "12",
            releaseDate: "2026.03.18.",
            runningTime: "156",
            genre: "SF, 스릴러",
            format: "2D, IMAX, 4DX",
            director: "필 로드, 크리스토퍼 밀러",
            cast: "라이언 고슬링, 산드라 휠러",
            userReviews: "원작 소설 팬인데 영화도 완벽하네요! 156분이 순삭입니다."
        ),
        
        MovieInfoModel(
            movieImg: "hoppersPoster",
            movieTitle: "호퍼스",
            totalAdmissions: 302,
            detailImg: "megaBoxDetailPoster",
            engtitle: "Hoppers",
            synopsis: "비버 모드 ON! 좋아, 자연스러웠어!\n\n동물과 자연을 사랑하는 소녀 '메이블'은 할머니와의 소중한 추억이 깃든 연못이 사라질 위기에 놓이자 이를 지키기 위해 고군분투한다.\n어느 날, 사람의 의식을 동물 로봇으로 옮기는 혁신적인 '호핑' 기술을 통해 로봇 비버로 변신해 동물 세계에 잠입하게 된 메이블!\n포유류의 왕 '조지'를 비롯한 다양한 개성을 지닌 동물 친구들과 함께 연못을 지키기 위한 기상천외한 작전을 펼치게 되는데...",
            rating: "5",
            releaseDate: "2026.03.04.",
            runningTime: "104",
            genre: "애니메이션, 어드벤처",
            format: "2D, 3D, 더빙",
            director: "다니엘 총",
            cast: "파이퍼 쿠르다, 바비 모니한, 존 햄",
            userReviews: "픽사 특유의 따뜻함이 살아있는 귀여운 영화입니다. 아이들과 보기 좋아요!"
        ),
        
        MovieInfoModel(
            movieImg: "humintPoster",
            movieTitle: "휴민트",
            totalAdmissions: 375,
            detailImg: "megaBoxDetailPoster",
            engtitle: "HUMINT",
            synopsis: "블라디보스토크 국경에서 벌어지는 숨 막히는 첩보 액션!\n\n동남아시아 일대에서 발생한 국제 범죄 조직을 추적하던 국정원 블랙 요원 조 과장은 휴민트 정보원의 갑작스러운 죽음과 함께 남겨진 암호를 쫓아 블라디보스토크로 향한다.\n그곳에서 북한 식당 종업원 채선화와 접촉하며 새로운 휴민트 작전을 세우지만, 진상을 파악하러 온 북한 보위성 조장 박건과 충돌하게 된다.\n서로 다른 목적과 신념을 가진 남북한 비밀 요원들, 진실을 파헤치기 위한 처절한 격돌이 시작된다.",
            rating: "15",
            releaseDate: "2026.02.11.",
            runningTime: "119",
            genre: "액션, 첩보",
            format: "2D, 2D ATMOS",
            director: "류승완",
            cast: "조인성, 박정민, 박해준, 신세경",
            userReviews: "류승완 감독표 타격감 넘치는 액션은 역시 실망시키지 않네요."
        ),
        
        MovieInfoModel(
            movieImg: "madDancePoster",
            movieTitle: "매드 댄스 오피스",
            totalAdmissions: 134,
            detailImg: "megaBoxDetailPoster",
            engtitle: "Mad Dance Office",
            synopsis: "“난 아무렇게나 춰도 플라멩코야.”\n\n24시간 완벽하게 살아오며 승진만을 바라보던 구청 공무원 '국희'.\n하지만 갑자기 회사와 가정에서 부닥친 위기들로 인해 완벽했던 그녀의 인생이 조금씩 망가지기 시작한다.\n밑바닥에 떨어졌다고 생각한 순간, 우연히 플라멩코 스텝을 밟게 되며 몰랐던 해방감과 희망을 찾아가는데...\n실수조차 나만의 스텝이 될 수 있다! 조금 망해버린 인생을 향한 유쾌한 위로가 시작된다.",
            rating: "12",
            releaseDate: "2026.03.18.",
            runningTime: "110",
            genre: "휴먼, 코미디, 드라마",
            format: "2D",
            director: "조현진",
            cast: "염혜란, 최성은, 우미화, 박호산, 백현진, 아린",
            userReviews: "염혜란 배우의 연기와 플라멩코가 주는 묘한 위로와 카타르시스 ㅠㅠ"
        ),
        
        MovieInfoModel(
            movieImg: "methodPoster",
            movieTitle: "메소드 연기",
            totalAdmissions: 75,
            detailImg: "megaBoxDetailPoster",
            engtitle: "Method Acting",
            synopsis: "코미디 ‘알계인(알코올 중독 외계인)’으로 떠서 평생 알계인으로 기억될 위기에 처한 배우 '이동휘'.\n더 이상 웃기는 연기가 하기 싫어 정극 연기 변신을 꿈꾸던 그에게 톱스타 정태민의 차기작 사극에서 임금 역이 들어온다!\n메소드 연기를 보여주겠다며 공개 금식까지 단행하지만, 첫 촬영부터 NG 연발에 무리한 대본 수정까지 겹치며 현장은 통제 불능 상태로 치닫는다.\n과연 그는 코미디를 벗어나 진정한 '메소드 연기'를 완성할 수 있을까?",
            rating: "12",
            releaseDate: "2026.03.18.",
            runningTime: "105",
            genre: "코미디, 드라마",
            format: "2D",
            director: "이기혁",
            cast: "이동휘, 윤경호, 강찬희, 김금순, 박지환",
            userReviews: "누구나 각자의 삶에서 메소드 연기를 하고 있다는 묵직한 메시지가 좋았습니다."
        ),
        
        MovieInfoModel(
            movieImg: "yearsPoster",
            movieTitle: "28년후 뼈의 사원",
            totalAdmissions: 90,
            detailImg: "megaBoxDetailPoster",
            engtitle: "28 Years Later: The Bone Temple",
            synopsis: "지옥이 된 세상, 변하지 않는 인간의 악랄함.\n\n분노 바이러스 사태 이후 세상이 무너진 지 28년.\n켈슨은 무너진 유럽에서 납골당을 지키며 여생을 수도승처럼 보내고 있다.\n한편, 어린 스파이크를 앞세워 무자비하게 폭력을 행사하며 사이비 신도들 사이에서 두목 행세를 하는 지미 일당.\n어느 날 켈슨의 존재를 알게 된 지미는 그를 신의 재림으로 치부하며 끔찍하고 살벌한 의식을 강요하기 시작하는데...\n좀비보다 더 무서운 묵시록적 세계가 다시 열린다.",
            rating: "19",
            releaseDate: "2026.02.27.",
            runningTime: "109",
            genre: "스릴러, 공포",
            format: "2D",
            director: "니아 다코스타",
            cast: "랄프 파인즈, 잭 오코넬, 앨피 윌리엄스, 에린 켈리먼",
            userReviews: "좀비물인 줄 알았는데 극한 상황 속 인간의 광기가 더 소름 돋네요."
        )
    ]
    
    var upcomingMovies: [MovieInfoModel] = [
        MovieInfoModel(movieImg: "methodPoster", movieTitle: "메소드 연기", totalAdmissions: 75),
        MovieInfoModel(movieImg: "yearsPoster", movieTitle: "28년후 뼈의 사원", totalAdmissions: 90)
    ]
    
    private init() {}
}
