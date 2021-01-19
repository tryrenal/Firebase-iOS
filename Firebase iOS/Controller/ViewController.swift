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
    

    @IBAction func buttonRegister(_ sender: UIButton) {
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
    
    @IBAction func buttonForgetPassword(_ sender: UIButton) {
        guard let email = tfEmail.text, !email.isEmpty else {
            self.alertErrorMessage(message: "Email is empty")
            return
        }
        
        Auth.auth().sendPasswordReset(withEmail: email, completion: { [weak self] error in
            guard let strongSelf = self else {
                return
            }
            if error != nil {
                strongSelf.alertErrorMessage(message: "Silahkan cek email anda")
            } else {
                print("error for forget password")
            }
        })
        
    }
    
    
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
    
    func checkLoggedInUser() {
        if (Auth.auth().currentUser) != nil {
            DispatchQueue.main.async {
                self.navigationToHome()
            }
        }
    }
}

