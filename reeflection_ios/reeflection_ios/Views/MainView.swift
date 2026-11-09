//
//  MainView.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import SwiftUI
import Playgrounds

struct MainView: View {
    
    @State private var user: RFUser?
    
    var body: some View {
        
        if let user = user {
            NavigationView(user: user, onSignOut: onSignOut)
        } else {
            LoginView { user in
                self.user = user
            }
        }
    }
    
    func onSignOut() {
        self.user = nil
    }
}

#Preview {
    MainView()
}

#Playground {
    _ = 1 + 2
}

