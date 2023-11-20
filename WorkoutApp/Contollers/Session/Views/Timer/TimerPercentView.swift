//
//  TimerPercentView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 20.11.2023.
//

import UIKit

extension TimerView {
    final class TimerPercentView: BaseView {
        private let percentLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helveticalRegular(with: 23)
            label.textColor = Resources.Colors.titleGray
            label.textAlignment = .center
            return label
        }()
        private let subTitleLabel: UILabel = {
            let label = UILabel()
            label.font = Resources.Fonts.helveticalRegular(with: 10)
            label.textColor = Resources.Colors.inActive
            label.textAlignment = .center
            return label
        }()
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
    }
}

extension TimerView.TimerPercentView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
        [percentLabel, subTitleLabel].forEach { stackView.addArrangedSubview($0) }
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configure(with title: String, and value: Int) {
        subTitleLabel.text = title
        percentLabel.text = "\(value)%"
    }
}
