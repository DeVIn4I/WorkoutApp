//
//  OverviewNavBar.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 30.10.2023.
//

import UIKit

final class OverviewNavBar: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Strings.NavBar.overview
        label.textColor = Resources.Colors.titleGray
        label.font = Resources.Fonts.helveticalRegular(with: 22)
        return label
    }()
    
    private let allWorkoutsButton = WAButton(with: .secondary)

    private let addButton = UIButton()
    
    private let weekView = WeekView()
    
    func addAllWorkoutsAction(_ selector: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    func addAdditingAction(_ selector: Selector, with target: Any?) {
        addButton.addTarget(target, action: selector, for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: Resources.Colors.separator, and: 1)
    }
    
    
}

extension OverviewNavBar {
    override func setupViews() {
        super.setupViews()
        setupView(titleLabel)
        setupView(allWorkoutsButton)
        setupView(addButton)
        
        setupView(weekView)
    }
    
    override func constraintViews() {
        super.constraintViews()

        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -16),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutsButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            weekView.topAnchor.constraint(equalTo: allWorkoutsButton.bottomAnchor, constant: 16),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            weekView.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white

        allWorkoutsButton.setTitle(Resources.Strings.Overview.allWorkoutsButton) 
        addButton.setImage(Resources.Images.Common.addButton, for: .normal)
    }
}
