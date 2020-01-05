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
    case toggleStatus = "action_toggleStatus"
    case toggleMethod = "action_toggleMethod"
    case toggleUrl = "action_toggleUrl"
    case toggleDate = "action_toggleDate"
    case toggleCorrId = "action_toggleCorrId"
}

extension ViewController {
    func getHandledMenuItems() -> [HandledMenuItem] {
        return [menuClearAction(),
                menuReconnectAction(),
                menuCopyPacketAction(),
                menuCopyResponseBodyAction(),
                menuToggleProjectPaneAction(),
                menuToggleStatusColumnAction(),
                menuToggleMethodColumnAction(),
                menuToggleUrlColumnAction(),
                menuToggleDateColumnAction(),
                menuToggleCorrelationIdColumnAction()]
    }
}

extension ViewController {
    func menuClearAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.clear.rawValue,
                               action: { self.packetsViewController?.clearButtonAction("") }, // Original method
                               isValid: { return self.packetsViewController?.viewModel?.itemCount() ?? 0 > 0 }) }

    func menuReconnectAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.reconnect.rawValue,
                               action: { let publisher = BagelController.shared.publisher
                                publisher.tryPublishAgain() }) // Original method
    }

    func menuCopyPacketAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.copyPackage.rawValue,
                               action: { self.copyPacketAction("") })
    }

    func menuCopyResponseBodyAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.copyResponseBody.rawValue,
                               action: { self.copyResponseBodyAction("") })
    }

    func menuToggleProjectPaneAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleProjectPane.rawValue,
                               action: { self.toggleProjectPane("") })
    }
}

extension ViewController {
    func menuToggleStatusColumnAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleStatus.rawValue,
                               action: { self.packetsViewController?.toggleColumn(identifier: .statusCode) },
                               state: {
                                let column = self.packetsViewController?.columnForIdentifier(identifier: .statusCode)
                                return self.stateForVisibility(column: column) })
    }

    func menuToggleMethodColumnAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleMethod.rawValue,
                               action: { self.packetsViewController?.toggleColumn(identifier: .method) },
                               state: {
                                let column = self.packetsViewController?.columnForIdentifier(identifier: .method)
                                return self.stateForVisibility(column: column) })
    }

    func menuToggleUrlColumnAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleUrl.rawValue,
                               action: { self.packetsViewController?.toggleColumn(identifier: .url) },
                               state: {
                                let column = self.packetsViewController?.columnForIdentifier(identifier: .url)
                                return self.stateForVisibility(column: column) })
    }

    func menuToggleDateColumnAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleDate.rawValue,
                               action: { self.packetsViewController?.toggleColumn(identifier: .date) },
                               state: {
                                let column = self.packetsViewController?.columnForIdentifier(identifier: .date)
                                return self.stateForVisibility(column: column) })
    }

    func menuToggleCorrelationIdColumnAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleCorrId.rawValue,
                               action: { self.packetsViewController?.toggleColumn(identifier: .correlationId) },
                               state: {
                                let column = self.packetsViewController?.columnForIdentifier(identifier: .correlationId)
                                return self.stateForVisibility(column: column) })
    }

    func stateForVisibility(column: NSTableColumn?) -> NSControl.StateValue {
        if let column = column {
            return column.isHidden ? NSControl.StateValue.off : NSControl.StateValue.on
        } else { return NSControl.StateValue.off }
    }
}
