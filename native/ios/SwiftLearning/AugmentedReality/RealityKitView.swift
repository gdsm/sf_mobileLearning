//
//  RealityKitView.swift
//  SwiftLearning
//
//  Created by Gagandeep on 18/04/24.
//  Copyright © 2024 Gagan. All rights reserved.
//

import Foundation
import ARKit
import RealityKit
import SwiftUI


struct RealityKitView: UIViewRepresentable {
 
    func makeUIView(context: Context) -> ARView {
        let view = ARView()
        
        // Start AR session
        let session = view.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)
        
        // Add coaching overlay
       let coachingOverlay = ARCoachingOverlayView()
       coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       coachingOverlay.session = session
       coachingOverlay.goal = .horizontalPlane
       view.addSubview(coachingOverlay)
        
        // Set debug options
       #if DEBUG
       view.debugOptions = [.showFeaturePoints, .showAnchorOrigins, .showAnchorGeometry]
       #endif
        return view
    }

    func updateUIView(_ view: ARView, context: Context) {
    }
}
