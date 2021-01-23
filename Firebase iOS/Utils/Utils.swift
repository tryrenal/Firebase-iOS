//
//  Utils.swift
//  Firebase iOS
//
//  Created by Renaldy on 24/01/21.
//

import UIKit

extension Utils {
    func alertErrorMessage(message: String){
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
