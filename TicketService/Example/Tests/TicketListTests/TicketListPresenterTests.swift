//
//  TicketListPresenterTests.swift
//  TicketServiceDemo
//
//  Created by Juzo Oda on 25/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import TicketService
@testable import TicketServiceDemo_Example

class FakeView: TicketListView {
    var updateWasCalled = false
    var viewModel: TicketListViewModel?
    func update(viewModel: TicketListViewModel) {
        updateWasCalled = true
        self.viewModel = viewModel
    }
}

class FakeService: Ticket {
    func fetchTickets(completion: @escaping TicketCompletion) -> URLSessionDataTask {
        mockTicketsResponse(completion: completion)
        return URLSessionDataTask()
    }
}

class TicketListPresenterTests: XCTestCase {
    
    var presenter: TicketListPresenterImp!
    let view = FakeView()
    
    override func setUp() {
        super.setUp()
        let interactor = TicketListInteractorImp(service: FakeService())
        presenter = TicketListPresenterImp(view: view, interactor: interactor)
    }
    
    func testPresenter() {
        presenter.loadTickets()
        XCTAssertTrue(view.updateWasCalled)
        if let viewModel = view.viewModel {
            XCTAssertNotNil(viewModel.ticketList)
            XCTAssertTrue(viewModel.ticketList.count == 45)
            XCTAssertEqual(viewModel.title, "Tickets")
        }else{
            XCTFail("view model must be populated")
        }
    }
}
