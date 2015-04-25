//
//  TimeCount.swift
//  Swift4Fun
//
//  Created by wesonz on 15/4/26.
//  Copyright (c) 2015年 wesonz. All rights reserved.
//

import Foundation
class TimeCount {
    let startTime:NSTimeInterval
    
    
    init(start:NSTimeInterval){
        self.startTime = start
    }
    
    func timeCount(start:NSTimeInterval)->NSTimeInterval{
        let endtime = NSDate().timeIntervalSince1970
        //println(endtime)
        var count:NSTimeInterval = endtime - self.startTime
        //println(count)
        return count
    }
    
}
