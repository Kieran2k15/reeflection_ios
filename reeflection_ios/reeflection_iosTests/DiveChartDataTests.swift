//
//  DiveChartDataTests.swift
//  reeflection_iosTests
//
//  Created by Kieran Crawford on 11/12/26.
//

import Foundation
import Testing
@testable import reeflection_ios

@MainActor
struct DiveChartDataTests {

    let data = DiveChartData(samples: Dive.preview[0].samples)

    @Test func axisRanges() {
        #expect(data.maxDepth == 31)
        #expect(data.lastMinute == 42)
    }

    @Test func allMetricsAvailable() {
        #expect(data.availableMetrics == [.temp, .pressure, .ppo2, .ndl])
    }

    @Test func missingMetricsAreNotAvailable() throws {
        let samples = try decodeSamples("""
            [{"t": 0, "depth_m": 0}, {"t": 60, "depth_m": 10, "temp_c": 20}]
            """)
        let data = DiveChartData(samples: samples)
        #expect(data.availableMetrics == [.temp])
    }

    @Test func temperatureRange() throws {
        let range = try #require(data.range(.temp))
        #expect(range.low == 27.5)
        #expect(range.high == 33)
    }

    @Test func highestValueAtTopLowestAtBottom() {
        #expect(data.toDepth(33, .temp) == 0)
        #expect(data.toDepth(27.5, .temp) == 31)
    }

    @Test func roundTrip() {
        let depth = data.toDepth(30, .temp)
        #expect(abs(data.fromDepth(depth, .temp) - 30) < 0.0001)
    }

    @Test func flatMetricGoesInTheMiddle() throws {
        let samples = try decodeSamples("""
            [{"t": 0, "depth_m": 0, "temp_c": 20}, {"t": 60, "depth_m": 10, "temp_c": 20}]
            """)
        let data = DiveChartData(samples: samples)
        #expect(data.toDepth(20, .temp) == 5)
    }

    @Test func ndlIsCappedAt99Minutes() {
        #expect(DiveMetric.ndl.value(Dive.preview[0].samples[0]) == 99)
    }

    private func decodeSamples(_ json: String) throws -> [Sample] {
        try JSONDecoder().decode([Sample].self, from: Data(json.utf8))
    }
}
