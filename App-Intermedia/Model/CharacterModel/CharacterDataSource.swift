//
//  CharacterDataSource.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 17/05/2021.
//

import Foundation

struct CharacterDataSource : Codable {

    let characters: [Characters]?
    let limit: Int?
    
    
    enum CodingKeys: String, CodingKey{
        case characters = "results"
        case limit
    }
//
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        characters = try values.decodeIfPresent([Characters].self, forKey: .characters)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encodeIfPresent(self.characters, forKey: .characters)
    }
    
}
