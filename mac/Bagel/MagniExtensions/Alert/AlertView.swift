//
//  AlertView.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Cocoa
import Foundation

extension AlertView {
    static func displayAlert(message: String) {
        NotificationCenter.default.post(name: BagelNotifications.showAlert, object: message)
    }
}

class AlertView : NSView {
    @IBOutlet var messageView : NSTextField!

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.gray.cgColor.copy(alpha: 0.5)
    }

    func showMessage(message : String?) {
        self.messageView.stringValue = message ?? ""
    }
}
