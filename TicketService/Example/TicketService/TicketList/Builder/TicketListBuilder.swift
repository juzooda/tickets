//
//  TicketListBuilder.swift
//  TicketService
//
//  Created by Juzo Oda on 25/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import TicketService

struct TicketsModelConstants {
    static let username = "acooke+techtest@zendesk.com"
    static let password = "mobile"
    static let baseURL = "https://mxtechtest.zendesk.com/api/v2/views/39551161/tickets.json"
}

struct TicketListBuilder {
    
    func build() -> TicketListViewController {
        let service = ticketService()
        let interactor = TicketListInteractorImp(service: service)
        let view = TicketListViewController(nibName: "TicketListViewController", bundle: Bundle.main)
        let presenter = TicketListPresenterImp(view: view, interactor: interactor)
        view.presenter = presenter
        return view
    }
    
    func ticketService() -> Ticket {
        return TicketServiceBuilder().build(
            username: TicketsModelConstants.username,
            password: TicketsModelConstants.password,
            baseURL: TicketsModelConstants.baseURL
        )
    }
}
