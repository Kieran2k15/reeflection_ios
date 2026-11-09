//
//  DiveListView.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import SwiftUI

struct DiveListView: View {
    
    let api: RFAPI = RFAPI()
    
    @State private var diveList: [Dive] = []
    @State private var errorMessage: String?
    
    var body: some View {
        
        List(diveList) { dive in
            NavigationLink {
                DiveView(diveID: dive.id)
            } label: {
                Text(dive.id)
            }

        }
        .task {
            await updateList()
        }
    }
    
    func updateList() async {
        
        do {
            self.diveList = try await api.listDives()
        } catch {
            
        }
    }
}
