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

    @IBAction func toggleProjectPane(_ sender: Any) {
        AlertView.displayAlert(message: self.leftPane.isHidden ? "Showing Projects Panel" : "Hiding Projects Panel")
        self.leftPane.isHidden = !self.leftPane.isHidden
    }

    @IBAction func togglePackagePane(_ sender: Any) {
        if !self.detailsPane.isHidden {
            AlertView.displayAlert(message: self.leftPane.isHidden ? "Showing Package Panel" : "Hiding Package Panel")
            self.packagePane.isHidden = !self.packagePane.isHidden
        }
    }

    @IBAction func toggleDetailsPane(_ sender: Any) {
        if !self.packagePane.isHidden {
            AlertView.displayAlert(message: self.leftPane.isHidden ? "Showing Details Panel" : "Hiding Details Panel")
            self.detailsPane.isHidden = !self.detailsPane.isHidden
        }
    }
}
