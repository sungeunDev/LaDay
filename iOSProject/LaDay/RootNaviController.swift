//
//  RootNaviController.swift
//  LaDay
//
//  Created by Sungeun Park on 01/12/2018.
//  Copyright © 2018 Sungeun Park. All rights reserved.
//

import UIKit

class RootNaviController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationItemTitleView()
//        setHistoryViewIcon()
    }
}

extension UINavigationController {
    func setNavigationItemTitleView() {
        let width: CGFloat = 50
        let height: CGFloat = 35
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        imageView.image = UIImage(named: "logo-sm")
        logoContainer.addSubview(imageView)
        
        for idx in 0..<self.children.count {
            self.children[idx].navigationItem.titleView = logoContainer
        }
    }
    
    func setHistoryViewIcon() {
        let historyItem = UIBarButtonItem(image: UIImage(named: "ic-history-on"), style: .plain, target: self, action: nil)
        let writeItem = UIBarButtonItem(image: UIImage(named: "ic-write-off"), style: .plain, target: self, action: nil)
        
        for idx in 0..<self.children.count {
            self.children[idx].navigationItem.rightBarButtonItem  = writeItem
            self.children[idx].navigationItem.leftBarButtonItem  = historyItem
            
        
        }
        
    }
    
    func setWriteViewIcon() {
        let historyItem = UIBarButtonItem(image: UIImage(named: "ic-history-off"), style: .plain, target: self, action: nil)
        let writeItem = UIBarButtonItem(image: UIImage(named: "ic-write-on"), style: .plain, target: self, action: nil)
        
        for idx in 0..<self.children.count {
            self.children[idx].navigationItem.rightBarButtonItem  = writeItem
            self.children[idx].navigationItem.leftBarButtonItem  = historyItem
        }
    }
    
    func setNaviTitle() {
        let width: CGFloat = 50
        let height: CGFloat = 35
        
        let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        
        imageView.image = UIImage(named: "logo-sm")
        logoContainer.addSubview(imageView)
        
        self.navigationItem.titleView = logoContainer
    }
}
