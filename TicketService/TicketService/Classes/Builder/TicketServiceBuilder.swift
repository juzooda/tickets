//
//  TicketServiceBuilder.swift
//  Tickets
//
//  Created by Juzo Oda on 18/02/2017.
//  Copyright © 2017 Juzo Oda. All rights reserved.
//

import Foundation

public class TicketServiceBuilder {
    
    public init() {
    }
    
    public func build(username: String, password: String, baseURL: String) -> TicketService {
        let user = AuthUser(username: username, password: password)
        let ticketService = TicketService(baseURL: baseURL, user: user)
        let sessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: sessionConfiguration, delegate: ticketService, delegateQueue: nil)
        ticketService.urlSession = urlSession
        return ticketService
    }
}
