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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
