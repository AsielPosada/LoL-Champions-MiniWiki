//
//  ChampionListViewModel.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 21/04/22.
//

import Foundation
import Combine

// MARK: ChampionList ViewModel
final class ChampionListViewModel: ObservableObject {
  // MARK: - Properties
  @Published var champions: [Champion] = []
  @Published var viewState: ScreenViewState = .loading
  private var suscription: AnyCancellable?

  // MARK: - Methods
  func requestChampions() {
    suscription = RemoteDataSource().getChampionList()
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { status in
        switch status {
        case .failure(_):
          self.viewState = .error
        case .finished:
          self.viewState = .success
        }
      }, receiveValue: { [weak self] value in
        guard let self: ChampionListViewModel = self else { return }
        self.champions = value.sorted(by: <)
      })
  }
}
