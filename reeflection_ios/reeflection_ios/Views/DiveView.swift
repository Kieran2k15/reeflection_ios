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
    
    var body: some View {
        
        Group {
            if let dive {
                VStack {
                    Text(dive.id)
                }
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
    DiveView(diveID: "")
}
