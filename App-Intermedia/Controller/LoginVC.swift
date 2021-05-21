//
//  LoginVC.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 12/05/2021.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func btnLoginPressed(_ sender: Any) {
        if emailTxtFld.text != nil && passwordTxtFld.text != nil {
            FirebaseAuthService.instance.loginUser(withEmail: emailTxtFld.text!, andPassword: passwordTxtFld.text!) { (sucess, loginError) in
                if sucess {
                    let tab = BaseTabBar(nibName: "BaseTabBar", bundle: nil)
                    tab.modalPresentationStyle = .fullScreen
                    self.present(tab, animated: true)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                FirebaseAuthService.instance.registerUser(withEmail: self.emailTxtFld.text!, andPassword: self.passwordTxtFld.text!) { (sucess, registrationError) in
                    if sucess {
                        FirebaseAuthService.instance.loginUser(withEmail: self.emailTxtFld.text!, andPassword: self.passwordTxtFld.text!) { (sucess, nil) in
                            print("Sucessfully registered user")
                            let tab = BaseTabBar(nibName: "BaseTabBar", bundle: nil)
                            tab.modalPresentationStyle = .fullScreen
                            self.present(tab, animated: true)
                        }
                    }
                }
                
            }
        }
        
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
