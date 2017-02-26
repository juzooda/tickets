//
//  TicketListPresenter.swift
//  TicketService
//
//  Created by Juzo Oda on 25/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import TicketService

protocol TicketListPresenter {
    func loadTickets()
}

class TicketListPresenterImp: TicketListPresenter {
    
    weak var view: TicketListView!
    let interactor: TicketListInteractor
    
    init(view: TicketListView, interactor: TicketListInteractor) {
        self.view = view
        self.interactor = interactor
    }
    
    func loadTickets() {
        interactor.retrieveTickets { [weak self] response in
            if let weakSelf = self {
                weakSelf.createViewModel(model: response)
            }
        }
    }
    
    func createViewModel(model: TicketResponse) {
        let itemsViewModel = model.tickets.map { model -> TicketItemViewModel in
            TicketItemViewModel(title: model.subject, description: model.description)
        }
        let vm = TicketListViewModel(title: "Tickets", ticketList: itemsViewModel)
        view.update(viewModel: vm)
    }
}
