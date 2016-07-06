//
//  PlayerOTurnState.swift
//  TicTacToad
//
//  Created by Andrew Shepard on 6/28/16.
//  Copyright © 2016 Andrew Shepard. All rights reserved.
//

import GameplayKit
import SpriteKit

class PlayerOTurnState: GKState {
    
    private let isComputerPlayer: Bool
    private(set) unowned var scene: SKScene
    
    init(scene: SKScene, isComputerPlayer: Bool = false) {
        self.scene = scene
        self.isComputerPlayer = isComputerPlayer
    }
    
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return true
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        if isComputerPlayer {
            guard let scene = scene as? GameScene else { return }
            guard let player = scene.model.activePlayer as? TTTPlayer else { return }
            
            let title = NSLocalizedString("Player O is making a move...", comment: "")
            scene.moveLabel.text = title
            scene.moveLabel.fontColor = Style.Colors.blue
            
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC)))
            dispatch_after(delay, dispatch_get_main_queue() ) {
                if let move = scene.strategist.bestMoveForPlayer(player) {
                    scene.makeMoveForActivePlayer(move)
                }
                else {
                    fatalError("no moves found...")
                }
            }
        }
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        print("update!")
    }
}