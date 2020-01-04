//
//  DetailViewController+Extensions.swift
//  Bagel++
//
//  Created by Andras Olah on 2020. 01. 04..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Foundation

extension DetailViewController {
    @IBAction func copyCurrentRepresentationAction(_ sender: Any) {
        let selectedPacket = BagelController.shared.selectedProjectController?.selectedDeviceController?.selectedPacket
        let representation = CustomRepresentation(requestInfo: selectedPacket?.requestInfo)
        representation.copyToClipboard()
        NotificationCenter.default.post(name: BagelNotifications.showAlert, object: "Copied")
    }
}
