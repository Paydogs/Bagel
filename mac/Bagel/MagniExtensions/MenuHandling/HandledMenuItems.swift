//
//  HandledMenuItems.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

enum Actions : String {
    case clear = "action_clear"
}

extension ViewController {
    func getHandledMenuItems() -> [HandledMenuItem] {
        return [clearAction()]
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
}
