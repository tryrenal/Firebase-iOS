//
//  OtpPhoneViewController.swift
//  Firebase iOS
//
//  Created by Renaldy on 15/02/21.
//

import UIKit
import Firebase

class OtpPhoneViewController: UIViewController {

    @IBOutlet weak var tfOTP: UITextField!
    
    var verificationId: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        if verificationId != nil && !tfOTP.text!.isEmpty {
            let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationId!, verificationCode: tfOTP.text!)
            Auth.auth().signIn(with: credential, completion: {authData, error in
                if error == nil {
                    self.navigationToHome()
                } else {
                    self.alertErrorMessage(message: "error code otp")
                }
            })
        } else {
            self.alertErrorMessage(message: "code OTP masih kosong")
        }
    }
}
