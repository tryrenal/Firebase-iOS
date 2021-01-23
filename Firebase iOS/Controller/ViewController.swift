//
//  ViewController.swift
//  Firebase iOS
//
//  Created by Renaldy on 18/01/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.checkLoggedInUser()
    
    }
    
    
    @IBAction func buttonLogin(_ sender: UIButton) {
        guard let email = tfEmail.text, !email.isEmpty, let password = tfPassword.text, !password.isEmpty else {
            self.alertErrorMessage(message: "Email or Password empty")
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            
            if error?.localizedDescription != nil {
                strongSelf.alertErrorMessage(message: error?.localizedDescription ?? "error login")
                return
            }
            
            strongSelf.navigationToHome()
        })
    }
    

    @IBAction func buttonToForgetPassword(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "ForgetPasswordScene") as! ForgetPasswordViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func buttonToSignUp(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "SignUpScene") as! SignUpViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func checkLoggedInUser() {
        if (Auth.auth().currentUser) != nil {
            DispatchQueue.main.async {
                self.navigationToHome()
            }
        }
    }
}

extension UIViewController {
    func alertErrorMessage(message: String){
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func navigationToHome(){
        let vc = storyboard?.instantiateViewController(identifier: "HomeScene") as! HomeViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
}

