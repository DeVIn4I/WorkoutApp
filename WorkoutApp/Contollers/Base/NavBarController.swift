//
//  NavBarController.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 30.10.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resources.Colors.titleGray,
            .font: Resources.Fonts.helveticalRegular(with: 17)
        ]
        navigationBar.addBottomBorder(with: Resources.Colors.separator, and: 1)
    }
}
