//
//  PacketsViewController+Extensions.swift
//  Bagel++
//
//  Created by Andras Olah on 2020. 01. 05..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Foundation
import Cocoa

enum PacketColumn : String {
    case statusCode = "statusCode"
    case method = "method"
    case url = "url"
    case date = "date"
    case correlationId = "correlationId"
}

extension PacketsViewController {
    func toggleColumn(identifier: PacketColumn) {
        if let column = columnForIdentifier(identifier: identifier) {
            column.isHidden = !column.isHidden
        }
    }

    func columnForIdentifier(identifier: PacketColumn) -> NSTableColumn? {
        let identifier = NSUserInterfaceItemIdentifier(identifier.rawValue)
        let index = self.tableView.column(withIdentifier: identifier)
        if index > -1 {
            return self.tableView.tableColumns[index]
        }
        return nil
    }
}
