//
//  HomeViewController.swift
//  Firebase iOS
//
//  Created by Renaldy on 18/01/21.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnLogout(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            toSplashScreen()
        }
        catch {
            self.alertErrorMessage(message: "error logout")
        }
        
    }
    
    func toSplashScreen(){
        let vc = storyboard?.instantiateViewController(identifier: "SplashScene") as!
            SplashViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
