//
//  ViewController+InitialSize.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 19..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Foundation

extension ViewController {
    override func viewWillAppear() {
        splitView.setPosition(125, ofDividerAt: 0)
        splitView.setPosition(250, ofDividerAt: 1)
    }
}
