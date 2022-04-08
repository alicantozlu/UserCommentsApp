//
//  ReusableCollectionViewCell.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 3.04.2022.
//

import UIKit
import UserCommentsAPI

class ReusableCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var upLabelStack: UIStackView!
    @IBOutlet var upLeftLabel: UILabel!
    @IBOutlet var upRightLabel: UILabel!
    
    @IBOutlet var downLabelStack: UIStackView!
    @IBOutlet var downLeftLabel: UILabel!
    @IBOutlet var downRightLabel: UILabel!

    var screen: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension ReusableCollectionViewCell{
    func configUsers(model: User){
        screenCustomization(model: model)
        upLeftLabel.text = model.name ?? "Name"
        upRightLabel.text = model.username ?? "Username"
        downLeftLabel.text = model.email ?? "Email"
        downRightLabel.text = model.phone ?? "Phone"
    }
    
    func configUserPosts(model: UserPost){
        screenCustomization(model: model)
        upLeftLabel.text = model.title ?? "Title"
    }
    
    func configUserComments(model: UserComment){
        screenCustomization(model: model)
        upLeftLabel.text = model.name ?? "Name"
        upRightLabel.text = model.email ?? "Email"
        downLeftLabel.text = model.body ?? "Body"
    }
    
    func screenCustomization<T: Decodable>(model: T){
        switch model {
        case is User:
            //Up Label Stack
            upLabelStack.isHidden = false
            
            //Up Left Label
            //upLeftLabel.text = "Name"
            upLeftLabel.isHidden = false
            upLeftLabel.textAlignment = .right
            
            //Up Right Label
            //upRightLabel.text = "UserName"
            upRightLabel.isHidden = false
            upRightLabel.textAlignment = .left
            
            //Down Label Stack
            downLabelStack.isHidden = false
            
            //Down Left Label
            //downLeftLabel.text = "email"
            downLeftLabel.isHidden = false
            downLeftLabel.textAlignment = .right
            
            //Down Right Label
            //downRightLabel.text = "phone"
            downRightLabel.isHidden = false
            downRightLabel.textAlignment = .left
            
        case is UserPost:
            //Up Label Stack
            upLabelStack.isHidden = false
            
            //Up Left Label
            //upLeftLabel.text = "Title"
            upLeftLabel.isHidden = false
            upLeftLabel.textAlignment = .center
            
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
            //Up Label Stack
            upLabelStack.isHidden = false
            
            //Up Left Label
            //upLeftLabel.text = "Name"
            upLeftLabel.isHidden = false
            upLeftLabel.textAlignment = .right
            
            //Up Right Label
            //upRightLabel.text = "email"
            upRightLabel.isHidden = false
            upRightLabel.textAlignment = .left
            
            //Down Label Stack
            downLabelStack.isHidden = false
            
            //Down Left Label
            //downLeftLabel.text = "body"
            downLeftLabel.isHidden = false
            downLeftLabel.textAlignment = .center
            
            //Down Right Label
            //downRightLabel.text = "None"
            downRightLabel.isHidden = true
            //downRightLabel.textAlignment = .center

        default:
            print("No Screen")
        }
    }
}
