//
//  LoginVC.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 12/05/2021.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    @IBAction func btnLoginPressed(_ sender: Any) {
        let tab = BaseTabBar()
        tab.modalPresentationStyle = .fullScreen
        present(tab, animated: true)
    }
    
    func setupUI() {
        btnLogin.layer.cornerRadius = 5
    }
    
    @IBAction func editEmailTxtFld(_ sender: UITextField) {
        sender.validateTxtFld(txtFld: sender, secondTxtFld: passwordTxtFld, button: btnLogin)
    }
    
    @IBAction func editPasswordTxtFld(_ sender: UITextField) {
        sender.validateTxtFld(txtFld: sender, secondTxtFld: emailTxtFld, button: btnLogin)
    }
}
