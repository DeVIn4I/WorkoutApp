//
//  StepsView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 21.11.2023.
//

import UIKit

final class StepsView: BaseInfoView {
    
    private let barsView = BarsView()
    
    func configure(with items: [BarView.Data]) {
        barsView.configure(with: items)
    }
}

extension StepsView {
    override func setupViews() {
        super.setupViews()
        
        setupView(barsView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
    }
}
