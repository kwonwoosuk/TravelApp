//
//  adViewTableViewCell.swift
//  TravelApp
//
//  Created by 권우석 on 1/6/25.
//

import UIKit

class adViewTableViewCell: UITableViewCell {

    static let identifier = "adViewTableViewCell"
    @IBOutlet weak var adLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure() {
        let randomColor = ["viewColor1", "viewColor2"]
        adLabel.isHidden = false
        adLabel.text = "AD"
        adLabel.backgroundColor = .lightGray
        adLabel.textColor = .black
        adLabel.layer.cornerRadius = 5
        adLabel.clipsToBounds = true
        adLabel.font = .systemFont(ofSize: 12)
        backView.backgroundColor = UIColor(named: randomColor.randomElement() ?? "viewColor1")
        backView.layer.cornerRadius = 15
        backView.clipsToBounds = true
    }
    
    func configureDateAd(row: Travel) {
        titleLabel.text = row.title
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.font = .boldSystemFont(ofSize: 15)
        titleLabel.textAlignment = .center
    }
}
