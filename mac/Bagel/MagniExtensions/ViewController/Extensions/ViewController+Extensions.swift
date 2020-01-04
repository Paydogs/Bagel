//
//  ViewController+Extensions.swift
//  Bagel++
//
//  Created by Andras Olah on 2020. 01. 04..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Foundation
import Cocoa

extension ViewController {

    var selectedPacket: BagelPacket? {
        get {
            return BagelController.shared.selectedProjectController?.selectedDeviceController?.selectedPacket
        }
    }
    var selectedPacketRequestInfo: BagelRequestInfo? {
        get {
            return selectedPacket?.requestInfo
        }
    }

    @IBAction func copyPacketAction(_ sender: Any) {
        let representation = CustomRepresentation(requestInfo: selectedPacketRequestInfo)
        representation.copyToClipboard()
        AlertView.displayAlert(message: "Copied")
    }

    @IBAction func copyResponseBodyAction(_ sender: Any) {
        if let messageBody = selectedPacketRequestInfo?.getField(.responseBody) {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(messageBody, forType: .string)
            AlertView.displayAlert(message: "Copied")
        }
    }

    @IBAction func toggleProjectPane(_ sender: Any) {
        AlertView.displayAlert(message: self.leftPane.isHidden ? "Showing Panel" : "Hiding Panel")
        self.leftPane.isHidden = !self.leftPane.isHidden
    }
}
