//
//  ErrorCodeTableCellView.swift
//  Bagel++
//
//  Created by Andras Olah on 2020. 01. 04..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Cocoa
import macOSThemeKit

class ErrorCodeTableCellView: NSTableCellView {

    @IBOutlet private weak var titleTextField: NSTextField!

    let errorCodePattern : String = #"(?<=\\"code\\":\\")(.*?)(?=\\")"#

    var packet: BagelPacket? {
        didSet{
          guard let packet = packet else { return }
            refresh(with: packet)
        }
    }

    func refresh(with packet: BagelPacket) {
        titleTextField.textColor = ThemeColor.secondaryLabelColor
        titleTextField.stringValue = getErrorCode(packet: packet)
    }

    private func getErrorCode(packet : BagelPacket) -> String {
        var errorCode = ""
        if let responseBodyText = packet.requestInfo?.getField(.responseBody) {
            if let range = responseBodyText.range(of: errorCodePattern,
                                                  options: .regularExpression) {
                errorCode = String(responseBodyText[range])
            }
        }
        
        return errorCode
    }

}
