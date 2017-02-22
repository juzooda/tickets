//
//  TicketsServiceTests.swift
//  TicketService
//
//  Created by Juzo Oda on 21/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import OHHTTPStubs
import TicketService

struct TicketsModelTestsConstants {
    static let username = "username"
    static let password = "password"
    static let baseURL = "https://mxtechtest.zendesk.com/api/v2/views/39551161/tickets.json"
}

class TicketsServiceTests: XCTestCase {
    
    private var ticketService: Ticket!
    
    override func setUp() {
        super.setUp()
        ticketService = TicketServiceBuilder().build(
            username: TicketsModelTestsConstants.username,
            password: TicketsModelTestsConstants.password,
            baseURL: TicketsModelTestsConstants.baseURL
        )
    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }
    
    func testFetchTicketsSuccess() {
        let exp = expectation(description: "noDescription")
        stubFetchTickets(
            TicketsModelTestsConstants.baseURL,
            statusCode: 200,
            stubFileName: "tickets")
        
        _ = ticketService.fetchTickets { response in
            XCTAssertNil(response.error)
            XCTAssertNotNil(response.tickets)
            XCTAssert(response.tickets.count == 45)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testFetchTicketsAuthenticationError() {
        let exp = expectation(description: "noDescription")
        stubFetchTickets(
            TicketsModelTestsConstants.baseURL,
            statusCode: 401,
            stubFileName: "authentication-error")
        
        _ = ticketService.fetchTickets { response in
            XCTAssertNotNil(response.error)
            
            if case ResponseError.server(let message) = response.error! {
                XCTAssertEqual(message, "Couldn't authenticate you")
            }else{
                XCTFail()
            }
            
            XCTAssert(response.tickets.count == 0)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testFetchTicketsTooManyTryError() {
        let exp = expectation(description: "noDescription")
        stubFetchTickets(
            TicketsModelTestsConstants.baseURL,
            statusCode: 403,
            stubFileName: "too-many-failed")
        
        _ = ticketService.fetchTickets { response in
            XCTAssertNotNil(response.error)
            
            if case ResponseError.server(let message) = response.error! {
                XCTAssertEqual(message, "TooManyFailedLoginAttempts")
            }else{
                XCTFail()
            }
            
            XCTAssert(response.tickets.count == 0)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testFetchTicketsInvalidEndpoint() {
        let exp = expectation(description: "noDescription")
        stubFetchTickets(
            TicketsModelTestsConstants.baseURL,
            statusCode: 404,
            stubFileName: "invalid-endpoint")
        
        _ = ticketService.fetchTickets { response in
            XCTAssertNotNil(response.error)
            
            if case ResponseError.server(let message) = response.error! {
                XCTAssertEqual(message, "InvalidEndpoint")
            }else{
                XCTFail()
            }
            
            XCTAssert(response.tickets.count == 0)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testFetchTicketsJson() {
        let exp = expectation(description: "noDescription")
        stubFetchTickets(
            TicketsModelTestsConstants.baseURL,
            statusCode: 200,
            stubFileName: "invalid-json")
        
        _ = ticketService.fetchTickets { response in
            XCTAssertNotNil(response.error)
            
            if case ResponseError.parse = response.error!{}else{
                XCTFail()
            }
            
            XCTAssert(response.tickets.count == 0)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testFetchTicketsError() {
        let exp = expectation(description: "noDescription")
        stubFetchTicketsError()
        
        _ = ticketService.fetchTickets { response in
            XCTAssertNotNil(response.error)
            
            if case ResponseError.communication(let message) = response.error! {
                XCTAssertNotNil(message)
                XCTAssertFalse(message.isEmpty)
            }else{
                XCTFail()
            }
            
            XCTAssert(response.tickets.count == 0)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
}
