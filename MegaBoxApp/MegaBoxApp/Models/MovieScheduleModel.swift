//
//  MovieScheduleModel.swift
//  MegaBoxApp
//
//  Created by 한지민 on 4/27/26.
//

import Foundation

// MARK: 상영 스케줄

struct MovieScheduleModel: Identifiable {
    let id: String
    let title: String
    let ageRating: String
    let schedules: [ScheduleModel]
}

struct ScheduleModel {
    let date: Date
    let areas: [AreaModel]
}

struct AreaModel {
    let areaName: String
    let theaters: [TheaterModel]
}

struct TheaterModel: Identifiable {
    let id = UUID()
    let auditorium: String
    let format: String
    let showtimes: [ShowtimeModel]
}

struct ShowtimeModel: Identifiable {
    let id = UUID()
    let startTime: String
    let endTime: String
    let availableSeats: Int
    let totalSeats: Int
}


// MARK: Domain Model
extension MovieDTO {
    
    func toDomain() -> MovieScheduleModel {
        return MovieScheduleModel(
            id: self.id,
            title: self.title,
            ageRating: self.ageRating,
            schedules: self.schedules.map { $0.toDomain() }
        )
    }
}

extension ScheduleDTO {
    func toDomain() -> ScheduleModel {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let parsedDate = formatter.date(from: self.date) ?? Date()
        
        return ScheduleModel(
            date: parsedDate,
            areas: self.areas.map { $0.toDomain() }
        )
    }
}

extension AreaDTO {
    func toDomain() -> AreaModel {
        return AreaModel(
            areaName: self.area,
            theaters: self.items.map { $0.toDomain() }
        )
    }
}

extension ItemDTO {
    func toDomain() -> TheaterModel {
        return TheaterModel(
            auditorium: self.auditorium,
            format: self.format,
            showtimes: self.showtimes.map { $0.toDomain() }
        )
    }
}

extension ShowtimeDTO {
    func toDomain() -> ShowtimeModel {
        return ShowtimeModel(
            startTime: self.start,
            endTime: self.end,
            availableSeats: self.available,
            totalSeats: self.total
        )
    }
}
