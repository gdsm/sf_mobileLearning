//
//  TapMeView.swift
//  SwiftLearning
//
//  Created by Gagan on 03/01/22.
//  Copyright © 2022 Gagan. All rights reserved.
//

import UIKit

class TapMeView: UIView {
    
    var callback: (() -> Void)?    
    @IBOutlet weak var button: UIButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @IBAction func onButtonTap(_ sender: UIButton) {
        callback?()
    }
}
