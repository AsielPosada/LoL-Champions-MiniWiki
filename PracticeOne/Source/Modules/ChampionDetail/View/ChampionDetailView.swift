//
//  ChampionDetailView.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 21/04/22.
//

import SwiftUI

// MARK: ChampionDetail View
struct ChampionDetailView: View {
  // MARK: - Properties
  @StateObject var viewModel: ChampionDetailViewModel
  private let constants: Constants = Constants()
  
  // MARK: - Body
  var body: some View {
    if viewModel.viewState == .loading {
      loadingView()
    }
    if viewModel.viewState == .error {
      errorView()
    }
    if viewModel.viewState == .success {
      mainView()
    }
  }
  
  // MARK: - ViewBuilders
  @ViewBuilder func mainView() -> some View {
    ScrollView {
      VStack(alignment: .leading) {
        Text(viewModel.champion.title)
          .font(constants.championTitleFont)
        
        HStack {
          ForEach(viewModel.champion.tags, id: \.self) { type in
            RoleTagView(type: type)
          }
        }
        
        if let stats: ChampionBasicPuntuation = viewModel.champion.info {
          StatsViewerView(stats: [
            constants.statAttack: stats.attack,
            constants.statMagic: stats.magic,
            constants.statDefense: stats.defense,
            constants.statDifficulty: stats.difficulty
          ])
        }
        
        Text(viewModel.champion.lore ?? "")
          .font(constants.championLoreFont)
        
        if let allyTips: [String] = viewModel.champion.allytips,
           !allyTips.isEmpty {
          TipsViewerView(title: constants.allyTipsSection, tips: allyTips)
            .padding(.top, constants.tipSectionTopPadding)
        }

        if let enemyTips: [String] = viewModel.champion.enemytips,
           !enemyTips.isEmpty {
          TipsViewerView(title: constants.enemyTipsSection, tips: enemyTips)
            .padding(.top, constants.tipSectionTopPadding)
        }
      }
      .padding(.horizontal, constants.mainHorizontalPadding)
    }
    .navigationTitle(viewModel.champion.name)
  }
  
  @ViewBuilder func loadingView() -> some View {
    VStack {
      ProgressView()
      Text(constants.loadingText)
    }
    .padding()
    .onAppear {
      viewModel.requestChampion()
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
  // Font
  let championTitleFont: Font = .title3
  let championLoreFont: Font = .body
  
  // Layout
  let mainHorizontalPadding: CGFloat = 10.0
  let tipSectionTopPadding: CGFloat = 10.0

  // Text
  let allyTipsSection: String = "Ally tips"
  let enemyTipsSection: String = "Enemy tips"
  let statAttack: String = "Attack"
  let statDefense: String = "Defense"
  let statMagic: String = "Magic"
  let statDifficulty: String = "Difficulty"
  let loadingText: String = "Loading"
  let errorText: String = "Something went wrong"
  let errorButtonText: String = "Try again"
}
