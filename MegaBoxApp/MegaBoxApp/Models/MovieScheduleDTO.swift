import Foundation

// 1. 가장 바깥쪽 껍데기
struct MovieScheduleResponseDTO: Codable {
    let status: String
    let message: String
    let data: MovieDataDTO
}

// 2. data 안의 내용
struct MovieDataDTO: Codable {
    let movies: [MovieDTO]
}

// 3. 개별 영화 정보
struct MovieDTO: Codable {
    let id: String
    let title: String
    let ageRating: String // JSON은 age_rating이지만 앱에서는 ageRating을 쓰기 위해 아래 CodingKeys 사용
    let schedules: [ScheduleDTO]
    
    enum CodingKeys: String, CodingKey {
        case id, title, schedules
        case ageRating = "age_rating" //여기서 매핑
    }
}

// 4. 날짜별 스케줄
struct ScheduleDTO: Codable {
    let date: String
    let areas: [AreaDTO]
}

// 5. 지역 정보 (강남, 홍대 등)
struct AreaDTO: Codable {
    let area: String
    let items: [ItemDTO]
}

// 6. 상영관 정보 (크리클라이너 1관, 2D 등)
struct ItemDTO: Codable {
    let auditorium: String
    let format: String
    let showtimes: [ShowtimeDTO]
}

// 7. 가장 안쪽: 실제 상영 시간 및 좌석 정보
struct ShowtimeDTO: Codable {
    let start: String
    let end: String
    let available: Int
    let total: Int
}
