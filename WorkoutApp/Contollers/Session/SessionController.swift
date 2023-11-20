//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 30.10.2023.
//

import UIKit

final class SessionController: BaseController {
    
    private let timerView = TimerView()
    private let statsView = StatsView(with: Resources.Strings.Session.workoutStats.uppercased())
    private let stepsView = BaseInfoView(with: Resources.Strings.Session.stepsCounter.uppercased())
    
    private let timerDuration = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func navBarLeftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
        setTitleForBarButton(
            at: .left,
            with: timerView.state == .isRunning ? Resources.Strings.Session.navBarPause : Resources.Strings.Session.navBarStart
        )
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        setTitleForBarButton(at: .left, with: Resources.Strings.Session.navBarStart)
    }
}

extension SessionController {
    
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
        view.setupView(statsView)
        view.setupView(stepsView)
    }
    
    override func constraintViews() {
        super.constraintViews()
    
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 12),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -8),
            statsView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 8),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = Resources.Strings.NavBar.session
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .session)

        addNavBarButton(at: .left, with: Resources.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: Resources.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
        timerView.callBack = {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.navBarRightButtonHandler()
            }
        }
    }
}
