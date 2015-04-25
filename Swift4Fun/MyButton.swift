
//
//  MyButton.swift
//  Swift4Fun
//
//  Created by wesonz on 15/4/26.
//  Copyright (c) 2015年 wesonz. All rights reserved.
//


import UIKit

class MyButton:UIButton {
    
    var value:Int
    var x:Int?
    var y:Int?
    let dimension:Int = 4
    var start:NSTimeInterval = NSDate().timeIntervalSince1970
    static var staticCount:Int = MainController.buttons.count
    static var winFlag = 0
    
    var key:Int = 0{
        willSet {
            if key == 0  {
                self.key = self.value
            }
        }
    }
    
    func setPosition(x:Int ,y:Int){
        self.x = x
        self.y = y
    }
    
    init(pos:CGPoint,width:CGFloat,value:Int){
        
        self.value = value
        super.init(frame:CGRectMake(pos.x, pos.y, width, width))
        backgroundColor = UIColor.darkGrayColor()
        self.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func buttonAction(sender:MyButton!){
        
        
        //println(sender.key)
        //println(MainController.buttons.count)
        
        if(sender.key == 1){
            //TimerCounter
            //TimerCounter()
            start = NSDate().timeIntervalSince1970
            sender.removeFromSuperview()
            sender.removeTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            //println("\(sender.x!) ++++ \(sender.y!)")
            //MainController.buttons.removeAtIndex(sender.x! + sender.y!*dimension)
            MyButton.staticCount--
            println(start)
        }
            //println(MainController.buttons.count)
        else if(sender.key==2 && MyButton.staticCount == 15){
            sender.removeFromSuperview()
            sender.removeTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            //MainController.buttons.removeAtIndex(sender.x! + sender.y!*dimension)
            MyButton.staticCount--
            
        }
        else if(sender.key==3 && MyButton.staticCount == 14){
            sender.removeFromSuperview()
            sender.removeTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            //MainController.buttons.removeAtIndex(sender.x! + sender.y!*dimension)
            MyButton.staticCount--
            
        }
        else if(sender.key==4 && MyButton.staticCount == 13){
            sender.removeFromSuperview()
            sender.removeTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            //MainController.buttons.removeAtIndex(sender.x! + sender.y!*dimension)
            MyButton.staticCount--
            
        }
        else if(sender.key==5 && MyButton.staticCount == 12){
            sender.removeFromSuperview()
            sender.removeTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            //MainController.buttons.removeAtIndex(sender.x! + sender.y!*dimension)
            MyButton.staticCount--
            
        }
        else if(sender.key==6 && MyButton.staticCount == 11){
            sender.removeFromSuperview()
            sender.removeTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            //MainController.buttons.removeAtIndex(sender.x! + sender.y!*dimension)
            MyButton.staticCount--
            
        }
        else if(sender.key==7 && MyButton.staticCount == 10){
            sender.removeFromSuperview()
            sender.removeTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            //MainController.buttons.removeAtIndex(sender.x! + sender.y!*dimension)
            MyButton.staticCount--
            
        }
        else if(sender.key==8 && MyButton.staticCount == 9){
            sender.removeFromSuperview()
            sender.removeTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            //MainController.buttons.removeAtIndex(sender.x! + sender.y!*dimension)
            MyButton.staticCount--
            
        }
        else if(sender.key==9 && MyButton.staticCount == 8){
            let tc = TimeCount(start:start)
            let count = tc.timeCount(NSDate().timeIntervalSince1970)
            //you win!
            sender.removeFromSuperview()
            sender.removeTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
            GameMod().winTheGame()
            MainController.flag = 1
            MyButton.winFlag = 1
            //MainTabController()
            
        }
        else {
            sender.removeFromSuperview()
            //游戏结束
            GameMod().loseTheGame()
            MainController.flag = 1
            //MainController()
            //MainController().threadProc(thread: NSThread)
        }
        
    }
    
}

