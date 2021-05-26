//
//  UITextField+Extensions.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 13/05/2021.
//

import UIKit

extension UITextField {
    
    func validateTxtFld(txtFld: UITextField, secondTxtFld: UITextField, button: UIButton)  {
        if txtFld == txtFld {
            if txtFld.text?.isEmpty == true && secondTxtFld.text?.isEmpty == true {
                button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.9539994597, green: 0.9607619643, blue: 0.9640105367, alpha: 1))
                button.setTitleColor(#colorLiteral(red: 0.5927093625, green: 0.5959585905, blue: 0.5958774686, alpha: 1), for: .normal)
                //button.isEnabled = false
            } else if txtFld.text?.isEmpty == false && secondTxtFld.text?.isEmpty == true {
                button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.9539994597, green: 0.9607619643, blue: 0.9640105367, alpha: 1))
                button.setTitleColor(#colorLiteral(red: 0.5927093625, green: 0.5959585905, blue: 0.5958774686, alpha: 1), for: .normal)
                //button.isEnabled = false
            } else if txtFld.text?.isEmpty == true && secondTxtFld.text?.isEmpty == false {
                button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.9539994597, green: 0.9607619643, blue: 0.9640105367, alpha: 1))
                button.setTitleColor(#colorLiteral(red: 0.5927093625, green: 0.5959585905, blue: 0.5958774686, alpha: 1), for: .normal)
                //button.isEnabled = false
            } else {
                button.backgroundColor = UIColor(cgColor: #colorLiteral(red: 0.149002701, green: 0.1490303874, blue: 0.148996681, alpha: 1))
                button.setTitleColor(#colorLiteral(red: 0.9999126792, green: 1, blue: 0.9998814464, alpha: 1), for: .normal)
                button.isEnabled = true
            }
        }
    }
}
