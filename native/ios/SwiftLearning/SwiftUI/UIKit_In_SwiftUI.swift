//
//  UIKit_In_SwiftUI.swift
//  SwiftLearning
//
//  Created by Gagan on 03/01/22.
//  Copyright © 2022 Gagan. All rights reserved.
//

import SwiftUI

struct TapMeUIView: UIViewRepresentable {
    
    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        let view = Bundle.main.loadNibNamed("TapMeView", owner: nil, options: nil)?.first as! TapMeView
        view.callback = {
            print("Hello tap me view")
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        print("TapMe view refreshed")
    }
}

struct UIKit_In_SwiftUI: View {
    var body: some View {
        TapMeUIView()
    }
    
}

struct UIKit_In_SwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UIKit_In_SwiftUI()
    }
}
