//
//  MenuHandling.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Andras Olah. All rights reserved.
//

import Cocoa

extension ViewController {
    //MARK: - Handling and validating
    func validateMenuItem(_ item: NSValidatedUserInterfaceItem) -> Bool {
        if let menuItem = item as? NSMenuItem, let identifier = menuItem.identifier?.rawValue {
            if let action = getHandledMenuItemForIdentifier(identifier) {
                return action.isValid()
            }
        }
        return true
    }

    func handleAction(_ sender: Any) {
        if let menuItem = sender as? NSMenuItem, let identifier = menuItem.identifier?.rawValue {
            if let action = getHandledMenuItemForIdentifier(identifier) {
                action.action()
            }
        }
    }

    //MARK: - Identifying
    func getHandledMenuItemForIdentifier(_ identifier : String) -> HandledMenuItem? {
        return getHandledMenuItems().first(where: { item in item.itemIdentifier == identifier })
    }
}
