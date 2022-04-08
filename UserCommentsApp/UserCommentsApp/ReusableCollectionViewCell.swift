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
    
    @IBOutlet var upLeftLeadingLabel: UILabel!
    @IBOutlet var upRightLeadingLabel: UILabel!
    
    
    
    @IBOutlet var downLabelStack: UIStackView!
    @IBOutlet var downLeftLabel: UILabel!
    @IBOutlet var downRightLabel: UILabel!
    
    @IBOutlet var downRightLabelsStack: UIStackView!
    @IBOutlet var downLeftLeadingLabel: UILabel!
    @IBOutlet var downRightLeadingLabel: UILabel!
    
    
    var screen: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.cornerConfigure(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMinYCorner], borderColor: UIColor.white.cgColor, borderWidth: 1)
    }
}

extension ReusableCollectionViewCell{
    func configUsers(model: User){
        screenCustomization(model: model)
        upLeftLabel.text = /*"Name: \(*/model.name ?? "Name"/*)"*/
        upRightLabel.text = /*"Username: \(*/model.username ?? "Username"/*)"*/
        downLeftLabel.text = /*"Email: \(*/model.email ?? "Email"/*)"*/
        downRightLabel.text = /*"Phone: \(*/model.phone ?? "Phone"/*)"*/
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
            upLeftLabel.isHidden = false
            upLeftLeadingLabel.isHidden = false
            upLeftLeadingLabel.text = "Name: "
            
            //Up Right Label
            upRightLabel.isHidden = false
            upRightLeadingLabel.isHidden = false
            upRightLeadingLabel.text = "Username: "
            
            //Down Label Stack
            downLabelStack.isHidden = false
            
            //Down Left Label
            downLeftLabel.isHidden = false
            downLeftLeadingLabel.isHidden = false
            downLeftLeadingLabel.text = "Email: "
            
            //Down Right Label
            downRightLabel.isHidden = false
            downRightLeadingLabel.isHidden = false
            downLeftLeadingLabel.text = "Phone: "
            
        case is UserPost:
            
            bottomBackgroundBlur.isHidden = true
            
            //Up Label Stack
            upLabelStack.isHidden = false
            
            //Up Left Label
            upLeftLabel.isHidden = false
            upLeftLeadingLabel.isHidden = false
            upLeftLeadingLabel.text = "Title: "
            
            //Up Right Label
            upRightLabel.isHidden = true
            upRightLeadingLabel.isHidden = true
            
            //Down Label Stack
            downLabelStack.isHidden = true

        case is UserComment:
            
            bottomBackgroundBlur.isHidden = false
            
            //Up Label Stack
            upLabelStack.isHidden = false
            
            //Up Left Label
            upLeftLabel.isHidden = false
            upLeftLeadingLabel.isHidden = true
            //upLeftLeadingLabel.text = "Comment: "
            
            //Up Right Label
            upRightLabel.isHidden = true
            upRightLeadingLabel.isHidden = true
            upRightLeadingLabel.text = "Email: "
            
            //Down Label Stack
            downLabelStack.isHidden = false
            
            downRightLabelsStack.isHidden = true
            
            //Down Left Label
            downLeftLabel.isHidden = false
            downLeftLeadingLabel.isHidden = true
            
            //Down Right Label
            downRightLabel.isHidden = true
            downRightLeadingLabel.isHidden = true

        default:
            print("No Screen")
        }
    }
}
