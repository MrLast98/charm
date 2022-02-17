//
//  ARView.swift
//  charm
//
//  Created by Emanuele Giunta on 17/02/22.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct MARView: UIViewRepresentable {
    let view = ARView()
    let coachingOverlay = ARCoachingOverlayView()

    func makeUIView(context: Context) -> ARView {
        // Start AR session
        let session = view.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.vertical]
        session.run(config)
        
        // Add coaching overlay
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .verticalPlane
        view.addSubview(coachingOverlay)
        
        // Handle ARSession events via delegate
        context.coordinator.view = view
        session.delegate = context.coordinator
        
        // Handle taps
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap)
            )
        )
        
        // Set debug options
#if DEBUG
        view.debugOptions = [.showFeaturePoints, .showAnchorOrigins, .showAnchorGeometry]
#endif
        
        return view
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func updateUIView(_ view: ARView, context: Context) {
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        let screenCenter = CGPoint(x: view.frame.midX, y: view.frame.midY)

        let results = view.hitTest(screenCenter, types: [.existingPlaneUsingExtent])
        guard let result = results.first(where: { result -> Bool in

            // Ignore results that are too close or too far away to the camera when initially placing
            guard result.distance > 0.5 && result.distance < 2.0 || coachingOverlay.isActive else {
                return false
            }

            // Make sure the anchor is a horizontal plane with a reasonable extent
            guard let planeAnchor = result.anchor as? ARPlaneAnchor,
                planeAnchor.alignment == .vertical else {
                    return false
            }

            // Make sure the horizontal plane has a reasonable extent
            let extent = simd_length(planeAnchor.extent)
            guard extent > 1 && extent < 2 else {
                return false
            }

            return true
        }),
        let planeAnchor = result.anchor as? ARPlaneAnchor else {
            return
        }

        // Create an anchor and add it to the session to place the game at this location
        let gameAnchor = ARAnchor(name: "Game Anchor", transform: normalize(planeAnchor.transform))
        view.session.add(anchor: gameAnchor)

//        gameController.anchorPlacement = Prova.AnchorPlacement(arAnchorIdentifier: gameAnchor.identifier, placementTransform: Transform(matrix: planeAnchor.transform))

        // Remove the coaching overlay view
        self.coachingOverlay.delegate = nil
        self.coachingOverlay.setActive(false, animated: false)
        self.coachingOverlay.removeFromSuperview()

        // Now that an anchor has been found, remove the view controller as a delegate to stop receiving updates per-frame
         view.session.delegate = nil

        // Reset the session to stop searching for horizontal planes after we found the anchor for the game
        view.session.run(ARWorldTrackingConfiguration())

//        self.gameController.playerReadyToBowlFrame()
    }

    func normalize(_ matrix: float4x4) -> float4x4 {
        var normalized = matrix
        normalized.columns.0 = simd.normalize(normalized.columns.0)
        normalized.columns.1 = simd.normalize(normalized.columns.1)
        normalized.columns.2 = simd.normalize(normalized.columns.2)
        return normalized
    }
}
class Coordinator: NSObject, ARSessionDelegate {
    weak var view: ARView?
    var focusEntity: FocusEntity?

    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
        guard let view = self.view else { return }
        debugPrint("Anchors added to the scene: ", anchors)
        self.focusEntity = FocusEntity(on: view, style: .classic(color: .yellow))
    }
    
    @objc func handleTap() {
        guard let view = self.view, let focusEntity = self.focusEntity else { return }

        // Create a new anchor to add content to
        let anchor = AnchorEntity()
        view.scene.anchors.append(anchor)

        // Load the .reality file for our model
        let prova = try! Prova.loadQubo()
        prova.position = focusEntity.position
        anchor.addChild(prova)
    }
}
