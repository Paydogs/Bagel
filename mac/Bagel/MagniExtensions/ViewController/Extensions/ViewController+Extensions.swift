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

        NotificationCenter.default.post(name: BagelNotifications.showAlert,
                                        object: self.leftPane.isHidden ? "Showing Panel" : "Hiding Panel")
        self.leftPane.isHidden = !self.leftPane.isHidden
    }
}
