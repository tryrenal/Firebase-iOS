//
//  DetailViewController.swift
//  Firebase iOS
//
//  Created by Renaldy on 18/01/21.
//

import UIKit
import Firebase

class DetailViewController: UIViewController {

    @IBOutlet weak var btnLogout: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        btnLogout.addTarget(self, action: #selector(logout), for: .touchUpInside)
       
    }

    @objc private func logout(){
        do {
            try Auth.auth().signOut()
        } catch let error {
            print(error.localizedDescription)
        }
    }

}
