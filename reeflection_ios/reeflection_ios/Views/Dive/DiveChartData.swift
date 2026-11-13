//
//  DiveChartData.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/12/26.
//

import Foundation

struct DiveChartData {

    let samples: [Sample]
    let maxDepth: Double
    let lastMinute: Double

    private let ranges: [DiveMetric: (low: Double, high: Double)]

    init(samples: [Sample]) {

        self.samples = samples
        maxDepth = samples.map { sample in sample.depthMeters }.max() ?? 1
        lastMinute = samples.last?.minutes ?? 1

        var ranges: [DiveMetric: (low: Double, high: Double)] = [:]
        for metric in DiveMetric.allCases {
            let values = samples.compactMap { sample in metric.value(sample) }
            if let low = values.min(), let high = values.max() {
                ranges[metric] = (low, high)
            }
        }
        self.ranges = ranges
    }

    var availableMetrics: [DiveMetric] {
        DiveMetric.allCases.filter { metric in ranges[metric] != nil }
    }

    func range(_ metric: DiveMetric) -> (low: Double, high: Double)? {
        ranges[metric]
    }

    // Map an arbitrary value to the depth range
    func toDepth(_ value: Double, _ metric: DiveMetric) -> Double {

        guard let range = ranges[metric], range.high > range.low else { return maxDepth / 2 }

        return (range.high - value) / (range.high - range.low) * maxDepth
    }

    func fromDepth(_ depth: Double, _ metric: DiveMetric) -> Double {

        guard let range = ranges[metric] else { return 0 }

        return range.high - depth / maxDepth * (range.high - range.low)
    }
}
