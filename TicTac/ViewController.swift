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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func boardTapAction(_  sender: UIButton) {
      
        addToBoard(sender)
//        turnLabel.text = fullBoard()
        
        if verifierVictoire(CROIX){
            afficherResultats(title: "Joueur 1 a gagné")
            scoreRond += 1
        }
        if verifierVictoire(ROND){
            afficherResultats(title: "Joueur 2 a gagné")
            scoreCroix += 1
        }
        fullBoard()
//        if (fullBoard()){
//
//            afficherResultats(title: "Recommencer")
//        }
        
         
    }
    
    func initialiserPlateau(){
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
    
    
    func addToBoard(_  sender: UIButton){
        if (sender.title(for: .normal) == nil) {
           
            if (tourEnCours == Tour.Rond) {
                sender.setTitle(ROND, for: .normal)
                tourEnCours = Tour.Croix
                turnLabel.text = CROIX
                
            }
            else if (tourEnCours == Tour.Croix) {
                sender.setTitle(CROIX, for: .normal)
                tourEnCours = Tour.Rond
                turnLabel.text = ROND
                
            }
            sender.isEnabled = false
        }
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
    

    
    func fullBoard()-> Bool
    {
      
        
        for button in board
        {
            if button.title(for: .normal) == nil {
                return false
                
              //  return false
            }
        }
        return true
 
      }
    
   
    
   
    
    func afficherResultats(title : String){
        
        
        
        let message = "\n1 jouer " + String(scoreCroix) + "\n2 joueur " + String(scoreRond)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Recommencer", style: .default, handler: { (_) in self.ReinitPlateau()

        }))
        self.present(ac, animated: true)
    }
    
    func ReinitPlateau() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if ( tourEnCours == Tour.Rond){
            tourEnCours = Tour.Croix
            turnLabel.text = "CROIX"
        }
        else if ( tourEnCours == Tour.Croix){
            tourEnCours = Tour.Rond
            turnLabel.text = "ROND"
        }
    
        tourEnCours = premierTour
    }

    
}

