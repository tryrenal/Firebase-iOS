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
            toAuthScreen()
        }
        catch {
            print("error to logout")
        }
        
    }
    
    func toAuthScreen(){
        let vc = storyboard?.instantiateViewController(identifier: "AuthScene") as! ViewController
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
