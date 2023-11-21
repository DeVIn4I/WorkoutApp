//
//  ChartsView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 21.11.2023.
//

import UIKit

final class ChartsView: BaseView {
    
    private let yAxisView = YaxisView()
    private let xAxisView = XaxisView()
    private let chartView = ChartView()
    
    func configure(with data: [ChartsView.Data]) {
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
        
        chartView.configure(with: data)
    }
}

extension ChartsView {
    override func setupViews() {
        super.setupViews()
        
        setupView(yAxisView)
        setupView(xAxisView)
        setupView(chartView)
    }
    
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 16),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4)
        ])
        
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 18),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -18),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6)
        ])
        
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        backgroundColor = .clear
    }
}

extension ChartsView {
    struct Data {
        let title: String
        let value: Int
    }
}
