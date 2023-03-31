//
//  ResultViewController.swift
//  WordGame
//
//  Created by Johan Karlsson on 2023-03-22.
//

import UIKit

class ResultViewController: UIViewController {
    var finalScore = 0

    @IBOutlet weak var score: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        score.text = String(finalScore)

        // Just displayes the final score
    }
    


}
