//
//  CurrentController.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import UIKit

class CurrentController: NSObject {
    
    func topMostController() -> UIViewController {
        
        var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        var tabController: UITabBarController?
        
        if (UIApplication.shared.keyWindow?.rootViewController?.isKind(of: UITabBarController.self))! {
            
            tabController = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController
            topController = tabController?.selectedViewController
        }
        
        while ((topController?.presentedViewController) != nil) {
            topController = topController?.presentedViewController
        }
        
        return topController!
    }
    
}
