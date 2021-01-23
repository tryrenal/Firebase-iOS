//
//  SignUpViewController.swift
//  Firebase iOS
//
//  Created by Renaldy on 24/01/21.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonSignUp(_ sender: UIButton) {
        guard let email = tfEmail.text, !email.isEmpty, let password = tfPassword.text, !password.isEmpty else {
            self.alertErrorMessage(message: "Email or Password empty")
            return
        }

        Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] result, error in

            guard let strongSelf = self else {
                return
            }

            if error?.localizedDescription != nil {
                strongSelf.alertErrorMessage(message: error?.localizedDescription ?? "error register")
                return
            }

            strongSelf.navigationToHome()
        })
    }
    
    @IBAction func buttonToLogin(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "LoginScene") as! ViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
