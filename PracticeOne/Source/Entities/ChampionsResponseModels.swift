//
//  ChampionsResponseModels.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 20/04/22.
//

import Foundation

// MARK: - Root struct
struct ChampionRootResponse: Codable {
  let type: String
  let format: String
  let version: String
  let data: [String: Champion]
}

// MARK: - Champion struct
struct Champion: Codable, Equatable, Comparable {
  var id: String = ""
  var name: String = ""
  var title: String = ""
  var tags: [ChampionRoleType] = []
  var lore: String?
  var allytips: [String]?
  var enemytips: [String]?
  var info: ChampionBasicPuntuation?

  static func < (lhs: Champion, rhs: Champion) -> Bool {
    lhs.name < rhs.name
  }

  static func == (lhs: Champion, rhs: Champion) -> Bool {
    lhs.name == rhs.name
  }
}

// MARK: - ChampionBasicPuntuation struct
struct ChampionBasicPuntuation: Codable {
  let attack: Int
  let defense: Int
  let magic: Int
  let difficulty: Int
}

// MARK: - ChampionRoleType enum
enum ChampionRoleType: String, Codable {
  case assassin = "Assassin"
  case fighter = "Fighter"
  case mage = "Mage"
  case marksman = "Marksman"
  case support = "Support"
  case tank = "Tank"
}
