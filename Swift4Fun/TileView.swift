//
//  TileView.swift
//  Swift4Fun
//
//  Created by wesonz on 15/4/26.
//  Copyright (c) 2015年 wesonz. All rights reserved.

import UIKit

class TileView:UIButton{
    
    var numberLabel:UILabel
    //    var key:Int = 0{
    //        didSet {
    //            if key == 0  {
    //                self.key = self.value
    //            }
    //        }
    //    }
    
    var value:Int = 0{
        
        didSet{
            backgroundColor = UIColor.whiteColor()
            numberLabel.text = "\(value)"
        }
    }
    
    init(pos:CGPoint,width:CGFloat,value:Int){
        
        numberLabel = UILabel(frame:CGRectMake(0, 0, width, width))
        numberLabel.textColor = UIColor.blackColor()
        numberLabel.textAlignment = NSTextAlignment.Center
        numberLabel.minimumScaleFactor = 0.5
        
        numberLabel.font = UIFont(name:"微软雅黑",size:20)
        
        numberLabel.text = "\(value)"
        super.init(frame:CGRectMake(pos.x, pos.y, width, width))
        addSubview(numberLabel)
        self.value = value
        backgroundColor = UIColor.whiteColor()
        //self.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    func buttonClick (sender:TileView){
    //        println(sender.key)
    //    }
    
}
