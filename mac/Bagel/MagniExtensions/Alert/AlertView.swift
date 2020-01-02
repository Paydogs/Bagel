//
//  AlertView.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Cocoa
import Foundation

class AlertView : NSView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.gray.cgColor.copy(alpha: 0.5)
    }
}
