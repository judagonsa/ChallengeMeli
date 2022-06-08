//
//  dataGlobal.swift
//  ChallengeLibre
//
//  Created by Julian González on 4/06/22.
//

import Foundation
import UIKit

/// Show alert default for interaction user in the whole app
/// - Parameters:
///   - title: Title alert
///   - message: Message alert
///   - view: view  where show alert
func showDefaultAlert(title: String, message: String, view: UIViewController) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    view.present(alert, animated: true)
    
}
