import Foundation

//MARK: 1. 가장 바깥쪽 틀?
struct MovieScheduleResponseDTO: Codable {
    let status: String
    let message: String
    let data: MovieDataDTO
}

//MARK: 2. data 내용
struct MovieDataDTO: Codable {
    let movies: [MovieDTO]
}

//MARK: 3. 영화 정보
struct MovieDTO: Codable {
    let id: String
    let title: String
    let ageRating: String // JSON은 age_rating이지만 앱에서는 ageRating을 쓰기 위해 아래 CodingKeys 사용
    let schedules: [ScheduleDTO]
    
    enum CodingKeys: String, CodingKey {
        case id, title, schedules
        case ageRating = "age_rating"
    }
}

//MARK: 4. 날짜별 스케줄
struct ScheduleDTO: Codable {
    let date: String
    let areas: [AreaDTO]
}

//MARK: 5. 지역 정보
struct AreaDTO: Codable {
    let area: String
    let items: [ItemDTO]
}

//MARK: 6. 상영관 정보
struct ItemDTO: Codable {
    let auditorium: String
    let format: String
    let showtimes: [ShowtimeDTO]
}

//MARK: 7. 실제 상영 시간 및 좌석 정보
struct ShowtimeDTO: Codable {
    let start: String
    let end: String
    let available: Int
    let total: Int
}
