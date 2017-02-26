//
//  TicketListBuilderTests.swift
//  TicketService
//
//  Created by Juzo Oda on 25/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import TicketService
@testable import TicketServiceDemo_Example

class TicketListBuilderTests: XCTestCase {
    
    let builder = TicketListBuilder()
    
    func testBuilder() {
        let ticketListVC = builder.build()
        XCTAssertNotNil(ticketListVC)
        XCTAssertNotNil(ticketListVC.presenter)
        XCTAssertNotNil(ticketListVC.dataSource)
        XCTAssertNotNil(ticketListVC.dataSource.ticketList)
        
        let presenter = ticketListVC.presenter as! TicketListPresenterImp
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.interactor)
        
        let interactor = presenter.interactor as! TicketListInteractorImp
        XCTAssertNotNil(interactor.ticketService)
    }
}
