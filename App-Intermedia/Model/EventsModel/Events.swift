//
//  Events.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 19/05/2021.
//

import Foundation

struct Events: Codable {
    
    let id: Int?
    let title: String
    var modified: Date?
    let thumbnail: Thumbnail?
    let comics: ComicsCharacter
    
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case modified
        case thumbnail
        case comics
        
    }
//
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        thumbnail = try values.decodeIfPresent(Thumbnail.self, forKey: .thumbnail)
        comics = try values.decode(ComicsCharacter.self, forKey: .comics)
        let dateString = try values.decodeIfPresent(String.self, forKey: .modified)
        let formattter = DateFormatter.custom
        if let date = formattter.date(from: dateString ?? "nil"){
            modified = date
        } else {
            throw DecodingError.dataCorruptedError(forKey: .modified, in: values, debugDescription: "Date string does not match expected by formatter")
        }
    }
    


}
