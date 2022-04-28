//
//  ChampionDetailViewModel.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 21/04/22.
//

import Foundation
import Combine

final class ChampionDetailViewModel: ObservableObject {
  // MARK: - Properties
  @Published var champion: Champion
  @Published var viewState: ScreenViewState = .loading
  private var suscription: AnyCancellable?

  // MARK: - Initializers
  init(_ champion: Champion) {
    self.champion = champion
  }

  // MARK: - Methods
  func requestChampion() {
    suscription = RemoteDataSource().getChampionDetail(champion.id)
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { state in
        switch state {
        case .failure(_):
          self.viewState = .error
        case .finished:
          self.viewState = .success
        }
      }, receiveValue: { [weak self] value in
        guard let self: ChampionDetailViewModel = self else { return }
        self.champion = value
      })
  }
}
