//
//  ViewController.swift
//  TicTac
//
//  Created by User on 16/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum Tour {
        case Croix
        case Rond
    }

    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var premierTour = Tour.Croix
    var tourEnCours = Tour.Croix
    let ROND = "X"
    let CROIX = "O"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func boardTapAction(_  sender: UIButton) {
         
    }
    func ajouterAuPlateau(_  sender: UIButton){
        if (sender.title(for: .normal) == nil) {
           
            if (tourEnCours == Tour.Rond) {
                sender.setTitle(ROND, for: .normal)
                tourEnCours = Tour.Croix
                turnLabel.text = CROIX
                
            }
            if (tourEnCours == Tour.Croix) {
                sender.setTitle(CROIX, for: .normal)
                tourEnCours = Tour.Rond
                turnLabel.text = ROND
                
            }
        }
    }
    
}

