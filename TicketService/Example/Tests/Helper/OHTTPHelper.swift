//
//  OHTTPHelper.swift
//  TicketService
//
//  Created by Juzo Oda on 21/02/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import OHHTTPStubs

func stubFetchTickets(_ absoluteURL: String, body: String? = nil, statusCode: Int32, stubFileName: String) {
    OHHTTPStubs.stubRequests(passingTest: { (request) -> Bool in
        let matchesURL = request.url?.absoluteString == absoluteURL
        var matchesBody = true
        if let body = body {
            matchesBody = body == String(data: (request as NSURLRequest).ohhttpStubs_HTTPBody(), encoding: .utf8)!
        }
        return matchesURL && matchesBody
    }) { (request) -> OHHTTPStubsResponse in
        let filePath = OHPathForFile(stubFileName + ".json", TicketsServiceTests.self)!
        return OHHTTPStubsResponse(
            fileAtPath: filePath,
            statusCode: statusCode,
            headers: ["Content-Type": "application/json"])
    }
}
struct MockError: Error {
    let localizedDescription = "Communication Error"
}

func stubFetchTicketsError() {
    OHHTTPStubs.stubRequests(passingTest: { request -> Bool in
        return true
    }) { request -> OHHTTPStubsResponse in
        return OHHTTPStubsResponse(error: MockError())
    }
}
