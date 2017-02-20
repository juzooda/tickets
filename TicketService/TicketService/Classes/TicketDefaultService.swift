//
//  TicketDefaultService.swift
//  Tickets
//
//  Created by Juzo Oda on 18/02/2017.
//  Copyright © 2017 Juzo Oda. All rights reserved.
//

import Foundation

class TicketDefaultService: TicketService {
    
    let urlSession: TicketSession
    let endpoint: String
    
    init(urlSession: TicketSession, endpoint: String) {
        self.urlSession = urlSession
        self.endpoint = endpoint
    }
    
    func fetchTickets(completion: @escaping (TicketResponse) -> ()) -> URLSessionDataTask {
        let task = urlSession.get(url: endpoint) { response in
            if let error = response.error {
                completion(TicketResponse(error: error, tickets: []))
                return
            }
            TicketServiceParser.parseData(data: response.data, completion: completion)
        }
        return task
    }
}
