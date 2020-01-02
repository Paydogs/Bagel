//
//  OverviewViewModel+Extension.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Andras Olah. All rights reserved.
//

import Cocoa

extension OverviewViewModel {
    func copyBodyToClipboard() {
        if let messageBody = self.packet?.base64DecodedResponseBody() {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(messageBody, forType: .string)
            NotificationCenter.default.post(name: BagelNotifications.showAlert, object: "Copied")
        }
    }
}
