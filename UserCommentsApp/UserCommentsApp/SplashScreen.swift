//
//  SplashScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import SwiftHelpers
import UserCommentsAPI

class SplashScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
           
            let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "userScreenIdentifier") as! UserScreen
            VC.modalPresentationStyle = .fullScreen
            VC.modalTransitionStyle = .flipHorizontal
            
            let viewModel = UserScreenViewModel(service: UserDataService())
            VC.userScreenVM = viewModel
            
            self.present(VC, animated: true, completion: {print("SplashScreen'e Geçildi")})
        
        }
    }
}
