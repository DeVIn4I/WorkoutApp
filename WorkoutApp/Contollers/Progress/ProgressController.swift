//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 30.10.2023.
//

import UIKit

final class ProgressController: BaseController {
    
    private let dailyPerformanceView = DailyPerformanceView(
        with: Resources.Strings.Progress.dailyPerformance,
        buttonTitle: Resources.Strings.Progress.lastSevenDay
    )
    
    private let monthlyPerformanceView = MonthlyPerformanceView(
        with: Resources.Strings.Progress.monthlyPerformance,
        buttonTitle: Resources.Strings.Progress.lastTenMonths
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ProgressController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(dailyPerformanceView)
        view.setupView(monthlyPerformanceView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68)
        ])
        
        NSLayoutConstraint.activate([
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 16),
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 1.06)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = Resources.Strings.NavBar.progress
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .progress)
        
        addNavBarButton(at: .left, with: Resources.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: Resources.Strings.Progress.navBarRight)
        
        dailyPerformanceView.configure(
            with: [
                .init(value: "1k", title: "Mon", heightParam: 0.2),
                .init(value: "2k", title: "Tue", heightParam: 0.4),
                .init(value: "3k", title: "Wed", heightParam: 0.6),
                .init(value: "4k", title: "Thu", heightParam: 0.8),
                .init(value: "5k", title: "Fri", heightParam: 1),
                .init(value: "3k", title: "Sat", heightParam: 0.7),
                .init(value: "2k", title: "Sun", heightParam: 0.3)
            ]
        )
        
        monthlyPerformanceView.configure(
            with: [
                .init(title: "Mar", value: 45),
                .init(title: "Apr", value: 55),
                .init(title: "May", value: 60),
                .init(title: "Jun", value: 65),
                .init(title: "Jul", value: 70),
                .init(title: "Aug", value: 80),
                .init(title: "Sep", value: 65),
                .init(title: "Okt", value: 45),
                .init(title: "Nov", value: 30),
                .init(title: "Dec", value: 15)
            ]
        )
    }
}
