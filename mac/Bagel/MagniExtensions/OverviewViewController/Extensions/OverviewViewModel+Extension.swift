//
//  OverviewViewModel+Extension.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Cocoa

extension OverviewViewModel {

    func copyBodyToClipboard() {
        if let requestInfo = self.packet?.requestInfo {
            if let data = Data(base64Encoded: requestInfo.responseData ?? "", options: .ignoreUnknownCharacters) {
                if let body = String(data: data, encoding: .utf8) {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(body, forType: .string)
                }
            }
        }
    }
}
