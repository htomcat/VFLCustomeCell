//
//  VFLCustomTableViewCell.swift
//  VFLCustomeCell
//
//  Created by htomcat on 2017/10/04.
//  Copyright © 2017年 htomcat. All rights reserved.
//

import UIKit

class VFLCustomTableViewCell: UITableViewCell {
    // MARK: - Properties
    private lazy var teamLabel: UILabel = self.createTeamLabel()
    private lazy var leagueLabel: UILabel = self.createLeagueLabel()
    private lazy var divisionLabel: UILabel = self.createDivisionLabel()
    private lazy var teamColorView: UIView = self.createTeamColorView()
    
    // MARK: - Override
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addConstraints()
    }
    
    // MARK: - Methods
    private func createTeamLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18.0)
        return label
    }
    
    private func createLeagueLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15.0)
        return label
    }
    
    private func createDivisionLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15.0)
        label.textColor = .gray
        return label
    }
    
    private func createTeamColorView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func addConstraints() {
        let views: [String: Any] = ["team": teamLabel,
                                    "league": leagueLabel,
                                    "division": divisionLabel,
                                    "color": teamColorView]
        
        // teamColorView's top constraint
        let colorTop = NSLayoutConstraint(item: teamColorView,
                                        attribute: .top,
                                        relatedBy: .equal,
                                        toItem: contentView,
                                        attribute: .top,
                                        multiplier: 1.0,
                                        constant: 1.0)
        contentView.addConstraint(colorTop)

        // teamColorView's bottom constraint
        let colorBottom = NSLayoutConstraint(item: teamColorView,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: contentView,
                                        attribute: .bottom,
                                        multiplier: 1.0,
                                        constant: 1.0)
        contentView.addConstraint(colorBottom)
        
        // leagueLabel's left constraint
        let leagueLeft = NSLayoutConstraint(item: leagueLabel,
                                            attribute: .left,
                                            relatedBy: .equal,
                                            toItem: teamColorView,
                                            attribute: .right,
                                            multiplier: 1.0,
                                            constant: 10.0)
        contentView.addConstraint(leagueLeft)
        
        // divisionLabel's left constraint
        let divisionLeft = NSLayoutConstraint(item: divisionLabel,
                                              attribute: .left,
                                              relatedBy: .equal,
                                              toItem: teamColorView,
                                              attribute: .right,
                                              multiplier: 1.0,
                                              constant: 10.0)
        contentView.addConstraint(divisionLeft)
        
        // Horizontal constraints
        let horizontal = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[color(10)]-10-[team]-|",
                                                        options: [],
                                                        metrics: nil,
                                                        views: views)
        contentView.addConstraints(horizontal)
        
        // Vertical constraints
        let vertical = NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[team]-10-[league]-10-[division]-|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: views)
        contentView.addConstraints(vertical)
        
    }
    
    func configure(with info: VFLModel) {
        teamLabel.text = info.team
        leagueLabel.text = info.league
        divisionLabel.text = info.division
        teamColorView.backgroundColor = UIColor(rgb: info.color)
        
        contentView.addSubview(teamLabel)
        contentView.addSubview(leagueLabel)
        contentView.addSubview(divisionLabel)
        contentView.addSubview(teamColorView)
        
        layoutIfNeeded()
    }
}
