//
//  GameScene.swift
//  Pong
//
//  Created by MacMini on 6/18/19.
//  Copyright © 2019 Mohammad Khan. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    // Sets up several objects in relation to
    // their physical sprite models.
    var player = SKSpriteNode()
    var enemy = SKSpriteNode()
    var ball = SKSpriteNode()
    
    // Sets up several objects in relation to
    // their physical labels.
    var playerScore = SKLabelNode()
    var enemyScore = SKLabelNode()
    
    var score = [Int]() // Sets up an array for scoring in relation to the player and the enemy.
    
    // A function that connects objects to their
    // sprites and allows them to react in the game.
    override func didMove(to view: SKView) {
        // Connects objects with their
        // respective physical sprite models.
        player = self.childNode(withName: "player") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        // Connects the scores of the player and enemy
        // to their respectful labels.
        playerScore = self.childNode(withName: "player score count") as! SKLabelNode
        enemyScore = self.childNode(withName: "enemy score count") as! SKLabelNode
        
        player.position.y = (-self.frame.height / 2) + 80 // Takes the bottom half of the size of the frame, adds 50 to y, and sets that
                                                          // as the new y position for the player paddle.
        enemy.position.y = (self.frame.height / 2) - 80 // Takes the top half of the size of the frame, minuses 50 to y, and sets that
                                                        // as the new y position for the enemy paddle.
        

        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame) // Places a border around the user's screen
                                                             // in order to prevent the ball from escaping the user's view.
        
        border.friction = 0 // Prevents the ball from having any friction when coming into contact with the borders
        border.restitution = 1 // Allows the ball to keep its bounce when hitting the borders.
        
        self.physicsBody = border // Sets the physics of our border to the scene.
        
        
        gameStart() // Begins the game chosen by the user.
        }
    
    // Starts the game with both the user and
    // the enemy at 0 points.
    func gameStart() {
        score = [0,0] // Sets the array to 0 for both user and enemy.
        playerScore.text = "\(score[0])" // Prints the initial score for the player on the app.
        enemyScore.text = "\(score[1])" // Prints the initial score for the enemy on the app.
        
        let number = Int.random(in: 1 ... 4) // Sets a random value between 1 and 4 to number.
        
        // An if statement that executes when number is given
        // the value of 1.
        if number == 1 {
            // Causes the ball to initially move
            // towards the bottom left corner at a
            // 45 degree angle.
            //
            // NOTE: A larger value for either
            // x or y causes a faster ball. Keeping the values
            // the same (whether positive of negative) allows
            // the ball to start at a 45 degree angle.
            ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: -10))
        }
            // An if statement that executes when number is given
            // the value of 2.
        else if number == 2 {
            // Causes the ball to initially move
            // towards the top right corner at a
            // 45 degree angle.
            ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
        }
            // An if statement that executes when number is given
            // the value of 3.
        else if number == 3 {
            // Causes the ball to initially move
            // towards the bottom right corner at a
            // 45 degree angle.
            ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: -10))
        }
            // An if statement that executes when number is given
            // the value of 4.
        else if number == 4 {
            // Causes the ball to initially move
            // towards the top left corner at a
            // 45 degree angle.
            ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 10))
        }
    }
    
    // Adds a point to the score of the one
    // who gets the ball past their opponent.
    func addScore(playerWhoWon: SKSpriteNode){
        
        // Resets the ball to the center of the screen
        // and prevents the inpulse from increasing each time the
        // ball resets.
        //
        // NOTE: Without this, the ball increases in speed
        // each time the score increase for either player or
        // enemy.
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        // Gives the user a point if the ball gets past the
        // enemy and sets the ball to head towards the enemy
        // when the next serve comes.
        if playerWhoWon == player {
            score[0] += 1 // Adds 1 to the user each time they win.
            
            let number = Int.random(in: 1 ... 2) // Sets a random value between 1 and 4 to number.
            
            // An if statement that executes when number is given
            // the value of 1.
            if number == 1 {
                // Causes the ball to initially move
                // towards the top right corner at a
                // 45 degree angle.
                ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 10))
            }
            // An if statement that executes when number is given
            // the value of2.
            else if number == 2 {
                // Causes the ball to initially move
                // towards the top left corner at a
                // 45 degree angle.
                ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 10))
            }
        }
        // Gives the enemy a point if the ball gets past the
        // player and sets the ball to head towards the player
        // when the next serve comes.
        else if playerWhoWon == enemy {
            score[1] += 1 // Adds 1 to the enemy each time they win.
            
            let number = Int.random(in: 1 ... 2) // Sets a random value between 1 and 4 to number.
            
            // An if statement that executes when number is given
            // the value of 1.
            if number == 1 {
                // Causes the ball to initially move
                // towards the bottom left corner at a
                // 45 degree angle.
                ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: -10))
            }
            // An if statement that executes when number is given
            // the value of 3.
            else if number == 2 {
                // Causes the ball to initially move
                // towards the bottom right corner at a
                // 45 degree angle.
                ball.physicsBody?.applyImpulse(CGVector(dx: 10, dy: -10))
            }
        }
    }
    
    // A function that activates when the user begins to touch
    // the screen.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // A for loop that runs for each touch given
        // by user.
        for touch in touches {
            let location = touch.location(in: self) // Locates the touch from the user on the screen.
            
            // An if statement that allows the use of
            // both paddles by users in the the two player mode.
            if currentGameType == .twoPlayer {
                if location.y < 0 {
                    // Allows player 1 (at the bottom half of the phone/tablet)
                    // to move the player paddle to
                    // wherever they touch their finger.
                    player.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y > 0 {
                    // Allows player 2 (at the top half of the phone/tablet)
                    // to move the enemy paddle to
                    // wherever they touch their finger.
                    //
                    // NOTE: This is an if statement instead of an "else if"
                    // statement since doing so allows both player one and two
                    // to move their resepctive paddles at the same time.
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }
            else {
                player.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
        }
    }
    // A function that activates when the user moves their
    // finger across the screen.
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // A for loop that runs as the user moves
        // their finger on the screen.
        for touch in touches {
            let location = touch.location(in: self) // Locates the touch from the user on the screen.
            
            // An if statement that allows the use of
            // both paddles by users in the the two player mode.
            if currentGameType == .twoPlayer {
                if location.y < 0 {
                    // Allows player 1 (at the bottom half of the phone/tablet)
                    // to move the player paddle to
                    // wherever they touch their finger.
                    player.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y > 0 {
                    // Allows player 2 (at the top half of the phone/tablet)
                    // to move the enemy paddle to
                    // wherever they touch their finger.
                    //
                    // NOTE: This is an if statement instead of an "else if"
                    // statement since doing so allows both player one and two
                    // to move their resepctive paddles at the same time.
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }
            // Else statement that runs when the user choses any
            // mode besides two player mode.
            else {
                player.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
        }
    }
    // A function that updates certain aspects in the game every
    // frame.
    // NOTE: Keep code to a minumum here, as more testing done
    // here will cause the quality of the game to decrease as
    // more things will need to be updated each frame if
    // code increases.
    override func update(_ currentTime: TimeInterval) {
        switch currentGameType {
        case .easy:
            // Allows the enemy paddle to follow the ball at slow rate.
            // The higher the value is for duration, the easier
            // of an opponent the enemy becomes. This is since
            // a longer delay is present for the enemy to track
            // the ball.
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
            break
        case .normal:
            // Allows the enemy paddle to follow the ball at a medium rate.
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.5))
            break
        case .hard:
            // Allows the enemy paddle to follow the ball at a fast rate.
            enemy.run(SKAction.moveTo(x: ball.position.x, duration: 0.3))
            break
        case .twoPlayer:
            
            break
        }

        // Gives the enemy a point when the ball goes past
        // the player's paddle.
        if ball.position.y <= player.position.y - 50 {
            addScore(playerWhoWon: enemy)
        }
        // Gives the player a point when the ball goes past
        // the enemy's paddle.
        else if ball.position.y >= enemy.position.y + 50 {
            addScore(playerWhoWon: player)
        }
        
        playerScore.text = "\(score[0])" // Prints the updated score for the player on the app.
        enemyScore.text = "\(score[1])" // Prints the updated score for the enemy on the app.
    }
}
