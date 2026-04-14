//
//  MovieReserveViewModel.swift
//  MegaBoxApp
//
//  Created by 한지민 on 4/6/26.
//

import Foundation
import Combine

final class MovieReserveViewModel: ObservableObject {
    @Published var selectedMovieIndex: Int? = nil
    @Published var selectedTheaters: [String] = []
    @Published var selectedDateIndex: Int? = nil

    @Published var isTheaterEnabled: Bool = false
    @Published var isDateEnabled: Bool = false
    @Published var showSchedule: Bool = false

    private var bag = Set<AnyCancellable>()

    let calendar = Calendar.current
    let today = Date()

    init() {
        $selectedMovieIndex
            .sink { [weak self] movieIndex in
                guard let self = self else { return }
                self.isTheaterEnabled = movieIndex != nil
                if movieIndex == nil {
                    self.selectedTheaters = []
                    self.selectedDateIndex = nil
                    self.isDateEnabled = false
                    self.showSchedule = false
                }
            }
            .store(in: &bag)

        $selectedTheaters
            .sink { [weak self] theaters in
                guard let self = self else { return }
                self.isDateEnabled = !theaters.isEmpty
                if theaters.isEmpty {
                    self.selectedDateIndex = nil
                    self.showSchedule = false
                }
            }
            .store(in: &bag)

        $selectedDateIndex
            .sink { [weak self] dateIndex in
                guard let self = self else { return }
                self.showSchedule =
                    self.selectedMovieIndex != nil &&
                    !self.selectedTheaters.isEmpty &&
                    dateIndex != nil
            }
            .store(in: &bag)
    }
}
