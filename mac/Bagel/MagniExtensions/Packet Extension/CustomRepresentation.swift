//
//  CustomRepresentation.swift
//  Bagel++
//
//  Created by Andras Olah on 2020. 01. 04..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Cocoa

class CustomRepresentation: ContentRepresentation  {

    init(requestInfo: BagelRequestInfo?) {

        super.init()

        if let requestInfo = requestInfo {

            var overviewString = ""

            overviewString = overviewString + (requestInfo.getField(.requestMethod) ?? "")
            overviewString = overviewString + " "
            overviewString = overviewString + (requestInfo.getField(.url) ?? "")

            overviewString = overviewString + "\n\n"

            overviewString = overviewString + "Response Code: "
            overviewString = overviewString + (requestInfo.getField(.statusCode) ?? "")

            if let contentRawString = requestInfo.getField(.urlParameters) {
                overviewString = overviewString + "\n\n"
                overviewString = overviewString + "URL Parameters:\n"
                overviewString = overviewString + contentRawString
            }

            if let contentRawString = requestInfo.getField(.requestHeaders) {
                overviewString = overviewString + "\n\n"
                overviewString = overviewString + "Request Headers:\n"
                overviewString = overviewString + contentRawString
            }

            if let contentRawString = requestInfo.getField(.requestBody) {
                overviewString = overviewString + "\n\n"
                overviewString = overviewString + "Request Body:\n"
                overviewString = overviewString + contentRawString
            }

            if let contentRawString = requestInfo.getField(.responseBody) {
                overviewString = overviewString + "\n\n"
                overviewString = overviewString + "Response Body:\n"
                overviewString = overviewString + contentRawString
            }

            self.rawString = overviewString
        }
    }
}
