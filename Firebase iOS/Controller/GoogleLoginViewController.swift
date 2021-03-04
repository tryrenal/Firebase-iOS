//
//  GoogleLoginViewController.swift
//  Firebase iOS
//
//  Created by Renaldy on 04/03/21.
//

import UIKit
import Firebase
import GoogleSignIn

class GoogleLoginViewController: UIViewController, GIDSignInDelegate {
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
    }
    @IBAction func googleLogin(_ sender: UIButton) {
        
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let auth = user.authentication else {return}
        let credential = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        
        Auth.auth().signIn(with: credential) { (result, error) in
            if error?.localizedDescription != nil {
                self.alertErrorMessage(message: error?.localizedDescription ?? "error login")
                return
            }
            
            self.navigationToHome()
            
        }
    }
    

}
