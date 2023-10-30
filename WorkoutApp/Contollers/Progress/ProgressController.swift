//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 30.10.2023.
//

import UIKit

final class ProgressController: BaseController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Workout progress"
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.progress
        
        addNavBarButton(at: .left, with: "Export")
        addNavBarButton(at: .right, with: "Details")
    }
}

