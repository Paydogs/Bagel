//
//  OverviewViewController+Extensions.swift
//  Bagel
//
//  Created by Andras Olah on 2020. 01. 02..
//  Copyright © 2020. Andras Olah. All rights reserved.
//

import Foundation

extension OverviewViewController {
    @IBAction func copyRequestBodyButtonAction(_ sender: Any) {
        self.viewModel?.copyRequestBodyToClipboard()
    }
    @IBAction func copyResponseBodyButtonAction(_ sender: Any) {
        self.viewModel?.copyResponseBodyToClipboard()
    }
}
