//
//  TicketModel.swift
//  Tickets
//
//  Created by Juzo Oda on 18/02/2017.
//  Copyright © 2017 Juzo Oda. All rights reserved.
//

import Foundation
import Mapper

public struct TicketsModel: Mappable {
    public let tickets: [TicketModel]
    
    public init(map: Mapper) throws {
        try tickets = map.from("tickets")
    }
}

public struct TicketModel: Mappable {
    public let url: String
    public let id: Int
    public let createAt: String
    public let updatedAt: String
    public let type: String?
    public let subject: String
    public let description: String
    public let priority: String
    public let status: String
    
    public init(map: Mapper) throws {
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
