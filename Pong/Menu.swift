//
//  Menu.swift
//  Pong
//
//  Created by MacMini on 6/23/19.
//  Copyright © 2019 Mohammad Khan. All rights reserved.
//

import Foundation
import UIKit

// Represents the enumerated types for
// the different options to be given to
// to the player when choosing the type
// of game they want to play.
enum gameType {
    case easy // Enum used for an easy game against the computer.
    case normal // Enum used for a normal game against the computer.
    case hard // Enum used for a hard game against the computer.
    case twoPlayer // Enum used for when the player wished to play a two player game.
}

class Menu: UIViewController {
    // Represents the "Easy" button on the main menu.
    @IBAction func Easy(_ sender: Any) {
        moveToGame(game: .easy)
    }
    // Represents the "Normal" button on the main menu.
    @IBAction func Normal(_ sender: Any) {
        moveToGame(game: .normal)
    }
    // Represents the "Hard" button on the main menu.
    @IBAction func Hard(_ sender: Any) {
        moveToGame(game: .hard)
    }
    // Represents the "Two Player Mode" button on the main menu.
    @IBAction func TwoPlayerMode(_ sender: Any) {
        moveToGame(game: .twoPlayer)
    }
    // A function that allows the player to move
    // from the main menu to their game option
    // of choice (represents by enum gameType).
    func moveToGame(game: gameType) {
        // Allows the main menu to reference to the GameViewController class that
        // contains the game(s) the user can select to play.
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        // Sets the game type choosen from the main menu
        // as the current game to be played.
        currentGameType = game
        
        // Pushes the menu into the selected game.
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
}
