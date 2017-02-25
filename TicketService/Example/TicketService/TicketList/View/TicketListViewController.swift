//
//  TicketListViewController.swift
//  TicketService
//
//  Created by Juzo Oda on 22/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import TicketService

protocol TicketListView: class {
    func update(viewModel: TicketListViewModel)
}

class TicketListViewController:
UIViewController,
TicketListView {

    var presenter: TicketListPresenter!
    let dataSource = TicketListViewDataSource()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        presenter.loadTickets()
    }

    func update(viewModel: TicketListViewModel) {
        dataSource.update(list: viewModel.ticketList)
        tableView.reloadData()
    }
}
