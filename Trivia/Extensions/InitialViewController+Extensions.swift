//
//  InitialViewController+Extensions.swift
//  Trivia
//
//  Created by Mariano Battaglia on 11/06/2022.
//

import UIKit

extension InitialViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
