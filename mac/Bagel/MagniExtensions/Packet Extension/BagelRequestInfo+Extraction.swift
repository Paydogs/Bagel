//
//  BagelRequestInfo+Extraction.swift
//  Bagel++
//
//  Created by Andras Olah on 2020. 01. 04..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Foundation

enum BagelRequestInfoFields: String, Codable {
  case url
  case requestMethod
  case statusCode
  case urlParameters
  case requestHeaders
  case requestBody
  case responseBody
}

extension BagelRequestInfo {
    func getField(_ field : BagelRequestInfoFields) -> String? {

        var rawString : String?
        switch field {
        case .url:
            rawString = self.url
        case .requestMethod:
            rawString = self.requestMethod?.rawValue
        case .statusCode:
            rawString = self.statusCode
        case .urlParameters:
            if let requestURLString = self.url, let requestURL = URL(string: requestURLString) {
                rawString = ContentRepresentationParser.keyValueRepresentation(url: requestURL).rawString
            }
        case .requestHeaders:
            if let requestHeaders = self.requestHeaders {
                rawString = ContentRepresentationParser.keyValueRepresentation(dictionary: requestHeaders).rawString
            }
        case .requestBody:
            if let requestBodyData = self.requestBody?.base64Data {
                rawString = ContentRepresentationParser.dataRepresentation(data: requestBodyData)?.rawString
            }
        case .responseBody:
            if let responseBodyData = self.responseData?.base64Data {
                rawString = ContentRepresentationParser.dataRepresentation(data: responseBodyData)?.rawString
            }
        }
        return rawString
    }
}
