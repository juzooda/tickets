//
//  TicketSession.swift
//  Tickets
//
//  Created by Juzo Oda on 18/02/2017.
//  Copyright © 2017 Juzo Oda. All rights reserved.
//

import Foundation

public enum ResponseError: Error {
    case server(message: String)
    case communication(message: String)
    case parse
}

public enum SessionErrorMessage: String {
    case wrongFormat = "Invalid Format"
    case emptyData = "Response was empty"
    case offline = "You are offline"
}
