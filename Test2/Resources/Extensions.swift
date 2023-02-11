//
//  Extensions.swift
//  Test2
//
//  Created by Никита Чечнев on 06.02.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}

extension EmployeesVC {
    
    func presentAC(withTitle title: String, message: String, style: UIAlertController.Style) {
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default)
        ac.addAction(action)
        
        present(ac, animated: true)
    }
}


