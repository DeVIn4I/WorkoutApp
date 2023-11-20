//
//  StatsView.swift
//  WorkoutApp
//
//  Created by Razumov Pavel on 20.11.2023.
//

import UIKit

final class StatsView: BaseInfoView {
    private let itemView = StatsItemView()
    
    override func setupViews() {
        super.setupViews()
        
        setupView(itemView)
        itemView.configure(
            with: StatsItemView.StatsItem(
                image: Resources.Images.Session.heartBeat,
                value: "155 bpm",
                title: Resources.Strings.Session.heartRate.uppercased()
            )
        )
        
        NSLayoutConstraint.activate([
            itemView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
