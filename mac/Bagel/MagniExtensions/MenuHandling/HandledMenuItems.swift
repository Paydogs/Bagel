//
//  HandledMenuItems.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Cocoa

enum Actions : String {
    case clear = "action_clear"
    case reconnect = "action_reconnect"
    case copyPackage = "action_copyPackage"
    case copyResponseBody = "action_copyResponseBody"
    case toggleProjectPane = "action_toggleProjectPane"
    case toggleCorrId = "action_toggleCorrId"
}

extension ViewController {
    func getHandledMenuItems() -> [HandledMenuItem] {
        return [menuClearAction(),
                menuReconnectAction(),
                menuCopyPacketAction(),
                menuCopyResponseBodyAction(),
                menuToggleProjectPaneAction(),
                menuToggleCorrelationIdColumnAction()]
    }
}

extension ViewController {
    func menuClearAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.clear.rawValue,
                               action: { [weak self] in
                                self?.packetsViewController?.clearButtonAction("") }, // Original method
                               isValid: { [weak self] in
                                return self?.packetsViewController?.viewModel?.itemCount() ?? 0 > 0 })
    }

    func menuReconnectAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.reconnect.rawValue,
                               action: { let publisher = BagelController.shared.publisher
                                publisher.tryPublishAgain() }) // Original method
    }

    func menuCopyPacketAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.copyPackage.rawValue,
                               action: { [weak self] in
                                self?.copyPacketAction("") })
    }

    func menuCopyResponseBodyAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.copyResponseBody.rawValue,
                               action: { [weak self] in
                                self?.copyResponseBodyAction("") })
    }

    func menuToggleProjectPaneAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleProjectPane.rawValue,
                               action: { [weak self] in
                                self?.toggleProjectPane("") })
    }

    func menuToggleCorrelationIdColumnAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleCorrId.rawValue,
                               action: { [weak self] in
                                let identifier = NSUserInterfaceItemIdentifier("correlationId")
                                if let idx = self?.packetsViewController?.tableView.column(withIdentifier: identifier) {
                                    if let column = self?.packetsViewController?.tableView.tableColumns[idx] {
                                        column.isHidden = !column.isHidden
                                    }
                                }})
    }
}
