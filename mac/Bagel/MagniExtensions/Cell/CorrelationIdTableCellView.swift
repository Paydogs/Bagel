//
//  CorrelationIdTableCellView.swift
//  Bagel++
//
//  Created by Andras Olah on 2020. 01. 04..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Cocoa
import macOSThemeKit

class CorrelationIdTableCellView: NSTableCellView {

    @IBOutlet private weak var titleTextField: NSTextField!

    var packet: BagelPacket? {
        didSet{
          guard let packet = packet else { return }
            refresh(with: packet)
        }
    }

    func refresh(with packet: BagelPacket) {
        titleTextField.textColor = ThemeColor.secondaryLabelColor
        titleTextField.stringValue = getCorrelationId(packet: packet)
    }

    private func getCorrelationId(packet : BagelPacket) -> String {
        var correlationId = ""
        if let responseBodyText = packet.requestInfo?.getField(.responseBody) {
            if let range = responseBodyText.range(of: #"(?<=\"correlationId\\\":\\\")(.*?)(?=\\\",)"#,
                                                  options: .regularExpression) {
                correlationId = String(responseBodyText[range])
            }
        }
        

        return correlationId
    }

}
