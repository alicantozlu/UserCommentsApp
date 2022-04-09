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
    
    @IBOutlet var top_1BackgroundBlur: UIVisualEffectView!
    @IBOutlet var top_2BackgroundBlur: UIVisualEffectView!
    
    @IBOutlet var bottom_1BackgroundBlur: UIVisualEffectView!
    @IBOutlet var bottom_2BackgroundBlur: UIVisualEffectView!
    
    
    @IBOutlet var top_1ContainerStack: UIStackView!
    @IBOutlet var top_1LeftLabel: UILabel!
    @IBOutlet var top_1RightLabel: UILabel!
    
    @IBOutlet var top_2ContainerStack: UIStackView!
    @IBOutlet var top_2LeftLabel: UILabel!
    @IBOutlet var top_2RightLabel: UILabel!
    
    @IBOutlet var bottom_1ContainerStack: UIStackView!
    @IBOutlet var bottom_1LeftLabel: UILabel!
    @IBOutlet var bottom_1RightLabel: UILabel!
    
    @IBOutlet var bottom_2ContainerStack: UIStackView!
    @IBOutlet var bottom_2LeftLabel: UILabel!
    @IBOutlet var bottom_2RightLabel: UILabel!
    
    var screen: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.cornerConfigure(cornerRadius: 10, maskedCorners: [.layerMaxXMaxYCorner, .layerMinXMaxYCorner,.layerMaxXMinYCorner,.layerMinXMinYCorner], borderColor: UIColor.white.cgColor, borderWidth: 1)
    }
}

extension ReusableCollectionViewCell{
    func configUsers(model: User){
        screenCustomization(model: model)
        
        top_1LeftLabel.text = "Name: "
        top_1RightLabel.text = model.name ?? "Name"
        
        top_2LeftLabel.text = "Username: "
        top_2RightLabel.text = model.username ?? "Username"
        
        bottom_1LeftLabel.text = "Email: "
        bottom_1RightLabel.text = model.email ?? "Email"
        
        bottom_2LeftLabel.text = "Phone: "
        bottom_2RightLabel.text = model.phone ?? "Phone"
    }
    
    func configUserPosts(model: UserPost){
        screenCustomization(model: model)
        
        top_1LeftLabel.text = "Title: "
        top_1RightLabel.text = "\(model.title ?? "Title")".capitalizingFirstLetter()
    }
    
    func configUserComments(model: UserComment){
        screenCustomization(model: model)
        
        top_1LeftLabel.text = "Name: "
        top_1RightLabel.text = "\(model.name ?? "Name")".capitalizingFirstLetter()
        
        //top_2LeftLabel.text = "Email: "
        //top_2RightLabel.text = model.email ?? "Email"
        
        bottom_1LeftLabel.text = ""
        bottom_1RightLabel.text = "\(model.body ?? "Body")".capitalizingFirstLetter()
    }
    
    func screenCustomization<T: Decodable>(model: T){
        switch model {
        case is User:
            
            //Top_1 Container Stack
            top_1ContainerStack.isHidden = false
            
            //Top_1 Label
            top_1LeftLabel.isHidden = false
            top_1RightLabel.isHidden = false
            
            //Top_1 Blur
            top_1BackgroundBlur.isHidden = false
            
            //Top_2 Container Stack
            top_2ContainerStack.isHidden = false
            
            //Top_2 Label
            top_2LeftLabel.isHidden = false
            top_2RightLabel.isHidden = false
            
            //Top_2 Blur
            top_2BackgroundBlur.isHidden = false
            
            //Bottom_1 Container Stack
            bottom_1ContainerStack.isHidden = false
            
            //Bottom_1 Label
            bottom_1LeftLabel.isHidden = false
            bottom_1RightLabel.isHidden = false
            
            //Bottom_1 Blur
            bottom_1BackgroundBlur.isHidden = false
            
            //Bottom_2 Container Stack
            bottom_2ContainerStack.isHidden = false
            
            //Bottom_2 Label
            bottom_2LeftLabel.isHidden = false
            bottom_2RightLabel.isHidden = false
            
            //Bottom_2 Blur
            bottom_2BackgroundBlur.isHidden = false
            
        case is UserPost:
            
            //Top_1 Container Stack
            top_1ContainerStack.isHidden = false
            
            //Top_1 Label
            top_1LeftLabel.isHidden = false
            top_1RightLabel.isHidden = false
            
            //Top_1 Blur
            top_1BackgroundBlur.isHidden = false
            
            //Top_2 Container Stack
            top_2ContainerStack.isHidden = true
            
            //Top_2 Label
            top_2LeftLabel.isHidden = true
            top_2RightLabel.isHidden = true
            
            //Top_2 Blur
            top_2BackgroundBlur.isHidden = true
            
            //Bottom_1 Container Stack
            bottom_1ContainerStack.isHidden = true
            
            //Bottom_1 Label
            bottom_1LeftLabel.isHidden = true
            bottom_1RightLabel.isHidden = true
            
            //Bottom_1 Blur
            bottom_1BackgroundBlur.isHidden = true
            
            //Bottom_2 Container Stack
            bottom_2ContainerStack.isHidden = true
            
            //Bottom_2 Label
            bottom_2LeftLabel.isHidden = true
            bottom_2RightLabel.isHidden = true
            
            //Bottom_2 Blur
            bottom_2BackgroundBlur.isHidden = true
            
        case is UserComment:
                        
            //Top_1 Container Stack
            top_1ContainerStack.isHidden = false
            
            //Top_1 Label
            top_1LeftLabel.isHidden = true
            top_1RightLabel.isHidden = false
            top_1RightLabel.textAlignment = .center
            top_1RightLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            
            //Top_1 Blur
            top_1BackgroundBlur.isHidden = false
            
            //Top_2 Container Stack
            top_2ContainerStack.isHidden = true
            
            //Top_2 Label
            top_2LeftLabel.isHidden = true
            top_2RightLabel.isHidden = true
            
            //Top_2 Blur
            top_2BackgroundBlur.isHidden = true
            
            //Bottom_1 Container Stack
            bottom_1ContainerStack.isHidden = false
            
            //Bottom_1 Label
            bottom_1LeftLabel.isHidden = true
            bottom_1RightLabel.isHidden = false
            bottom_1RightLabel.textAlignment = .center
            
            //Bottom_1 Blur
            bottom_1BackgroundBlur.isHidden = false
            
            //Bottom_2 Container Stack
            bottom_2ContainerStack.isHidden = true
            
            //Bottom_2 Label
            bottom_2LeftLabel.isHidden = true
            bottom_2RightLabel.isHidden = true
            
            //Bottom_2 Blur
            bottom_2BackgroundBlur.isHidden = true
            
        default:
            print("No Screen")
        }
    }
}

