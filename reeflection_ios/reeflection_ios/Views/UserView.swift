//
//  UserView.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import SwiftUI

struct UserView: View {
    
    let user: RFUser
    let onSignOut: () -> ()
    
    let api = RFAPI()
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            UserAvatarView(name: user.name, size: 64)
            Text(user.name)
            Text(user.email)
            
            Spacer()
            
            Button {
                onSignOut()
            } label: {
                Text("Sign out")
            }
            
            Spacer()

        }
        .padding(8)
    }
}

#Preview {
    SummaryView()
}
