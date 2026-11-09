//
//  Sample.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import Foundation

nonisolated struct Sample: Decodable, Hashable, Sendable {
    
    let seconds: Int
    let depthMeters: Double
    let temperatureCelsius: Double?
    let ppo2Bar: Double?
    let noDecoSeconds: Double?
    let tankPressures: [TankPressure]

    enum CodingKeys: String, CodingKey {
        case seconds = "t"
        case depthMeters = "depth_m"
        case temperatureCelsius = "temp_c"
        case ppo2Bar = "ppo2_bar"
        case noDecoSeconds = "ndl_s"
        case tankPressures = "tank_pressures"
    }

    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        seconds = try container.decode(Int.self, forKey: .seconds)
        depthMeters = try container.decode(Double.self, forKey: .depthMeters)
        temperatureCelsius = try container.decodeIfPresent(Double.self, forKey: .temperatureCelsius)
        ppo2Bar = try container.decodeIfPresent(Double.self, forKey: .ppo2Bar)
        noDecoSeconds = try container.decodeIfPresent(Double.self, forKey: .noDecoSeconds)

        tankPressures = try container.decodeIfPresent([TankPressure].self, forKey: .tankPressures) ?? []
    }
}

nonisolated struct TankPressure: Decodable, Hashable, Sendable {
    
    let ref: String
    let pressureBar: Double

    enum CodingKeys: String, CodingKey {
        case ref
        case pressureBar = "pressure_bar"
    }
}
