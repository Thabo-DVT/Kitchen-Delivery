//
//  ViewController.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/07.
//

import UIKit

class LoginViewController: UIViewController, LoginViewModelDelegate {
    
    func navToLandingPage() {
        self.performSegue(withIdentifier: "LoginToHome", sender: self)
    }
    
    func showError(error: String) {
        ErrorLabel.text = error
    }
    

    private lazy var viewModel = LoginViewModel(delegate: self, initial: KitchenServiceImplement())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let textFieldBoarderColour = UIColor.black
        UsernameTextField.layer.borderColor = textFieldBoarderColour.cgColor
        PasswordTextField.layer.borderColor = textFieldBoarderColour.cgColor
        
        UsernameTextField.layer.borderWidth = 1.0
        PasswordTextField.layer.borderWidth = 1.0
        ErrorLabel.text = ""
        }

    

    @IBOutlet weak var ErrorLabel: UILabel!
    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBAction func ContinueButton(_ sender: UIButton) {
        if (viewModel.logUserIn(UsernameTextField.text ?? "", PasswordTextField.text ?? "")) {
           navToLandingPage()
        }else{
            showError(error: "Incorrect Details")
            
        }
    }

    @IBOutlet weak var PasswordTextField: UITextField!
}

