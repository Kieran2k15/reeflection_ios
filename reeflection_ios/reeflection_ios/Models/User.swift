//
//  RFUser.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import Foundation

nonisolated struct RFUser: Decodable, Hashable, Sendable {
    
    let rktubeID: String
    let email: String
    let name: String
    let readOnly: Bool

    enum CodingKeys: String, CodingKey {
        case rktubeID = "rktube_id"
        case email
        case name
        case readOnly = "read_only"
    }

    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        rktubeID = try container.decode(String.self, forKey: .rktubeID)
        email = try container.decode(String.self, forKey: .email)
        name = try container.decode(String.self, forKey: .name)

        readOnly = try container.decodeIfPresent(Bool.self, forKey: .readOnly) ?? false
    }
}
