//
//  TicketSessionResponseHandler.swift
//  Tickets
//
//  Created by Juzo Oda on 19/02/2017.
//  Copyright © 2017 Juzo Oda. All rights reserved.
//

import Foundation


func handle(response: Data, completion: @escaping TicketCompletion) {
    do {
        let responseDictionary = try JSONSerialization.jsonObject(with: response, options: .mutableContainers)
        if let errorMessage = errorOnResponse(response: responseDictionary) {
            let errorCompletion = createTicketCompletionWithError(string: errorMessage)
            completion(errorCompletion)
        }else{
            let parseCompletion = createTicketCompletionWithValid(response: responseDictionary)
            completion(parseCompletion)
        }
    }catch {
        let jsonErrorCompletion = createTicketCompletionWithValid(response: SessionErrorMessage.wrongFormat.rawValue)
        completion(jsonErrorCompletion)
    }
}

func handle(error: Error, completion: @escaping TicketCompletion) {
    let errorMessage = error.localizedDescription ?? SessionErrorMessage.emptyData.rawValue
    let responseError = ResponseError.communication(message: errorMessage)
    let response = TicketResponse(error: responseError, tickets: [])
    completion(response)
}

private func createTicketCompletionWithError(string: String) -> TicketResponse {
    let error = ResponseError.server(message: string)
    return TicketResponse(error: error, tickets: [])
}

private func createTicketCompletionWithValid(response: Any) -> TicketResponse {
    if
        let ticketList = response as? NSDictionary,
        let parsedData = TicketsModel.from(ticketList) {
        return TicketResponse(error: nil, tickets: parsedData.tickets)
    }else {
        return TicketResponse(error: ResponseError.parse, tickets: [])
    }
}

private func errorOnResponse(response: Any) -> String? {
    guard
        let error = response as? [String : Any],
        let errorMessage = error["error"] as? String else {
        return nil
    }
    return errorMessage
}

