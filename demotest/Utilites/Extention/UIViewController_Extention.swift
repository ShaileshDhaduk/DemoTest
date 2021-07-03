//
//  UIViewController_Extention.swift
//  demotest
//
//  Created by Atologist Mac 3 on 03/07/21.
//

import UIKit

extension UIViewController {
    
    class func loadController() -> Self {
        return instantiateViewControllerFromMainStoryBoard()
    }
    private class func instantiateViewControllerFromMainStoryBoard<T>() -> T
    {
        let controller = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier:
            String(describing: self)) as! T
        return controller
    }
    
    fileprivate static func topViewController(rootViewController: UIViewController) -> UIViewController {
        guard rootViewController.presentedViewController != nil else {
            if rootViewController is UITabBarController {
                let tabbarVC = rootViewController as! UITabBarController
                if let selectedViewController = tabbarVC.selectedViewController {
                    return UIViewController.topViewController(rootViewController: selectedViewController)
                }else {
                    return UIViewController()
                }
            }
                
            else if rootViewController is UINavigationController {
                let navVC = rootViewController as! UINavigationController
                return UIViewController.topViewController(rootViewController: navVC.viewControllers.last!)
            }
            
            return rootViewController
        }
        
        return topViewController(rootViewController: rootViewController.presentedViewController!)
    }
}

extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard{
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
