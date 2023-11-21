//
//  MonthlyPerformanceView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 21.11.2023.
//

import UIKit

final class MonthlyPerformanceView: BaseInfoView {
    
    private let chartsView = ChartsView()
    
    func configure(with items: [ChartsView.Data]) {
        chartsView.configure(with: items)
    }
}

extension MonthlyPerformanceView {
    override func setupViews() {
        super.setupViews()
        
        setupView(chartsView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            chartsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            chartsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            chartsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            chartsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
