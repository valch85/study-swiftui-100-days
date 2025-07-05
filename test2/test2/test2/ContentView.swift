//
//  ContentView.swift
//  test2
//
//  Created by val on 22/06/2025.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    var scene: SCNScene {
        let scene = SCNScene()
        let cube = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        cube.firstMaterial?.diffuse.contents = UIColor.red
        
        let cubeNode = SCNNode(geometry: cube)
        scene.rootNode.addChildNode(cubeNode)

        return scene
    }

    var body: some View {
        SceneView(
            scene: scene,
            options: [.autoenablesDefaultLighting, .allowsCameraControl]
        )
        .frame(width: 300, height: 300)
    }
}


struct RedCubeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
