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
    case toggleProjects = "action_toggleProjects"
}

extension ViewController {
    func getHandledMenuItems() -> [HandledMenuItem] {
        return [clearAction(),
                reconnectAction(),
                copyPackageAction(),
                copyResponseBodyAction(),
                toggleProjectsAction()]
    }
}

extension ViewController {
    func clearAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.clear.rawValue,
                               action: { [weak self] in
                                self?.packetsViewController?.clearButtonAction("") },
                               isValid: { [weak self] in
                                return self?.packetsViewController?.viewModel?.itemCount() ?? 0 > 0 })
    }

    func reconnectAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.reconnect.rawValue,
                               action: { let publisher = BagelController.shared.publisher
                                publisher.tryPublishAgain() })
    }

    func copyPackageAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.copyPackage.rawValue,
                               action: { [weak self] in
                                self?.detailVeiwController?.copyCurrentRepresentationAction("")})
    }

    func copyResponseBodyAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.copyResponseBody.rawValue,
                               action: { [weak self] in
                                self?.packetsViewController?.copyResponseBodyAction("")})
    }

    func toggleProjectsAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleProjects.rawValue,
                               action: { [weak self] in
                                self?.toggleProjects("")})
    }
}
