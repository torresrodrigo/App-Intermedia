//
//  ComicCharacter.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 19/05/2021.
//

import Foundation

struct ComicsCharacter : Codable{
    let items : [Items]
}

struct Items : Codable {
    var name : String
}
