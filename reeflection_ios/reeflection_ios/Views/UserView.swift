//
//  UserView.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import SwiftUI

struct UserView: View {
    
    let api = RFAPI()
    let user: RFUser
    
    var body: some View {
        
        VStack {
            UserAvatarView(name: user.name, size: 64)
            Text(user.name)
            Text(user.email)
        }
        .padding(8)
    }
}

#Preview {
    SummaryView()
}
