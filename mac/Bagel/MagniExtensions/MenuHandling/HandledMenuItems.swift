//
//  HandledMenuItems.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Cocoa

enum Actions : String {
    case reconnect = "action_reconnect"
    case copyPackage = "action_copyPackage"
    case toggleProjectPane = "action_toggleProjectPane"
    case togglePackagePane = "action_togglePackagePane"
    case toggleDetailsPane = "action_toggleDetailsPane"
    case toggleStatus = "action_toggleStatus"
    case toggleMethod = "action_toggleMethod"
    case toggleUrl = "action_toggleUrl"
    case toggleDate = "action_toggleDate"
    case toggleCorrId = "action_toggleCorrId"
    case toggleErrorCode = "action_toggleErrorCode"
}

extension ViewController {
    func getHandledMenuItems() -> [HandledMenuItem] {
        return [menuReconnectAction(),
                menuCopyPacketAction(),
                menuToggleProjectPaneAction(),
                menuTogglePackagePaneAction(),
                menuToggleDetailsPaneAction(),
                menuToggleStatusColumnAction(),
                menuToggleMethodColumnAction(),
                menuToggleUrlColumnAction(),
                menuToggleDateColumnAction(),
                menuToggleCorrelationIdColumnAction(),
                menuToggleErrorCodeColumnAction()]
    }
}

extension ViewController {
    func menuReconnectAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.reconnect.rawValue,
                               action: { let publisher = BagelController.shared.publisher
                                publisher.tryPublishAgain() }) // Original method
    }

    func menuCopyPacketAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.copyPackage.rawValue,
                               action: { self.copyPacketAction("") })
    }

    func menuToggleProjectPaneAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleProjectPane.rawValue,
                               action: { self.toggleProjectPane("") })
    }

    func menuTogglePackagePaneAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.togglePackagePane.rawValue,
                               action: { self.togglePackagePane("") })
    }

    func menuToggleDetailsPaneAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleDetailsPane.rawValue,
                               action: { self.toggleDetailsPane("") })
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

    func menuToggleErrorCodeColumnAction() -> HandledMenuItem {
        return HandledMenuItem(itemIdentifier: Actions.toggleErrorCode.rawValue,
                               action: { self.packetsViewController?.toggleColumn(identifier: .errorCode) },
                               state: {
                                let column = self.packetsViewController?.columnForIdentifier(identifier: .errorCode)
                                return self.stateForVisibility(column: column) })
    }

    func stateForVisibility(column: NSTableColumn?) -> NSControl.StateValue {
        if let column = column {
            return column.isHidden ? NSControl.StateValue.off : NSControl.StateValue.on
        } else { return NSControl.StateValue.off }
    }
}
