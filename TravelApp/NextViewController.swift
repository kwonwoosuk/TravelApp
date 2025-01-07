//
//  NextViewController.swift
//  TravelApp
//
//  Created by 권우석 on 1/7/25.
//

import UIKit

class NextViewController: UIViewController {
/*
 title
 description
 travel_image
 push pop
 */
    
    @IBOutlet weak var travel_image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var popButton: UIButton!
    
    // MARK: - Pass Data 공간 만들어두기
    var contentLabel: String?
    var contentdescription: String?
    var image: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - 이미지뷰랑 레이블이랑 설명칸이랑 버튼 디자인 하기🔥
    func setupUI() {
        
        travel_image.layer.cornerRadius = 12
        travel_image.clipsToBounds = true
        travel_image.contentMode = .scaleAspectFill
        
        
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 1
        titleLabel.textAlignment = .center
        
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        popButton.titleLabel?.text = "다른 관광지 보러가기"
        popButton.backgroundColor = .systemBlue
        popButton.layer.cornerRadius = 8
        popButton.titleLabel?.textColor = .white
        popButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        if let image {
            let url = URL(string: image)
            travel_image.kf.setImage(with: url)
        }
        titleLabel.text = contentLabel
        descriptionLabel.text = contentdescription
        
    }
        
    
    @IBAction func popButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true) // - 오는건 TravelTableView에서 했으니 돌아가는길을 알아서 메서드만 한줄 써주면 된다!
        
    }
    
    

   

}
