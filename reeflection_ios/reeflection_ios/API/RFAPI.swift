//
//  RFAPI.swift
//  reeflection_ios
//
//  Created by Kieran Crawford on 11/9/26.
//

import Foundation

struct RFAPI {
    
    var session: URLSession = .shared

    func startDemo() async throws -> RFUser {
        let request = RFEndpoints.demoRequest()
        return try await send(request)
    }

    func currentUser() async throws -> RFUser? {
        do {
            let request = RFEndpoints.userRequest()
            return try await send(request)
        } catch RFAPIError.signedOut {
            return nil
        }
    }
    
    func listDives() async throws -> [Dive] {
        let request = RFEndpoints.divesRequest(id: nil)
        return try await send(request)
    }
    
    func dive(id: String) async throws -> Dive {
        let request = RFEndpoints.divesRequest(id: id)
        return try await send(request)
    }

    private func send<Response: Decodable>(_ request: URLRequest) async throws -> Response {
        
        let (data, response) = try await session.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw RFAPIError.invalidResponse
        }

        switch httpResponse.statusCode {
            
            case 200..<300:
                break
            case 401:
                throw RFAPIError.signedOut
            case 404:
                throw RFAPIError.notFound
            default:
                let errorBody = try? JSONDecoder().decode(RFError.self, from: data)
                throw RFAPIError.server(status: httpResponse.statusCode,
                                        message: errorBody?.error ?? "")
        }

        do {
            return try JSONDecoder().decode(Response.self, from: data)
        } catch {
            throw RFAPIError.unreadableResponse(String(describing: error))
        }
    }
}

nonisolated enum RFAPIError: Error, LocalizedError {
    
    case signedOut
    case notFound
    case invalidResponse
    case server(status: Int, message: String)
    case unreadableResponse(String)

    var errorDescription: String? {
        
        switch self {
            case .signedOut: "Signed out."
            case .notFound: "Not found."
            case .invalidResponse: "Unexpected response."
            case .server(let status, let message): message.isEmpty ? "Server error \(status)." : message
            case .unreadableResponse(let details): "Couldn't read the server's answer: \(details)"
        }
    }
}
