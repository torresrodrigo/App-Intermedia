//
//  EventsBaseData.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 19/05/2021.
//

import Foundation

struct EventBaseData: Codable {
    let responseCode: Int?
    let apiDataSource: EventDataSource?
    
    enum CodingKeys: String, CodingKey{
        case responseCode = "code"
        case apiDataSource = "data"
    }
}

