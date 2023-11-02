//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 30.10.2023.
//

import UIKit

final class SessionController: BaseController {
    
    private let timerView: TimerView = {
        let view = TimerView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension SessionController {
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
    }
    
    override func constraintViews() {
        super.constraintViews()
    
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = Resources.Strings.NavBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .session)

        addNavBarButton(at: .left, with: Resources.Strings.Session.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.Session.navBarRight)
    }
}
