//
//  CityViewTableViewController.swift
//  TravelApp
//
//  Created by 권우석 on 1/7/25.
//

import UIKit

class CityViewTableViewController: UITableViewController {
    
    var city = CityInfo().city
    
    @IBOutlet weak var domesticSeg: UISegmentedControl!
    @IBOutlet weak var searchTextField: UITextField!
    var Cities: [City] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: CityViewTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CityViewTableViewCell.identifier)
        
        domesticSeg.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentChanged(domesticSeg)
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            Cities = city
        case 1:
            Cities = city.filter { $0.domestic_travel } //국내 true
            // filter - {}안에 들어가는 값이 참을 만족하면 필터링하여 새로운 배열‼️리턴 그래서 배열로 선언...
        case 2:
            Cities = city.filter { $0.domestic_travel == false }
        default:
            break
        }
        // 데이터 바꾸면 리로두
        tableView.reloadData()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Cities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CityViewTableViewCell.identifier) as! CityViewTableViewCell
        
        let row = Cities[indexPath.row]
        cell.configureData(row: row)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    // 텍스트필드에 글씨가 입력될때마다 city구조체중 해당되는 키워드가 하나라도 있다면 보여주기
    // 국내 세그에서 찾는경우 텍스트필드 입력에서도 국내만, 해외세그는 해외만 ^^
    
    
    @IBAction func returnKeyTapped(_ sender: UITextField) {
        searchContaintextFilter()
    }
    @IBAction func searchTextFieldTapped(_ sender: UITextField) {
        searchContaintextFilter()
    }
    
    
    func searchContaintextFilter() {
        //데이터가 항상 기준... 데이터를 세그먼트 컨트롤 처럼 다시 담아
        
        // 대소문자 구분없이 검색
        // 공백제거
        //🔥🔥🔥🔥 해당하는 글자 텍스트 컬러 일부 변경...??????? 🔥🔥🔥🔥
        guard let text = searchTextField.text?.trimmingCharacters(in: .whitespaces), ((searchTextField.text?.lowercased()) != nil)  else { searchTextField.placeholder = "다시 입력하세요"
            return }
        
        if text.isEmpty {
            segmentChanged(domesticSeg)
        } else { // city_name, city_english_name, city_explain 에서 하나라도 키워드 or연산
            switch domesticSeg.selectedSegmentIndex {
            case 0:
                Cities = city.filter {
                    $0.city_name.contains(text) ||
                    $0.city_english_name.contains(text) ||
                    $0.city_explain.contains(text)
                }
            case 1:
                Cities = city.filter{
                    $0.domestic_travel &&
                    ($0.city_name.contains(text) ||
                     $0.city_english_name.contains(text) ||
                     $0.city_explain.contains(text)) //  논리 연산자의 우선순위때문에 ()먼저 묶음
                }
            case 2:
                Cities = city.filter {
                    $0.domestic_travel == false &&
                    ($0.city_name.lowercased().contains(text) ||
                     $0.city_english_name.lowercased().contains(text) ||
                     $0.city_explain.lowercased().contains(text))
                    
                }
            default:
                break
            }
        } //else
        tableView.reloadData()
    }
}
