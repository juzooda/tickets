//
//  TicketModel.swift
//  Tickets
//
//  Created by Juzo Oda on 18/02/2017.
//  Copyright © 2017 Juzo Oda. All rights reserved.
//

import Foundation
import Mapper

struct Tickets: Mappable {
    let tickets: [Ticket]
    
    init(map: Mapper) throws {
        try tickets = map.from("tickets")
    }
}

struct Ticket: Mappable {
    let url: String
    let id: Int
    let createAt: String
    let updatedAt: String
    let type: String?
    let subject: String
    let description: String
    let priority: String
    let status: String
    
    init(map: Mapper) throws {
        try url = map.from("url")
        try id = map.from("id")
        try createAt = map.from("created_at")
        try updatedAt = map.from("updated_at")
        type = map.optionalFrom("type")
        try subject = map.from("subject")
        try description = map.from("description")
        try priority = map.from("priority")
        try status = map.from("status")
    }
}
