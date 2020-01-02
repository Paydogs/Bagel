//
//  PacketsViewController+Extensions.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Cocoa

extension PacketsViewController {
    @IBAction func copyMessageAction(_ sender: Any) {

//            self.viewModel?.copyBodyToClipboard()
    }

    @IBAction func copyResponseBodyAction(_ sender: Any) {
        if let messageBody = self.viewModel?.selectedItem?.base64DecodedResponseBody() {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(messageBody, forType: .string)
            NotificationCenter.default.post(name: BagelNotifications.showAlert, object: "Copied")
        }
    }

}
