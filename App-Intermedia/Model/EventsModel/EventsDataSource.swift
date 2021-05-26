//
//  EventsDataSource.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 21/05/2021.
//

import Foundation

struct EventsDataSource : Codable {

    var events: [Events]?
    let limit: Int?
    
    
    enum CodingKeys: String, CodingKey{
        case events = "results"
        case limit
    }
//
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        events = try values.decode([Events].self, forKey: .events)
        limit = try values.decodeIfPresent(Int.self, forKey: .limit)
    }
    
    func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: CodingKeys.self)
        try values.encodeIfPresent(self.events, forKey: .events)
        }
    
}
