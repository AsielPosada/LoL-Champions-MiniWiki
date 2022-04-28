//
//  RemoteDataSource.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 25/04/22.
//

import Foundation
import Combine

/// The collection of available services to call and fetch from the network.
struct RemoteDataSource {
  // MARK: - Properties
  private let networkConstants: NetworkingConstants = NetworkingConstants()

  // MARK: - Methods
  /// Return the list of champions from the network.
  func getChampionList() -> AnyPublisher<[Champion], Error> {
    NetworkLayer<ChampionRootResponse>().fetch(networkConstants.urlPathNameForChampionList)
      .map { response in
        var champions: [Champion] = []
        let data: [String: Champion] = response.data
        for (_, value) in data {
          champions.append(value)
        }
        return champions
      }
      .eraseToAnyPublisher()
  }

  /// Returns all the details of the provided champion ID in the given parameter.
  /// If the champion ID does not exist, it will throw an error.
  func getChampionDetail(_ id: String) -> AnyPublisher<Champion, Error> {
    let path: String = "\(networkConstants.baseURLPathName)/champion/\(id).json"

    return NetworkLayer<ChampionRootResponse>().fetch(path)
      .tryMap { response in
        guard let data: Champion = response.data[id] else { throw AppError.mapError }
        return data
      }
      .eraseToAnyPublisher()
  }
}

