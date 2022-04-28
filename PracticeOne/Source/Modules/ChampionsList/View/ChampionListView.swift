//
//  ChampionListView.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 20/04/22.
//

import SwiftUI

// MARK: ChampionList View
struct ChampionListView: View {
  // MARK: - Properties
  @StateObject var viewModel: ChampionListViewModel
  private let constants: Constants = Constants()

  // MARK: - Body
  var body: some View {
    if viewModel.viewState == .loading {
      loadingView()
    }
    if viewModel.viewState == .error {
      errorView()
    }
    if viewModel.viewState == .success{
      NavigationView {
        List(0..<viewModel.champions.count) { index in
          let champion: Champion = viewModel.champions[index]
          NavigationLink {
            ChampionDetailView(viewModel: ChampionDetailViewModel(champion))
          } label: {
            ChampionListCellView(champion: champion)
          }
        }
        .navigationBarTitle(Text(constants.titleText))
      }
    }
  }

  // MARK: - ViewBuilders
  @ViewBuilder func loadingView() -> some View {
    VStack {
      ProgressView()
      Text(constants.loadingText)
    }
    .padding()
    .onAppear {
      viewModel.requestChampions()
    }
  }

  @ViewBuilder func errorView() -> some View {
    VStack {
      Text(constants.errorText)
      Button(constants.errorButtonText) {
        viewModel.viewState = .loading
      }
    }
    .padding()
  }
}

// MARK: Constants
fileprivate struct Constants {
  let titleText: String = "Champions"
  let loadingText: String = "Loading"
  let errorText: String = "There is an error"
  let errorButtonText: String = "Try again"
}
