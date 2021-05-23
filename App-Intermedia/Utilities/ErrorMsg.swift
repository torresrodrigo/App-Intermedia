//
//  ErrorMsg.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 18/05/2021.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidData = "Sorry. Something went wrong, try again"
    case invalidResponse = "Server error. Invalid Response"
}
