//
//  OverviewViewModel+Extension.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Andras Olah. All rights reserved.
//

import Cocoa

extension OverviewViewModel {
    func copyRequestBodyToClipboard() {
        if let responseBody = self.packet?.requestInfo?.getField(.requestBody) {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(responseBody, forType: .string)
            AlertView.displayAlert(message: "Copied")
        }
    }
    func copyResponseBodyToClipboard() {
        if let responseBody = self.packet?.requestInfo?.getField(.responseBody) {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(responseBody, forType: .string)
            AlertView.displayAlert(message: "Copied")
        }
    }
}
