//
//  HandledMenuItem.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

struct HandledMenuItem {
    var itemIdentifier: String
    let action: () -> Void
    let isValid: () -> Bool

    init(itemIdentifier: String,
         action: @escaping () -> Void,
         isValid: @escaping () -> Bool = { return true })
    {
        self.itemIdentifier = itemIdentifier
        self.action = action
        self.isValid = isValid
    }
}
