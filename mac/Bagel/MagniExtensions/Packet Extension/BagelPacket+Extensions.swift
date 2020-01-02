//
//  BagelPacket+Extensions.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Foundation

extension BagelPacket {
    func base64DecodedResponseBody() -> String? {
        if let requestInfo = self.requestInfo { return decode(requestInfo.responseData) }
        return nil
    }
}

extension BagelPacket {
    private func decode(_ string: String?) -> String? {
        if let data = string?.base64Data, let decoded = String(data: data, encoding: .utf8) {
            return decoded
        }
        return nil
    }
}
