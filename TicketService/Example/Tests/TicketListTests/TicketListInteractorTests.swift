//
//  TicketListInteractorTests.swift
//  TicketServiceDemo
//
//  Created by Juzo Oda on 25/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import OHHTTPStubs
import TicketService
@testable import TicketServiceDemo_Example

class TicketListInteractorTests: XCTestCase {
    
    private var interactor: TicketListInteractorImp!
    
    override func setUp() {
        super.setUp()
        let ticketService = TicketServiceBuilder().build(
            username: TicketsModelTestsConstants.username,
            password: TicketsModelTestsConstants.password,
            baseURL: TicketsModelTestsConstants.baseURL
        )
        interactor = TicketListInteractorImp(service: ticketService)
    }
    
    func testInteractor() {
        let exp = expectation(description: "interactor")
        stubFetchTickets(
            TicketsModelTestsConstants.baseURL,
            statusCode: 200,
            stubFileName: "tickets")
        
        interactor.retrieveTickets { response in
            XCTAssertNil(response.error)
            XCTAssertNotNil(response.tickets)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
}
