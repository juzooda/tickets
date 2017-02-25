//
//  TicketListViewDataSource.swift
//  TicketService
//
//  Created by Juzo Oda on 25/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class TicketListViewDataSource: NSObject, UITableViewDataSource {
    
    var ticketList: [TicketItemViewModel] = []
    let cellIdentifier = "TicketListCell"
    
    func update(list: [TicketItemViewModel]) {
        self.ticketList = list
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = ticketList[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        }
        
        cell?.textLabel?.text = model.title
        cell?.detailTextLabel?.text = model.description
        
        return cell!
    }
}
