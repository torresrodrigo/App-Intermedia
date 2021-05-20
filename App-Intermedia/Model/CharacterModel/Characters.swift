//
//  Characters.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 14/05/2021.
//

import Foundation

struct Characters: Codable {
    
    var id: Int
    var name: String
    var description : String?
    var thumbnail: Thumbnail?
    var comics : ComicsCharacter?
}
