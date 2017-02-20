//
//  TicketService.swift
//  Tickets
//
//  Created by Juzo Oda on 17/11/2016.
//  Copyright © 2016 Juzo Oda. All rights reserved.
//

import Foundation

typealias TicketCompletion = (TicketResponse) -> ()

struct TicketResponse {
    let error: SessionError?
    let tickets: [Ticket]
}

struct AuthUser {
    let username: String
    let password: String
}

protocol TicketService {
    func fetchTickets(completion: @escaping (TicketResponse) -> ()) -> URLSessionDataTask
}
