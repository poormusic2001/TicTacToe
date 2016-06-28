//
//  GameViewController.swift
//  TicTacToad-tvOS
//
//  Created by Andrew Shepard on 6/27/16.
//  Copyright (c) 2016 Andrew Shepard. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    lazy var sceneManager: SceneManager = {
        guard let skView = self.view as? SKView else {
            fatalError("missing SKView")
        }
        
        return SceneManager(view: skView)
    }()
    
    lazy var stateMachine: GKStateMachine = {
        return self.sceneManager.stateMachine
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.stateMachine.enterState(GameState.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
}
