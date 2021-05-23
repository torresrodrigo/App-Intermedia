//
//  LoginVC.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 12/05/2021.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var stackViewTxtFld: UIStackView!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwordTxtFld: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    
    
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
                    self.showError()
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
        errorView.layer.cornerRadius = 5
        
    }
    
    @IBAction func editEmailTxtFld(_ sender: UITextField) {
        sender.validateTxtFld(txtFld: sender, secondTxtFld: passwordTxtFld, button: btnLogin)
    }
    
    @IBAction func editPasswordTxtFld(_ sender: UITextField) {
        sender.validateTxtFld(txtFld: sender, secondTxtFld: emailTxtFld, button: btnLogin)
    }
    
    private func showError() {
        
        
        self.errorView.isHidden = false
        self.errorLabel.isHidden = false
        self.stackViewTxtFld.arrangedSubviews.first?.layer.borderWidth = 3
        self.stackViewTxtFld.arrangedSubviews.last?.layer.borderWidth = 3
        self.stackViewTxtFld.arrangedSubviews.first?.layer.borderColor = CGColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        self.stackViewTxtFld.arrangedSubviews.last?.layer.borderColor = CGColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        UIView.animate(withDuration: 2, delay: 3,  options: UIView.AnimationOptions.transitionFlipFromBottom) {
            self.errorView.alpha = 0
            self.errorLabel.alpha = 0
        } completion: { finished in
            self.errorView.isHidden = true
            self.errorLabel.isHidden = true
            self.stackViewTxtFld.arrangedSubviews.first?.layer.borderWidth = 0
            self.stackViewTxtFld.arrangedSubviews.last?.layer.borderWidth = 0
        }
    }
}
