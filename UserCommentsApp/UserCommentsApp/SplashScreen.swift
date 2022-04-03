//
//  SplashScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import SwiftHelperFunctions

class SplashScreen: UIViewController {

    let helper = SwiftHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            self.helper.screenPresenter(selfName: self, targetIdentifier: "userScreenIdentifier", presentation: .fullScreen, transition: .flipHorizontal, completionText:("SplashScreen'e Geçildi"))
        }
    }
}
