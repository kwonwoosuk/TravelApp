//
//  DetailTableViewController.swift
//  TravelApp
//
//  Created by 권우석 on 1/5/25.
//

import UIKit
import Kingfisher

class TravelTableViewController: UITableViewController {
    var travel = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
        // 1. 스토리 보드 특정
        let sb = UIStoryboard(name: "Main", bundle: nil)
        // 2. 전환할 뷰 컨트롤러 가져오기
        let vc = sb.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        //3. 화면을 전환할 방법 선택하기 - push -// 스토리보드 show 우좌
        navigationController?.pushViewController(vc, animated: true)
        
        
        // MARK: - Pass Data vc가 갖고있는 프로퍼티에 데이터 추가
        vc.image = travel[indexPath.row].travel_image
        vc.contentLabel = travel[indexPath.row].title
        vc.contentdescription = travel[indexPath.row].description
        
        vc.navigationItem.title =  "관광지 화면"
        vc.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        vc.navigationController?.navigationBar.tintColor = .black
        
        let adVc = sb.instantiateViewController(identifier: "AdViewController") as! AdViewController
        
        
        
        
        
        
        
        
    }
       
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        travel[sender.tag].like?.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .none)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        travel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //  여기 메서드는 어떤 방식으로 줄여야할지... ^^ 셀럭터만 뺀다// 해냈다 해냈어^^^^^^
        let row = travel[indexPath.row]
        if row.ad { //== true!!
            let cell = tableView.dequeueReusableCell(withIdentifier: adViewTableViewCell.identifier, for: indexPath) as! adViewTableViewCell
            
            cell.configureDateAd(row: row)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell
            configureCell(cell: cell, with: row, at: indexPath)
            
            return cell
        }
    }
    
    
    private func configureCell(cell: TravelTableViewCell, with row: Travel, at indexPath: IndexPath) {
        if let like = row.like {
            let heart = like ? "heart.fill" : "heart"
            cell.likeButton.setImage(UIImage(systemName: heart), for: .normal)
            cell.likeButton.tag = indexPath.row
            cell.likeButton.tintColor = .red
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        }
        cell.configureData(row: row)
    }
       
        
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
