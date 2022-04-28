//
//  ChampionListCellView.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 21/04/22.
//

import SwiftUI

// MARK: Champion ListCell View
/// A VStack that renders the champion name and the roles that have.
struct ChampionListCellView: View {
  // MARK: - Properties
  let champion: Champion
  private let constants: Constants = Constants()

  // MARK: - Body
  var body: some View {
    VStack(alignment: .leading, spacing: .zero) {
      Text(champion.name)
        .font(constants.titleFont)
      HStack {
        ForEach(champion.tags, id: \.self) { tag in
          RoleTagView(type: tag)
        }
      }
    }
  }
}

// MARK: Constants
fileprivate struct Constants {
  let titleFont: Font = .title3
}

// MARK: Preview
struct ChampionListCellView_Previews: PreviewProvider {
  static var previews: some View {
    ChampionListCellView(champion: Champion(id: "", name: "Twitch", title: "The rat", tags: [.marksman, .assassin], lore: nil, allytips: nil, enemytips: nil, info: nil))
      .previewLayout(.sizeThatFits)
  }
}
