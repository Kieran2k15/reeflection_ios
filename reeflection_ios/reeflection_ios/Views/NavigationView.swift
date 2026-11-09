//
//  NavigationView.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import SwiftUI

struct NavigationView: View {
    
    let user: RFUser
    let onSignOut: () -> ()
    
    var body: some View {
        
        TabView {
            
            Tab("Summary", systemImage: "chart.bar") {
                NavigationStack {
                    SummaryView()
                }
            }

            Tab("Dives", systemImage: "list.bullet") {
                NavigationStack {
                    DiveListView()
                }
            }
            
            Tab("You", systemImage: "person.crop.circle") {
                NavigationStack {
                    UserView(user: user, onSignOut: onSignOut)
                }
            }
        }
    }
}

#Preview {
    NavigationView(user: .preview) {
        
    }
}
