//
//  TicketListViewModel.swift
//  TicketService
//
//  Created by Juzo Oda on 25/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

struct TicketListViewModel {
    let title: String
    let ticketList: [TicketItemViewModel]
}

struct TicketItemViewModel {
    let title: String
    let description: String
}
