//
//  HandledMenuItem.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import AppKit

struct HandledMenuItem {
    var itemIdentifier: String
    let action: () -> Void
    let isValid: () -> Bool
    let state: () -> NSControl.StateValue

    init(itemIdentifier: String,
         action: @escaping () -> Void,
         isValid: @escaping () -> Bool = { return true },
         state: @escaping () -> NSControl.StateValue = { return NSControl.StateValue.off })
    {
        self.itemIdentifier = itemIdentifier
        self.action = action
        self.isValid = isValid
        self.state = state
    }
}
