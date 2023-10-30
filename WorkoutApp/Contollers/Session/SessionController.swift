//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 30.10.2023.
//

import UIKit

final class SessionController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.session

        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")
    }
    
    override func navBarLeftButtonHandler() {
        print("Session NavBar left button tapped")
    }
}
