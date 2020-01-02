//
//  ViewController+Alerts.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Foundation
import Cocoa

extension ViewController {
    override func viewWillAppear() {
        super.viewWillAppear()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.showAlert(_:)),
                                               name: BagelNotifications.showAlert,
                                               object: nil)
    }

    @objc func showAlert(_ notification:Notification) {
        showAlert(message: notification.object as? String)
    }

    func showAlert(message: String?) {
        alertView.isHidden = false

        NSAnimationContext.runAnimationGroup({ context in
            context.allowsImplicitAnimation = true
            context.duration = 1.0
            alertView.alphaValue = 0.0
        }, completionHandler: { [weak self] in
            self?.alertView.alphaValue = 1.0
            self?.alertView.isHidden = true
        })
    }
}
