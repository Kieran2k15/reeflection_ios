//
//  DiveSummaryGridView.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/11/26.
//

import SwiftUI

struct DiveSummaryGridView: View {

    let dive: Dive

    private let columns = [GridItem(.adaptive(minimum: 140), spacing: 12)]

    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 12) {
            
            DiveSummaryTileView(title: "Max depth",
                                stat: depthText(dive.maxDepthMeters),
                                icon: "arrow.down.to.line")
            
            DiveSummaryTileView(title: "Average depth",
                                stat: dive.averageDepthMeters.map(depthText) ?? "Unknown",
                                icon: "water.waves")
            
            DiveSummaryTileView(title: "Duration",
                                stat: "\(dive.durationMinutes) min",
                                icon: "clock")
            
            DiveSummaryTileView(title: "Min temp",
                                stat: dive.minTemperatureCelsius.map { "\(Int($0.rounded())) °C" } ?? "Unknown",
                                icon: "thermometer.medium")
        }
        .padding()
    }

    private func depthText(_ meters: Double) -> String {
        "\(meters.formatted(.number.precision(.fractionLength(1)))) m"
    }
}

#Preview {
    DiveSummaryGridView(dive: Dive.preview[0])
}
