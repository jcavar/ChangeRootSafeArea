//
//  ViewController.swift
//  TestAccessoryViewWindowRoot
//
//  Created by Josip Cavar on 28/09/2018.
//  Copyright © 2018 novastonemedia. All rights reserved.
//

import UIKit

class AccessoryView: UIView {
}

class ViewController: UIViewController {
    private let accessoryView = AccessoryView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessoryView.backgroundColor = UIColor.red
        let innerView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        innerView.translatesAutoresizingMaskIntoConstraints = false
        innerView.backgroundColor = UIColor.green
        accessoryView.addSubview(innerView)
        accessoryView.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: innerView.leftAnchor).isActive = true
        accessoryView.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: innerView.rightAnchor).isActive = true
        accessoryView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: innerView.bottomAnchor).isActive = true
        accessoryView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: innerView.topAnchor).isActive = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        becomeFirstResponder()
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        
        for window in UIApplication.shared.windows {
            print(window.safeAreaLayoutGuide)
        }
    }
    
    override var inputAccessoryView: UIView? {
        return accessoryView
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    @IBAction func changeRoot(_ sender: Any) {
        let vc = self.storyboard?.instantiateInitialViewController()
        let window = self.view.window!
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
}

