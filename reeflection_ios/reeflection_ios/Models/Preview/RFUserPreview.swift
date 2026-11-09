import Foundation

extension RFUser {
    
    static let preview = try! JSONDecoder().decode(RFUser.self, from: Data("""
        {
            "rktube_id": "00000000-0000-0000-5afe-00000000dec0", 
            "email": 
            "barrycuda@reeflection.ai", 
            "name": "Barry Cuda", 
            "read_only": true
        }
        """.utf8))
}
