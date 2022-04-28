//
//  PracticeOneApp.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 20/04/22.
//

import SwiftUI

@main
struct PracticeOneApp: App {
  var body: some Scene {
    WindowGroup {
      ChampionListView(viewModel: ChampionListViewModel())
    }
  }
}
