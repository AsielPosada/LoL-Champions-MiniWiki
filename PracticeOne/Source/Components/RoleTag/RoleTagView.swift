//
//  RoleTagView.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 26/04/22.
//

import SwiftUI

// MARK: RoleTag View
/// A single chip style tag that renders the role with a paired style.
struct RoleTagView: View {
  // MARK: - Properties
  let type: ChampionRoleType
  private let constants: Constants = Constants()

  // MARK: - Body
  var body: some View {
    Text(type.rawValue)
      .font(constants.font)
      .fontWeight(constants.weight)
      .foregroundColor(getColor(from: type))
      .padding(.horizontal, constants.horizontalPadding)
      .padding(.vertical, constants.verticalPadding)
      .background(getColor(from: type).opacity(constants.backgroundOpacity))
      .cornerRadius(constants.radius)
  }

  // MARK: - Private methods
  private func getColor(from type: ChampionRoleType) -> Color {
    switch type {
    case .assassin:
      return .red
    case .fighter:
      return .orange
    case .mage:
      return .blue
    case .marksman:
      return .yellow
    case .support:
      return .pink
    case .tank:
      return .green
    }
  }
}

// MARK: Constants
fileprivate struct Constants {
  // Container
  let horizontalPadding: CGFloat = 6.0
  let verticalPadding: CGFloat = 4.0
  let backgroundOpacity: CGFloat = 0.12
  let radius: CGFloat = .infinity
  // Text
  let font: Font = .caption
  let weight: Font.Weight = .bold
}

// MARK: Preview
struct RoleTagView_Previews: PreviewProvider {
  static var previews: some View {
    RoleTagView(type: .marksman)
      .previewLayout(.sizeThatFits)
  }
}
