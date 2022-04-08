//
//  ReusableCollectionViewCell.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 3.04.2022.
//

import UIKit
import UserCommentsAPI
import SwiftHelpers

class ReusableCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var containerView: UIView!
    
    @IBOutlet var topBackgroundBlur: UIVisualEffectView!
    @IBOutlet var bottomBackgroundBlur: UIVisualEffectView!
    
    @IBOutlet var upLabelStack: UIStackView!
    @IBOutlet var upLeftLabel: UILabel!
    @IBOutlet var upRightLabel: UILabel!
    
    @IBOutlet var downLabelStack: UIStackView!
    @IBOutlet var downLeftLabel: UILabel!
    @IBOutlet var downRightLabel: UILabel!

    var screen: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.cornerConfigure(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMinYCorner], borderColor: UIColor.white.cgColor, borderWidth: 1)
    }
}

extension ReusableCollectionViewCell{
    func configUsers(model: User){
        screenCustomization(model: model)
        upLeftLabel.text = "Name: \(model.name ?? "Name")"
        upRightLabel.text = "Username: \(model.username ?? "Username")"
        downLeftLabel.text = "Email: \(model.email ?? "Email")"
        downRightLabel.text = "Phone: \(model.phone ?? "Phone")"
    }
    
    func configUserPosts(model: UserPost){
        screenCustomization(model: model)
        upLeftLabel.text = model.title ?? "Title"
    }
    
    func configUserComments(model: UserComment){
        screenCustomization(model: model)
        upLeftLabel.text = "Name: \(model.name ?? "Name")\n\nEmail: \(model.email ?? "Email")"
        downLeftLabel.text = model.body ?? "Body"
    }
    
    func screenCustomization<T: Decodable>(model: T){
        switch model {
        case is User:
            
            bottomBackgroundBlur.isHidden = false
            
            //Up Label Stack
            upLabelStack.isHidden = false
            
            //Up Left Label
            //upLeftLabel.text = "Name"
            upLeftLabel.isHidden = false
            //upLeftLabel.textAlignment = .right
            
            //Up Right Label
            //upRightLabel.text = "UserName"
            upRightLabel.isHidden = false
            //upRightLabel.textAlignment = .left
            
            //Down Label Stack
            downLabelStack.isHidden = false
            
            //Down Left Label
            //downLeftLabel.text = "email"
            downLeftLabel.isHidden = false
            //downLeftLabel.textAlignment = .right
            
            //Down Right Label
            //downRightLabel.text = "phone"
            downRightLabel.isHidden = false
            //downRightLabel.textAlignment = .left
            
        case is UserPost:
            
            bottomBackgroundBlur.isHidden = true
            
            //Up Label Stack
            upLabelStack.isHidden = false
            
            //Up Left Label
            //upLeftLabel.text = "Title"
            upLeftLabel.isHidden = false
            upLeftLabel.textAlignment = .left
            
            //Up Right Label
            //upRightLabel.text = "None"
            upRightLabel.isHidden = true
            //upRightLabel.textAlignment = .center
            
            //Down Label Stack
            downLabelStack.isHidden = true
            
            //Down Left Label
            //downLeftLabel.text = "None"
            //downLeftLabel.isHidden = true
            //downLeftLabel.textAlignment = .center

            //Down Right Label
            //downRightLabel.text = "None"
            //downRightLabel.isHidden = true
            //downRightLabel.textAlignment = .center

        case is UserComment:
            
            bottomBackgroundBlur.isHidden = false
            
            //Up Label Stack
            upLabelStack.isHidden = false
            
            //Up Left Label
            //upLeftLabel.text = "Name"
            upLeftLabel.isHidden = false
            //upLeftLabel.textAlignment = .right
            
            //Up Right Label
            //upRightLabel.text = "email"
            upRightLabel.isHidden = true
            //upRightLabel.textAlignment = .left
            
            //Down Label Stack
            downLabelStack.isHidden = false
            
            //Down Left Label
            //downLeftLabel.text = "body"
            downLeftLabel.isHidden = false
            //downLeftLabel.textAlignment = .center
            
            //Down Right Label
            //downRightLabel.text = "None"
            downRightLabel.isHidden = true
            //downRightLabel.textAlignment = .center

        default:
            print("No Screen")
        }
    }
}
