//
//  SplashViewController.swift
//  Firebase iOS
//
//  Created by Renaldy on 15/02/21.
//

import UIKit
import Firebase

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.checkLoggedInUser()
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


