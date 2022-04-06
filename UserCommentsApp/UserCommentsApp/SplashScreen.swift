//
//  SplashScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import SwiftHelpers

class SplashScreen: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            SwiftHelper.helper.screenPresenter(self, "userScreenIdentifier", .fullScreen, .flipHorizontal, ("SplashScreen'e Geçildi"))
        }
    }
}
