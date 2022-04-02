//
//  SplashScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit

class SplashScreen: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            screenPresenter(selfName: self, targetIdentifier: "userScreenIdentifier", presentation: .fullScreen, transition: .flipHorizontal, completion: {print("SplashScreen'e Geçildi")})
        }
    }
}
