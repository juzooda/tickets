//
//  TicketListInteractor.swift
//  TicketService
//
//  Created by Juzo Oda on 25/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import TicketService

protocol TicketListInteractor {
    func retrieveTickets(completion: @escaping TicketCompletion)
}

class TicketListInteractorImp: TicketListInteractor {
    
    let ticketService: Ticket
    
    init(service: Ticket) {
        self.ticketService = service
    }
    
    func retrieveTickets(completion: @escaping TicketCompletion) {
        _ = ticketService.fetchTickets { response in
            completion(response)
        }
    }
}
