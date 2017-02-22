//
//  Ticket.swift
//  Tickets
//
//  Created by Juzo Oda on 17/11/2016.
//  Copyright © 2016 Juzo Oda. All rights reserved.
//

import Foundation

public typealias TicketCompletion = (TicketResponse) -> ()

public struct TicketResponse {
    public let error: ResponseError?
    public let tickets: [TicketModel]
}

public struct AuthUser {
    let username: String
    let password: String
}

public protocol Ticket {
    func fetchTickets(completion: @escaping TicketCompletion) -> URLSessionDataTask
}
