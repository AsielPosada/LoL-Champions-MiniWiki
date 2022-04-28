//
//  NetworkLayer.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 21/04/22.
//

import Foundation
import Combine

// MARK: NetworkDataSource
/// A generic network layer, used for fetching data from the network
struct NetworkLayer<T:Decodable> {
  // MARK: - Methods
  func fetch(_ path: String) -> AnyPublisher<T, Error> {
    let networkConstants: NetworkingConstants = NetworkingConstants()
    var baseURLComponent: URLComponents {
      var components: URLComponents = URLComponents()
      components.scheme = networkConstants.baseURLScheme
      components.host = networkConstants.baseURLHost
      components.path = path
      return components
    }

    guard let finalURL: URL = baseURLComponent.url else {
      preconditionFailure("Bad URL")
    }

    return URLSession.shared.dataTaskPublisher(for: finalURL)
      .map { $0.data }
      .decode(type: T.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}
