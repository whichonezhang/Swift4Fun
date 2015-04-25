//
//  ViewController.swift
//  swift4fun
//
//  Created by wesonz on 15/4/18.
//  Copyright (c) 2015年 wesonz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startButtonTapped (sender:UIButton){
        
        let alertView = UIAlertView()
        alertView.addButtonWithTitle("start up!")
        alertView.show()
        alertView.delegate = self
    }
    
    func alertView (alertView:UIAlertView, clickedButtonAtIndex buttonIndex:Int){
        self.presentViewController(MainTabController(),animated:true,completion:nil)
    }
}

