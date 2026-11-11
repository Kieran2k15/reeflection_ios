//
//  DiveListView.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import SwiftUI

struct DiveListView: View {
    
    let api: RFAPI = RFAPI()
    
    @State private var diveList: [Dive]
    @State private var errorMessage: String?

    init(diveList: [Dive] = []) {
        _diveList = State(initialValue: diveList)
    }
    
    var body: some View {
        
        NavigationStack {
            
            List(diveList) { dive in
                
                NavigationLink {
                    DiveView(diveID: dive.id)
                } label: {
                    HStack {
                        Text(dive.startTimeLocalText)
                        Spacer()
                        Text("\(dive.maxDepthMeters, specifier: "%.1f") m")
                    }
                }

            }
            .task {
                await updateList()
            }
        }
    }
    
    func updateList() async {
        
        do {
            self.diveList = try await api.listDives()
        } catch {
            
        }
    }
}

#Preview {
    DiveListView(diveList: Dive.preview)
}
