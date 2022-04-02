//
//  Present.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import Foundation
import UIKit

/// Create custom presenter with completion handler
func screenPresenter(selfName: UIViewController,targetIdentifier:String,presentation: UIModalPresentationStyle,transition:UIModalTransitionStyle, completion:(() -> Void)) {
    
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: targetIdentifier)
    VC.modalPresentationStyle = presentation
    VC.modalTransitionStyle = transition
    selfName.present(VC, animated: true, completion: nil)
    completion()
}

