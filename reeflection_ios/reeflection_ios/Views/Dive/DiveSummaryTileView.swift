//
//  DiveSummaryTileView.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/11/26.
//

import SwiftUI

struct DiveSummaryTileView: View {
    
    let title: String
    let stat: String
    let icon: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Label(title, systemImage: icon)
                .font(.caption)
                .foregroundStyle(.secondary)
            
            Text(stat)
                .font(.title2.weight(.semibold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.fill.tertiary, in: .rect(cornerRadius: 12))
    }
}
