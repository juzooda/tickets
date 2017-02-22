//
//  TicketService.swift
//  Tickets
//
//  Created by Juzo Oda on 18/02/2017.
//  Copyright © 2017 Juzo Oda. All rights reserved.
//

import Foundation

public class TicketService: NSObject, Ticket, URLSessionTaskDelegate {
    
    public let baseURL: String
    public var urlSession: URLSession!
    public let user: AuthUser
    
    public init(baseURL: String, user: AuthUser) {
        self.baseURL = baseURL
        self.user = user
    }
    
    public func fetchTickets(completion: @escaping TicketCompletion) -> URLSessionDataTask {
    
        let url = URL(string: baseURL)!
        let request = urlRequest(url: url)
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            if let er = error {
                handle(error: er, completion: completion)
                return
            }
            
            if let responseData = data {
                handle(response: responseData, completion: completion)
                return
            }
        }
        task.resume()
        return task
    }
    
    private func urlRequest(url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let credential = URLCredential(user: user.username, password: user.password, persistence: .forSession)
        completionHandler(.useCredential, credential)
    }
}
