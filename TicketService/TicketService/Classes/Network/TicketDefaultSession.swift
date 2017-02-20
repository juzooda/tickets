//
//  TicketDefaultSession.swift
//  Tickets
//
//  Created by Juzo Oda on 18/02/2017.
//  Copyright © 2017 Juzo Oda. All rights reserved.
//

import Foundation

class TicketDefaultSession: NSObject, TicketSession, URLSessionTaskDelegate {

    var urlSession: URLSession?
    let user: AuthUser
    
    init(user: AuthUser) {
        self.user = user
    }
    
    func get(url: String, completion: @escaping TicketSessionCompletion) -> URLSessionDataTask {
        guard let session = urlSession else {
            return URLSessionDataTask()
        }
        
        let url = URL(string: url)!
        let request = urlRequest(url: url)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let responseData = data {
                TicketSessionResponseHandler.handle(data: responseData, completion: completion)
            }else {
                TicketSessionResponseHandler.handle(error: error, completion: completion)
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
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        let credential = URLCredential(user: user.username, password: user.password, persistence: .forSession)
        completionHandler(.useCredential, credential)
    }
}
