//
//  ViewController.swift
//  WordGame
//
//  Created by Johan Karlsson on 2023-03-21.
//

import UIKit

class ViewController: UIViewController {
    
    let segueIdGoToGame = "goToGame"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: segueIdGoToGame, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdGoToGame {
            let destinationVC = segue.destination as? GameViewController
        }
    }
    
    

}

