//
//  TipsViewerView.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 28/04/22.
//

import SwiftUI

// MARK: TipsViewer View
struct TipsViewerView: View {
  // MARK: - Properties
  let title: String
  let tips: [String]
  private let constants: Constants = Constants()

  // MARK: - Body
  var body: some View {
    VStack(alignment: .leading) {
      HStack {
        Text(title)
          .font(constants.titleFont)
        VStack {
          Divider()
        }
      }
      ForEach(0..<tips.count) { index in
        tipRow(index: index + 1, text: tips[index])
      }
    }
  }

  // MARK: - ViewBuilder
  @ViewBuilder private func tipRow(index: Int, text: String) -> some View {
    HStack(alignment: .top) {
      Text("\(index)")
        .fontWeight(constants.indexWeight)
        .foregroundColor(constants.indexColor)
        .padding()
        .background(.regularMaterial)
        .clipShape(Circle())
      VStack(alignment: .leading) {
        Text(text)
          .font(constants.tipFont)
      }
    }
  }
}

// MARK: Constants
fileprivate struct Constants {
  let titleFont: Font = .title3
  let indexWeight: Font.Weight = .bold
  let indexColor: Color = .accentColor
  let tipFont: Font = .body
}

struct TipsViewerView_Previews: PreviewProvider {
  static var previews: some View {
    TipsViewerView(title: "Ally tips", tips: ["Be aware", "Be aware", "Be aware"])
      .previewLayout(.sizeThatFits)
  }
}
