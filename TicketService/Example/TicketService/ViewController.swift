//
//  ViewController.swift
//  TicketService
//
//  Created by odajuzo@gmail.com on 02/21/2017.
//  Copyright (c) 2017 odajuzo@gmail.com. All rights reserved.
//

import UIKit
import TicketService

struct TicketsModelConstants {
    static let username = "acooke+techtest@zendesk.com"
    static let password = "mobile"
    static let baseURL = "https://mxtechtest.zendesk.com/api/v2/views/39551161/tickets.json"
}

class ViewController: UIViewController {

    private var ticketService: Ticket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ticketService = TicketServiceBuilder().build(
            username: TicketsModelConstants.username,
            password: TicketsModelConstants.password,
            baseURL: TicketsModelConstants.baseURL
        )
        
        _ = ticketService.fetchTickets { response in
            print(response)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

