//
//  MainTabController.swift
//  Swift4Fun
//
//  Created by wesonz on 15/4/26.
//  Copyright (c) 2015年 wesonz. All rights reserved.
//

import UIKit

class MainTabController:UITabBarController {
    
    init()
    {
        super.init(nibName:nil,bundle:nil)
        
        var mainView = MainController()
        
        var settingView = SettingController()
        
        settingView.title = "setting"
        
        var main = UINavigationController(rootViewController: mainView)
        
        var setting = UINavigationController(rootViewController: settingView)
        
        self.viewControllers = [main,setting]
        
        self.selectedIndex = 0
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
