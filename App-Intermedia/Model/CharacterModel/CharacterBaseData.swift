//
//  CharacterBaseData.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 17/05/2021.
//

import Foundation

struct CharacterBaseData: Codable {
    let responseCode: Int?
    let apiDataSource: CharacterDataSource?
    
    enum CodingKeys: String, CodingKey{
        case responseCode = "code"
        case apiDataSource = "data"
    }
}
