//
//  TicketSessionResponseHandler.swift
//  Tickets
//
//  Created by Juzo Oda on 19/02/2017.
//  Copyright © 2017 Juzo Oda. All rights reserved.
//

import Foundation

struct TicketSessionResponseHandler {
    
    static func handle(data: Data, completion: @escaping TicketSessionCompletion) {
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            if let errorMessage = errorOnResponse(response: json) {
                let error = SessionError.server(message: errorMessage)
                //TooManyFailedLoginAttempts
                //"Couldn't authenticate you"
                let response = SessionResponse(error: error, data: json)
                completion(response)
            }else{
                let response = SessionResponse(error: nil, data: json)
                completion(response)
            }
        }catch {
            let error = SessionError.communication(message: SessionErrorMessage.wrongFormat.rawValue)
            let response = SessionResponse(error: error, data: nil)
            completion(response)
        }
    }
    
    static func handle(error: Error?, completion: @escaping TicketSessionCompletion) {
        let error = SessionError.communication(message: error?.localizedDescription ?? SessionErrorMessage.emptyData.rawValue)
        let response = SessionResponse(error: error, data: nil)
        completion(response)
    }
    
    static private func errorOnResponse(response: Any) -> String? {
        guard let error = response as? [String : Any], let errorMessage = error["error"] as? String else {
            return nil
        }
        return errorMessage
    }
}
