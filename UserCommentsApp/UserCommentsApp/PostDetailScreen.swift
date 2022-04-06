//
//  PostDetailScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import SwiftHelpers

class PostDetailScreen: UIViewController {

    @IBOutlet var ContainerView: UIView!
    @IBOutlet var screenViewContainer: UIView!
    @IBOutlet var TopSpaceView: UIView!
    @IBOutlet var CenterContainerView: UIView!
    @IBOutlet var LeftSpaceView: UIView!
    @IBOutlet var ContextContainerView: UIView!
    @IBOutlet var RightSpaceView: UIView!
    @IBOutlet var BottomSpaceView: UIView!
     
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    
    static var titleText: String?
    static var bodyText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = PostDetailScreen.titleText
        bodyLabel.text = PostDetailScreen.bodyText
        
        CenterContainerView.roundCorners(corners: <#T##UIRectCorner#>, radius: <#T##CGFloat#>)
        
        screenConfig()
    }
    
    func screenConfig(){
        //ContainerView.backgroundColor = .clear
        screenViewContainer.backgroundColor = .clear
        TopSpaceView.backgroundColor = .clear
        CenterContainerView.backgroundColor = .clear
        LeftSpaceView.backgroundColor = .clear
        RightSpaceView.backgroundColor = .clear
        BottomSpaceView.backgroundColor = .clear
    }
    
    @IBAction func readCommentsButtonAction(_ sender: Any) {
        SwiftHelper.helper.screenPresenter(self, "postCommentsScreenIdentifier", .fullScreen, .flipHorizontal, "UserCommentsScreen'e Geçildi")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)

        let touch = touches.first
        guard var location = touch?.location(in: self.view) else { return }
        
        location.y = location.y - TopSpaceView.frame.height*5/4
        
        if !ContextContainerView.frame.contains(location) {
            self.dismiss(animated: true, completion: nil)
        } else {
            print("Tapped inside the view")
        }
    }
}
