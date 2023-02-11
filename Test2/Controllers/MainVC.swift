//
//  ViewController.swift
//  Test2
//
//  Created by Никита Чечнев on 05.02.2023.
//

import UIKit

class MainVC: UIViewController {
    
    let child = EmployeesVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(child)
        child.view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}

