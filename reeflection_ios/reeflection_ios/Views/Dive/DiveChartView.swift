//
//  DiveChartView.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/11/26.
//

import SwiftUI
import Charts

struct DiveChartView: View {
    
    let dive: Dive
    
    var body: some View {
        
        if (dive.samples.count > 0) {
            
            Chart(dive.samples, id:\.seconds) { sample in
                
                AreaMark(
                    x: .value("Time", Double(sample.seconds) / 60),
                    y: .value("Depth", sample.depthMeters)
                )
                .foregroundStyle(.blue.opacity(0.2))

                LineMark(
                    x: .value("Time", Double(sample.seconds) / 60),
                    y: .value("Depth", sample.depthMeters)
                )
                .foregroundStyle(.blue)
            }
            .chartYScale(domain: .automatic(reversed: true))
            .chartXAxisLabel("min")
            .chartYAxisLabel("m")
            .frame(height: 260)
            .padding()
            
        } else {
            Text("Dive profile samples are not available")
        }
    }
}

#Preview {
    DiveChartView(dive: Dive.preview[0])
}
