//
//  TicketServiceParser.swift
//  Tickets
//
//  Created by Juzo Oda on 20/02/2017.
//  Copyright © 2017 Juzo Oda. All rights reserved.
//

import Foundation

struct TicketServiceParser {
    
    static func parseData(data: Any?, completion: @escaping (TicketResponse) -> ()) {
        if
            let ticketData = data,
            let ticketList = ticketData as? NSDictionary,
            let parsedData = Tickets.from(ticketList) {
            completion(TicketResponse(error: nil, tickets: parsedData.tickets))
        }else {
            completion(TicketResponse(error: SessionError.parse, tickets: []))
        }
    }
}
