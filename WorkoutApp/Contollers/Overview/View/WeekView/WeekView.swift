//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 01.11.2023.
//

import UIKit

final class WeekView: BaseView {
    private let stackView = UIStackView()
    private let calendar = Calendar.current
}

extension WeekView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        var weekdays = calendar.shortStandaloneWeekdaySymbols
        
        print("\(calendar.firstWeekday)")
        
        if calendar.firstWeekday == 2 {
            let sunday = weekdays.remove(at: 0)
            weekdays.append(sunday)
        }
        
        weekdays.enumerated().forEach { index, name in
            let view = WeekDayView()
            view.configure(with: index, and: name)
            stackView.addArrangedSubview(view)
        }
    }
}
