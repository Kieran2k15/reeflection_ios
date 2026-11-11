//
//  Dive.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import Foundation

nonisolated struct Dive: Decodable, Identifiable, Hashable, Sendable {
    
    let id: String

    let startTimeLocal: Date

    let startTimeUTC: Date?
    let utcOffsetSeconds: Int?

    let durationSeconds: Int
    let maxDepthMeters: Double
    let minTemperatureCelsius: Double?

    let format: String
    let filename: String

    let latitude: Double?
    let longitude: Double?

    let samples: [Sample]

    enum CodingKeys: String, CodingKey {
        case id
        case startTimeLocal = "start_time_local"
        case startTimeUTC = "start_time_utc"
        case utcOffsetSeconds = "utc_offset_s"
        case durationSeconds = "duration_seconds"
        case maxDepthMeters = "max_depth_m"
        case minTemperatureCelsius = "min_temp_c"
        case format
        case filename
        case latitude
        case longitude
        case samples
    }

    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        startTimeLocal = try APIDate.localTime(container.decode(String.self, forKey: .startTimeLocal))
        startTimeUTC = try container.decodeIfPresent(String.self, forKey: .startTimeUTC).map(APIDate.timestamp)
        utcOffsetSeconds = try container.decodeIfPresent(Int.self, forKey: .utcOffsetSeconds)
        durationSeconds = try container.decode(Int.self, forKey: .durationSeconds)
        maxDepthMeters = try container.decode(Double.self, forKey: .maxDepthMeters)
        minTemperatureCelsius = try container.decodeIfPresent(Double.self, forKey: .minTemperatureCelsius)
        format = try container.decode(String.self, forKey: .format)
        filename = try container.decode(String.self, forKey: .filename)
        latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)

        samples = try container.decodeIfPresent([Sample].self, forKey: .samples) ?? []
    }

    var startTimeLocalText: String {
        startTimeLocal.formatted(Date.FormatStyle(date: .abbreviated, time: .shortened, timeZone: .gmt))
    }

    var startDateText: String {
        startTimeLocal.formatted(Date.FormatStyle(date: .abbreviated, time: .omitted, timeZone: .gmt))
    }

    var startClockText: String {
        startTimeLocal.formatted(Date.FormatStyle(date: .omitted, time: .shortened, timeZone: .gmt))
    }

    var durationMinutes: Int {
        Int((Double(durationSeconds) / 60).rounded())
    }

    var averageDepthMeters: Double? {
        guard !samples.isEmpty else { return nil }
        return samples.reduce(0) { $0 + $1.depthMeters } / Double(samples.count)
    }
}
