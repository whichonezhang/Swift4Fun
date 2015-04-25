//
//  GameMod.swift
//  Swift4Fun
//
//  Created by wesonz on 15/4/26.
//  Copyright (c) 2015年 wesonz. All rights reserved.
//

import UIKit

class GameMod:UIViewController{
    
    
    func winTheGame(){
        let alertView = UIAlertView()
        alertView.addButtonWithTitle("YOU WIN!!!")
        alertView.show()
        alertView.delegate = self
    }
    
    func loseTheGame(){
        
        let alertView = UIAlertView()
        alertView.addButtonWithTitle("Oops sorry you lose....")
        alertView.show()
        alertView.delegate = self
        //MainController.buttons.removeAll(keepCapacity: true)
        //MainController().startGame()
        
    }
    
    func alertView (alertView:UIAlertView, clickedButtonAtIndex buttonIndex:Int){
        self.presentViewController(MainController(),animated:true,completion:nil)
    }
}

