//
//  NavigationTheme.swift
//  VIPERMarvelApiExample
//
//  Created by Kendy Nagao on 09/04/18.
//  Copyright © 2018 Kendy Nagao. All rights reserved.
//

import UIKit

class NavigationTheme: NSObject {
    func applyNavigationTheme() {
        UINavigationBar.appearance().barTintColor = UIColor.init(red: 240/255.0, green: 20/255.0, blue: 30/255.0, alpha: 1)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
    }
}
