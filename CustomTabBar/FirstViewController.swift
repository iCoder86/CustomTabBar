//
//  FirstViewController.swift
//  CustomTabBar
//
//  Created by Mehul on 06/12/18.
//  Copyright © 2018 Mehul. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet var scrollView: UIScrollView!
    var headerVisible = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 2 * self.view.frame.height)
    }

}

extension FirstViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let translation = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        performHeaderCheck(translation: translation)
    }
    
    func performHeaderCheck(translation:CGPoint) {
        if translation.y == 0 { return }
        if translation.y > 0 {
            // Scroll Down
            if !headerVisible {
                showHeader()
            }
        } else {
            // Scroll Up
            if headerVisible {
                hideHeader()
            }
        }
    }
    
    func hideHeader() {
        self.headerVisible = false
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            let parent = self.parent as! TabViewController
            parent.hideHeader()
        })
    }
    
    func showHeader() {
        self.headerVisible = true
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            let parent = self.parent as! TabViewController
            parent.showHeader()
        })
    }
}
