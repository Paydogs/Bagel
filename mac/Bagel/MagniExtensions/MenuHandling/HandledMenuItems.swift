//
//  HandledMenuItems.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

enum Actions : String {
    case clear = "action_clear"
    case reconnect = "action_reconnect"
    case copyPackage = "action_copyPackage"
    case copyResponseBody = "action_copyResponseBody"
    case toggleProjects = "action_toggleProjectPane"
}

extension ViewController {
    func getHandledMenuItems() -> [HandledMenuItem] {
        return [menuClearAction(),
                menuReconnectAction(),
                menuCopyPacketAction(),
                menuCopyResponseBodyAction(),
                menuToggleProjectsAction()]
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
                                self?.copyPacketAction("")})
    }

    func menuCopyResponseBodyAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.copyResponseBody.rawValue,
                               action: { [weak self] in
                                self?.copyResponseBodyAction("")})
    }

    func menuToggleProjectsAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleProjects.rawValue,
                               action: { [weak self] in
                                self?.toggleProjectPane("")})
    }
}
