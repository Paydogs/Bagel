//
//  ViewController+Extensions.swift
//  Bagel++
//
//  Created by Andras Olah on 2020. 01. 04..
//  Copyright © 2020. Yagiz Lab. All rights reserved.
//

import Foundation

extension ViewController {
    @IBAction func toggleProjects(_ sender: Any) {
        self.leftPane.isHidden = !self.leftPane.isHidden
    }
}
