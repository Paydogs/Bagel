//
//  OverviewViewController+Actions.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 29..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Foundation
import AppKit

extension OverviewViewController {

    @IBAction func copyRequestBodyToClipboard(_ sender: Any) {
        copyToClipboard(string: self.viewModel?.packet?.requestInfo?.requestBody)
    }

    @IBAction func copyResponseBodyToClipboard(_ sender: Any) {
        if let data = self.viewModel?.packet?.requestInfo?.responseData,
            let bodyData = Data(base64Encoded: data, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) {
                let bodyText = String(data: bodyData, encoding: .utf8)
                copyToClipboard(string: bodyText)
            }
    }

    private func copyToClipboard(string: String?) {
        if let string = string {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(string, forType: .string)
        }

    }
}
