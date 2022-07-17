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
    var ROND = "X"
    var CROIX = "O"
    var board = [UIButton]()
    var scoreRond = 0
    var scoreCroix = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func boardTapAction(_  sender: UIButton) {
      
        addToBoard(sender)

        if verifierVictoire(CROIX){
            afficherResultats(title: "Player 1 win")
            scoreRond += 1
        }
        if verifierVictoire(ROND){
            afficherResultats(title: "Player 2 win")
            scoreCroix += 1
        }
        
        if (fullBoard()){

            afficherResultats(title: "Recommencer")
        }
        
    }
    
    func addToBoard(_  sender: UIButton){
        if sender.title(for: .normal) == nil {
           
            if tourEnCours == Tour.Rond {
                sender.setTitle(ROND, for: .normal)
                tourEnCours = Tour.Croix
                turnLabel.text = CROIX
           }
            else if tourEnCours == Tour.Croix {
                sender.setTitle(CROIX, for: .normal)
                tourEnCours = Tour.Rond
                turnLabel.text = ROND
                
            }
            sender.isEnabled = false
        }
    }
    
    func initBoard(){
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
        
    }
    
 
    
    func fullBoard()-> Bool {
       
        if a1.title(for: .normal) != nil && a2.title(for: .normal) != nil && a3.title(for: .normal) != nil && b1.title(for: .normal) != nil && b2.title(for: .normal) != nil && b3.title(for: .normal) != nil && c1.title(for: .normal) != nil && c2.title(for: .normal) != nil && c3.title(for: .normal) != nil{
            return true
        }

        
      return false
 
      }

    
    
    
    func thisSymbol(_ button : UIButton, _ symbol : String) -> Bool{
        return button.title(for: .normal) == symbol
    }
   
    
    func verifierVictoire(_ s : String)-> Bool {
        
        // victoire Horizontales
        if thisSymbol(a1, s) && thisSymbol(a2, s)  && thisSymbol(a3, s){
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s)  && thisSymbol(b3, s){
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s)  && thisSymbol(c3, s){
            return true
        }
        
        // victoires verticales
        
        if thisSymbol(a1, s) && thisSymbol(b1, s)  && thisSymbol(c1, s){
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s)  && thisSymbol(c2, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s)  && thisSymbol(c3, s){
            return true
        }
        // victoires diagonales
        
        if thisSymbol(a1, s) && thisSymbol(b2, s)  && thisSymbol(c3, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s)  && thisSymbol(c1, s){
            return true
        }
        
        return false
    }
    

    func ReinitPlateau() {
        
        a1.setTitle(nil, for: .normal)
        a2.setTitle(nil, for: .normal)
        a3.setTitle(nil, for: .normal)
        b1.setTitle(nil, for: .normal)
        b2.setTitle(nil, for: .normal)
        b3.setTitle(nil, for: .normal)
        c1.setTitle(nil, for: .normal)
        c2.setTitle(nil, for: .normal)
        c3.setTitle(nil, for: .normal)

        if ( premierTour == Tour.Rond){
            premierTour = Tour.Croix
            turnLabel.text = "CROIX" }
        else if ( premierTour == Tour.Croix){
            premierTour = Tour.Rond
            turnLabel.text = "ROND" }

        tourEnCours = premierTour
    }
   
    
    func afficherResultats(title : String){
        let message = "\nplayer one " + String(scoreCroix) + "\nplayer two " + String(scoreRond)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Recommencer", style: .default, handler: { (_) in self.ReinitPlateau()
            }))
        self.present(ac, animated: true)
    }
    
    
  

    }




//}


// func reinitAButton( _ button : UIButton) {
//     button.setTitle(nil, for: .normal)
//
// }
//
// func reinitBouttons() {
//     reinitAButton(a1)
//     reinitAButton(a2)
//     reinitAButton(a3)
//     reinitAButton(b1)
//     reinitAButton(b2)
//     reinitAButton(b3)
//     reinitAButton(c1)
//     reinitAButton(c2)
//     reinitAButton(c3)
// }
