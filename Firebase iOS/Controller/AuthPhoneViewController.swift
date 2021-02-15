//
//  AuthPhoneViewController.swift
//  Firebase iOS
//
//  Created by Renaldy on 15/02/21.
//

import UIKit
import Firebase

class AuthPhoneViewController: UIViewController {
    @IBOutlet weak var tfPhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnSubmit(_ sender: UIButton) {
        if !tfPhoneNumber.text!.isEmpty {
            PhoneAuthProvider.provider().verifyPhoneNumber(tfPhoneNumber.text!, uiDelegate: nil, completion: { verifId , error in
                if error == nil {
                    self.navigationToOTP(with: verifId)
                } else {
                    self.alertErrorMessage(message: "error to get verif ID")
                }
            })
        } else {
            self.alertErrorMessage(message: "nomor telepon masih kosong")
        }
    }
    
    func navigationToOTP(with verifId: String?){
        let vc = storyboard?.instantiateViewController(identifier: "OtpPhoneScene") as! OtpPhoneViewController
        vc.verificationId = verifId
        self.present(vc, animated: true, completion: nil)
    }
}
