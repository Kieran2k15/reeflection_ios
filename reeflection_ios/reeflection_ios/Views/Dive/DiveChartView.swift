//
//  DiveChartView.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/11/26.
//

import SwiftUI
import Charts

enum DiveMetric: String, CaseIterable, Identifiable {

    case temp, pressure, ppo2, ndl

    var id: Self { self }

    var label: String {
        switch self {
            case .temp: "Temp (°C)"
            case .pressure: "Tank (bar)"
            case .ppo2: "PPO2 (bar)"
            case .ndl: "NDL (min)"
        }
    }

    var color: Color {
        switch self {
            case .temp: .orange
            case .pressure: .indigo
            case .ppo2: .pink
            case .ndl: .green
        }
    }

    func value(_ sample: Sample) -> Double? {
        switch self {
            case .temp: sample.temperatureCelsius
            case .pressure: sample.tankPressures.first?.pressureBar
            case .ppo2: sample.ppo2Bar
            case .ndl:
                if let seconds = sample.noDecoSeconds {
                    min(seconds / 60, 99)
                } else {
                    nil
                }
        }
    }
}

struct DiveChartView: View {

    let dive: Dive

    @State private var shownMetrics: Set<DiveMetric> = []
    
    var body: some View {

        if dive.samples.count <= 1 {
            
            Text("Dive profile samples are not available")
                .foregroundStyle(.secondary)
                .padding()
            
        } else {
            
            let data = DiveChartData(samples: dive.samples)

            VStack(alignment: .leading, spacing: 12) {

                // Buttons that control the visible metrics
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(data.availableMetrics) { metric in
                            
                            Toggle(metric.label, isOn: isShown(metric))
                                .toggleStyle(.button)
                                .tint(metric.color)
                        }
                    }
                    .font(.caption)
                }
                .scrollIndicators(.hidden)

                metricChart(data)
                    .frame(height: 280)
            }
            .padding()
        }
    }

    private func metricChart(_ data: DiveChartData) -> some View {

        let metrics = DiveMetric.allCases.filter { metric in shownMetrics.contains(metric) }
        
        let rightAxis = metrics.count == 1 ? metrics.first : nil

        return Chart {

            // Depth chart
            ForEach(data.samples, id: \.seconds) { sample in
                
                AreaMark(x: .value("Time", sample.minutes),
                         y: .value("Depth", sample.depthMeters))
                    .foregroundStyle(.blue.opacity(0.12))

                LineMark(x: .value("Time", sample.minutes),
                         y: .value("Depth", sample.depthMeters),
                         series: .value("Line", "Depth"))
                    .foregroundStyle(.blue)
            }

            // Other metrics
            ForEach(metrics) { metric in
                
                ForEach(data.samples, id: \.seconds) { sample in
                    
                    if let value = metric.value(sample) {
                        
                        LineMark(x: .value("Time", sample.minutes),
                                 y: .value("Depth", data.toDepth(value, metric)),
                                 series: .value("Line", metric.label))
                            .foregroundStyle(metric.color)
                    }
                }
            }
        }
        .chartXScale(domain: 0...data.lastMinute)
        .chartYScale(domain: .automatic(reversed: true))
        .chartYAxis {
            
            AxisMarks(position: .leading)
            
            if let rightAxis {
                
                AxisMarks(position: .trailing, values: [0, data.maxDepth / 2, data.maxDepth]) { value in
                    
                    AxisValueLabel {
                        
                        if let depth = value.as(Double.self) {
                            
                            Text(data.fromDepth(depth, rightAxis), format: .number.precision(.fractionLength(0...2)))
                                .foregroundStyle(rightAxis.color)
                        }
                    }
                }
            }
        }
        .chartXAxisLabel("Minutes", position: .bottom, alignment: .center)
        .chartYAxisLabel("Depth (m)", position: .leading, alignment: .center)
    }

    private func isShown(_ metric: DiveMetric) -> Binding<Bool> {
        
        Binding(
            get: { shownMetrics.contains(metric) },
            set: { on in
                if on { shownMetrics.insert(metric) } else { shownMetrics.remove(metric) }
            }
        )
    }
}

#Preview {
    ScrollView {
        DiveChartView(dive: Dive.preview[0])
    }
}
