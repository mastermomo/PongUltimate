//
//  GameViewController.swift
//  Pong
//
//  Created by MacMini on 6/18/19.
//  Copyright © 2019 Mohammad Khan. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

var currentGameType = gameType.normal // The game mode is set to normal mode as
                                      // a placeholder to prevent errors. This will be changed
                                      // to whichever option the player then chooses in the menu.

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Uses the boundaries of the project and
                // applies them to the scene itself in
                // the different devices.
                scene.size = view.bounds.size
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
