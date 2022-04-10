//
//  PostDetailScreen.swift
//  UserCommentsApp
//
//  Created by Ali Can Tozlu on 2.04.2022.
//

import UIKit
import UserCommentsAPI

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
    @IBOutlet var readCommentsButton: UIButton!
    
    static var postId: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = PostDetailScreen.titleText?.capitalized
        bodyLabel.text = PostDetailScreen.bodyText?.capitalized
        
        readCommentsButton.cornerConfigure(cornerRadius: 10, maskedCorners: [ .layerMaxXMaxYCorner,.layerMinXMaxYCorner], borderColor: UIColor.white.cgColor, borderWidth: 1)
        
        ContextContainerView.cornerConfigure(cornerRadius: 10, maskedCorners: [.layerMinXMinYCorner,.layerMaxXMaxYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner], borderColor: UIColor.white.cgColor, borderWidth: 1)
        ContextContainerView.backgroundColor = UIColor.clear
        
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
        //SwiftHelper.helper.screenPresenter(self, "postCommentsScreenIdentifier", .fullScreen, .flipHorizontal, "UserCommentsScreen'e Geçildi")
        
        let VC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postCommentsScreenIdentifier") as! PostCommentsScreen
        VC.modalPresentationStyle = .fullScreen
        VC.modalTransitionStyle = .flipHorizontal
        
        let viewModel = PostCommentsScreenViewModel(service: UserDataService())
        VC.postCommentsScreenVM = viewModel
        
        self.present(VC, animated: true, completion: {print("UserCommentsScreen'e Geçildi")})
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
