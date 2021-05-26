//
//  Characters.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 14/05/2021.
//

import Foundation

struct Characters: Codable {
    
    let id: Int
    let name: String
    let description : String?
    let thumbnail: Thumbnail?
    let comics : ComicsCharacter?
}
