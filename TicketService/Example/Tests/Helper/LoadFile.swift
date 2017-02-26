//
//  LoadFile.swift
//  TicketServiceDemo
//
//  Created by Juzo Oda on 25/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import Mapper
@testable import TicketService

func jsonPayloadContent(payloadName: String) -> Any {
    let jsonData = jsonPayloadContentData(payloadName: payloadName)
    return try! JSONSerialization.jsonObject(with: jsonData as Data, options:[]) as Any
}

func jsonPayloadContentData(payloadName: String) -> Data {
    let bundle = Bundle.init(for: TicketListPresenterTests.self)
    let file = bundle.path(forResource: payloadName, ofType: "json")!
    let url = URL(fileURLWithPath: file)
    return try! Data(contentsOf: url, options: .mappedIfSafe)
}

func mockTicketsResponse(completion: @escaping TicketCompletion) {
    let response = jsonPayloadContentData(payloadName: "tickets")
    do {
        let responseDictionary = try JSONSerialization.jsonObject(with: response, options: .mutableContainers)
        if
            let ticketList = responseDictionary as? NSDictionary,
            let parsedData = TicketsModel.from(ticketList) {
            let ticketResponse = TicketResponse(error: nil, tickets: parsedData.tickets)
            completion(ticketResponse)
        }
    }catch{
        print("Tell me why")
    }
}
