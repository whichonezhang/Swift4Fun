//
//  MainController.swift
//  Swift4Fun
//
//  Created by wesonz on 15/4/26.
//  Copyright (c) 2015年 wesonz. All rights reserved.
//

import UIKit

class MainController:UIViewController {
    
    var dimension:Int = 4  //游戏维度
    
    let maxRandNum:Int = 14    //random最大的数值
    
    let randCount:Int = 9     //random多少个数
    
    var width:CGFloat = 50  //单元格边长
    
    var padding:CGFloat = 6   //单元格间距
    
    var backgrounds:Array<UIButton>
    
    var timeTable:UILabel?
    
    var timer:NSTimer?
    
    static var flag = 0
    
    var remainingSeconds:Int = 0 {
        willSet(newSeconds) {
            
            let mins = newSeconds / 600
            let seconds = newSeconds/10 % 60
            let millisecond = newSeconds % 10
            
            timeTable!.text = NSString(format: "%02d:%02d:%d", mins, seconds, millisecond) as String
            
            if newSeconds <= 0 {
                isCounting = false
                
            }
            
        }
    }
    
    var isCounting: Bool = false {
        willSet(newValue) {
            if newValue {
                timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateTimer:", userInfo: nil, repeats: true)
            } else {
                timer?.invalidate()
                timer = nil
            }
            //setSettingButtonsEnabled(!newValue)
        }
    }
    
    static var buttons:Array<MyButton> = Array<MyButton>()   //存储buttons的array数组
    
    init(){
        
        self.backgrounds = Array<UIButton>()
        //self.buttons = Array<MyButton>()
        super.init(nibName:nil,bundle:nil)
        startGame()
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSThread.detachNewThreadSelector(Selector("threadProc1:"), toTarget: self, withObject:nil)
        println("onlyone")
        
    }
    
    func startGame(){
        setupBackGround()
        hideButtons()
        genNumber()
        //(NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "hideButtons", userInfo: nil, repeats:true)).fire()
        //hideButtons()
        //self.view.addSubview(label)
        NSThread.detachNewThreadSelector(Selector("threadProc:"), toTarget: self, withObject:nil)
        
        
    }
    
    func threadProc(thread: NSThread) {
        NSTimer.scheduledTimerWithTimeInterval(8.0, target: self, selector:Selector("userTimerHandler:"), userInfo: nil, repeats: false)
        NSRunLoop.currentRunLoop().run()
    }
    func threadProc1(thread: NSThread) {
        NSTimer.scheduledTimerWithTimeInterval(8.0, target: self, selector:Selector("userTimerHandler1:"), userInfo: nil, repeats: false)
        NSRunLoop.currentRunLoop().run()
    }
    func userTimerHandler1(timer: NSTimer) {
        var mainTimer1 = NSTimer(timeInterval: 1.0, target: self, selector:Selector("uiTimerHandler1:"), userInfo: nil, repeats: true)
        NSRunLoop.mainRunLoop().addTimer(mainTimer1, forMode: NSDefaultRunLoopMode)
        
    }
    func userTimerHandler(timer: NSTimer) {
        var mainTimer = NSTimer(timeInterval: 0.1, target: self, selector:Selector("uiTimerHandler:"), userInfo: nil, repeats: false)
        NSRunLoop.mainRunLoop().addTimer(mainTimer, forMode: NSDefaultRunLoopMode)
    }
    
    func uiTimerHandler(timer: NSTimer) {
        //线程执行代码
        //println("proc--------------")
        hideAgain()
        setupTimeLabel()
        timeTable!.frame = CGRectMake(0, self.view.bounds.size.height-150, self.view.bounds.size.width, 80)
        self.isCounting = true
        //self.view.addSubview(timeTable!)
        //self.addChildViewController(TimerCounter())
        //self.view.removeFromSuperview()
        
    }
    
    func uiTimerHandler1(timer: NSTimer) {
        //线程执行代码
        //println("proc1--------------")
        if MainController.flag == 1 {
            //self.view.removeFromSuperview()
            restartGame()
            MainController.flag = 0
        }
        //self.view.removeFromSuperview()
        if MyButton.winFlag == 1 {
            self.isCounting = false
            let alertView = UIAlertView()
            alertView.addButtonWithTitle("you finished it in \(self.remainingSeconds/10)' \(self.remainingSeconds%10)'' seconds!!")
            alertView.show()
            alertView.removeFromSuperview()
            MyButton.winFlag = 0
            //alertView.delegate = self
        }
        
    }
    
    func setupBackGround(){
        var x:CGFloat = 50
        var y:CGFloat = 150
        
        for var i=0; i<dimension; i++
        {
            
            y = 150
            for var j=0; j<dimension; j++
            {
                
                var background = UIView(frame: CGRectMake(x, y, width, width))
                
                //background.addTarget(self, action: nil, forControlEvents: UIControlEvents.TouchUpInside)
                
                background.backgroundColor = UIColor.darkGrayColor()
                
                self.view.addSubview(background)
                
                //backgrounds.append(background)
                
                y += padding + width
            }
            x += padding + width
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func genNumber (){
        
        var results:Array<Int> = rand4num(maxRandNum, randCount: randCount)
        //println(results)
        
        
        for var i=0; i<9; i++ {
            insertTile((results[i]%dimension,results[i]/dimension), value: i+1)
            //println(self.buttons.count)
            for var j=0; j<MainController.buttons.count; j++ {
                //println(self.buttons[j].value)
                if MainController.buttons[j].value == results[i] {
                    //println("\(MainController.buttons[j].value)------\(results[i])")
                    MainController.buttons[j].key = i+1
                    //println("\(MainController.buttons[j].key)------\(i)")
                }
            }
            
        }
        
    }
    
    //生成不重复随机数
    func rand4num (maxRandNum:Int,randCount:Int) -> [Int]{
        
        var numbers = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
        var results = [Int]()
        //println(maxRandNum)
        //println(randCount)
        var i = 1
        do {
            
            var index = Int(arc4random_uniform(UInt32(maxRandNum)+1))
            
            i++
            if(numbers[index] == 0){
                numbers[index] = 1
                results.append(index)
                //println(nums[index])
                
            }
            else if(numbers[index] == 1){
                i--
            }
            
            
        }while(i <= randCount && i >= 1)
        
        return results
    }
    
    func insertTile(pos:(Int,Int),value:Int){
        
        let(row,col) = pos
        
        let x = 50 + CGFloat(col) * (width + padding)
        let y = 150 + CGFloat(row) * (width + padding)
        
        let tile = TileView(pos:CGPointMake(x, y),width:width,value:value)
        
        self.view.addSubview(tile)
        self.view.bringSubviewToFront(tile)
        
        tile.layer.setAffineTransform(CGAffineTransformMakeScale(0.1, 0.1))
        UIView.animateWithDuration(0.3, delay:0.2, options:UIViewAnimationOptions.TransitionNone,animations:{
            ()->Void in
            tile.layer.setAffineTransform(CGAffineTransformMakeScale(1, 1))
            },
            completion:{(finished:Bool)->Void in
                UIView.animateWithDuration(0.1, animations: {()->Void in
                    tile.layer.setAffineTransform(CGAffineTransformIdentity)
                })
            }
        )
        
    }
    
    func hideButtons(){
        var x:CGFloat = 50
        var y:CGFloat = 150
        
        for var i=0; i<dimension; i++
        {
            
            y = 150
            for var j=0; j<dimension; j++
            {
                
                let hideTile = MyButton(pos:CGPointMake(x, y), width:width, value:(i*dimension+j))
                hideTile.setPosition(i+1, y: j+1)
                self.view.addSubview(hideTile)
                MainController.buttons.append(hideTile)
                y += padding + width
            }
            x += padding + width
        }
    }
    
    func hideAgain(){
        
        var x:CGFloat = 50
        var y:CGFloat = 150
        
        for var i=0; i<dimension; i++
        {
            
            y = 150
            for var j=0; j<dimension; j++
            {
                
                //let hideTile = MyButton(pos:CGPointMake(x, y), width:width, value:(i*dimension+j))
                self.view.addSubview(MainController.buttons[i*dimension+j])
                //self.buttons.append(hideTile)
                y += padding + width
            }
            x += padding + width
        }
        
    }
    
    func updateTimer(sender: NSTimer) {
        remainingSeconds += 1
        
        if remainingSeconds <= 0 {
            let alert = UIAlertView()
            alert.title = "计时完成！"
            alert.message = ""
            alert.addButtonWithTitle("OK")
            alert.show()
            
        }
    }
    
    func setupTimeLabel() {
        
        timeTable = UILabel()
        timeTable!.textColor = UIColor.whiteColor()
        timeTable!.font = UIFont(name: "Helvetica", size: 60)
        timeTable!.backgroundColor = UIColor.blackColor()
        timeTable!.textAlignment = NSTextAlignment.Center
        
        self.view.addSubview(timeTable!)
    }
    
    func restartGame(){
        
        //println("restart!------")
        MyButton.staticCount = 16
        self.isCounting = false
        self.remainingSeconds = 0
        MainController.buttons.removeAll(keepCapacity: true)
        self.backgrounds = Array<UIButton>()
        startGame()
    }
    
    
}
