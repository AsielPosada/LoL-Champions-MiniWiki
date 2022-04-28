//
//  GeneralEntities.swift
//  PracticeOne
//
//  Created by Giovani Asiel Martinez Posada on 28/04/22.
//  This file contains all the general entities used in the app

import Foundation

/// The enum that handles the current state of a view.
enum ScreenViewState {
  case loading
  case error
  case success
}

/// The error type for this app.
enum AppError: Error {
  /// Indicates that a map action failed.
  case mapError
}
