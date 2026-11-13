//
//  DiveView.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import SwiftUI

struct DiveView: View {
    
    let diveID: String
    let api = RFAPI()
    
    @State private var dive: Dive?

    init(diveID: String, dive: Dive? = nil) {
        self.diveID = diveID
        _dive = State(initialValue: dive)
    }
    
    var body: some View {
        
        ScrollView {
            
            if let dive {
                
                VStack(alignment: .leading) {
                    
                    Text(dive.startDateText)
                        .font(.title)
                    
                    Text(dive.startClockText)
                        .font(.headline)
                        .foregroundStyle(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.horizontal, .top])
                
                DiveSummaryGridView(dive: dive)
                
                DiveChartView(dive: dive)
                
            } else {
                ProgressView()
            }
        }
        .task {
            await fetchDive(diveID: diveID)
        }
    }
    
    func fetchDive(diveID: String) async {
        
        do {
            self.dive = try await self.api.dive(id: diveID)
        } catch {
            
        }
    }
}

#Preview {
    DiveView(diveID: Dive.preview[0].id, dive: Dive.preview[0])
}
