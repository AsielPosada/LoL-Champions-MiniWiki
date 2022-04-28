//
//  StatsViewerView.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 26/04/22.
//

import SwiftUI
import OrderedCollections

// MARK: StatsViewer View
/// Provided a dictionary and it will renders the Text with the paired valued in a `ProgressView`, the max value is 10.
struct StatsViewerView: View {
  // MARK: - Properties
  let stats: OrderedDictionary<String, Int>
  private let constants: Constants = Constants()

  // MARK: - Body
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        ForEach(stats.keys, id: \.self) { text in
          Text(text)
        }
      }
      VStack {
        ForEach(stats.values, id: \.self) { value in
          ProgressView(value: Double(value), total: constants.maxValue)
            .frame(maxHeight: .infinity)
        }
      }
    }
  }
}

// MARK: Constants
fileprivate struct Constants {
  let maxValue: Double = 10.0
}

// MARK: Preview
struct PuntuationViewerView_Previews: PreviewProvider {
  static var previews: some View {
    StatsViewerView(stats: [
      "Attack": 8,
      "Defense": 10
    ])
      .previewLayout(.sizeThatFits)
  }
}
