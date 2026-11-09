import SwiftUI

struct LoginView: View {
    
    let api: RFAPI = RFAPI()
    
    let onSignIn: (RFUser) -> Void
    
    var body: some View {
        
        Spacer()
        
        Image("Logo")
            .padding()
        
        GoogleSignInButton {
            Task { await startGoogleAuth() }
        }
        
        Button("Or explore a demo") {
            Task { await startDemo() }
        }
        .buttonStyle(.borderless)
        
        Spacer()
    }
    
    func startDemo() async {
        
        do {
            
            let user = try await self.api.startDemo()
            
            onSignIn(user)
            
        } catch {
            
        }
    }
    
    func startGoogleAuth() async {
        
    }
}

#Preview {
    LoginView { user in
        
    }
}
