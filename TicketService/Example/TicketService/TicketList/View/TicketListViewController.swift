//
//  TicketListViewController.swift
//  TicketService
//
//  Created by Juzo Oda on 22/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import TicketService

struct TicketsModelConstants {
    static let username = "acooke+techtest@zendesk.com"
    static let password = "mobile"
    static let baseURL = "https://mxtechtest.zendesk.com/api/v2/views/39551161/tickets.json"
}

class TicketListViewController: UIViewController {

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
