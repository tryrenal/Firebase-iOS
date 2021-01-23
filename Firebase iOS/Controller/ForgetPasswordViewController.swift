//
//  ForgetPasswordViewController.swift
//  Firebase iOS
//
//  Created by Renaldy on 24/01/21.
//

import UIKit
import Firebase

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonSendForgetPassword(_ sender: UIButton) {
        guard let email = tfEmail.text, !email.isEmpty else {
            self.alertErrorMessage(message: "Email is empty")
            return
        }

        Auth.auth().sendPasswordReset(withEmail: email, completion: { [weak self] error in
            guard let strongSelf = self else {
                return
            }
            if error == nil {
                strongSelf.alertForgetPassword(message: "Silahkan cek email anda")
            } else {
                strongSelf.alertErrorMessage(message: "error forget password")
            }
        })
    }
    
    func navigationToLogin(){
        let vc = storyboard?.instantiateViewController(identifier: "LoginScene") as! ViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func alertForgetPassword(message: String){
        let alert = UIAlertController(title: "Berhasil!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] action in
            
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.navigationToLogin()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
