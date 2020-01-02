//
//  OverviewViewController+Extensions.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Andras Olah. All rights reserved.
//

import Foundation

extension OverviewViewController {
    @IBAction func copyBodyButtonAction(_ sender: Any) {
        self.viewModel?.copyBodyToClipboard()
    }
}
