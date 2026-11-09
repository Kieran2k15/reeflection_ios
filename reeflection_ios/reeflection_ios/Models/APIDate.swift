//
//  APIDate.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import Foundation

nonisolated enum APIDate {
    
    static let localTimeFormat = Date.ParseStrategy(
        format: "\(year: .defaultDigits)-\(month: .twoDigits)-\(day: .twoDigits)T\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .zeroBased)):\(minute: .twoDigits):\(second: .twoDigits)",
        timeZone: .gmt
    )

    static func localTime(_ text: String) throws -> Date {
        try Date(text, strategy: localTimeFormat)
    }

    static func timestamp(_ text: String) throws -> Date {
        
        let formatter = ISO8601DateFormatter()

        for options: ISO8601DateFormatter.Options in [[.withInternetDateTime, .withFractionalSeconds], [.withInternetDateTime]] {
            
            formatter.formatOptions = options
            
            if let date = formatter.date(from: text) {
                return date
            }
        }

        throw DecodingError.dataCorrupted(.init(codingPath: [],
                                                debugDescription: "Not an RFC 3339 date: \(text)"))
    }
}
