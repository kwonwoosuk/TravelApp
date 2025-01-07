//
//  CityViewController.swift
//  TravelApp
//
//  Created by 권우석 on 1/7/25.
//

import UIKit

class CityCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var city = CityInfo().city
    
    //, UICollectionViewDelegate, UICollectionViewDataSource
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var domesticSeg: UISegmentedControl!
    @IBOutlet weak var searchTextField: UITextField!
    var Cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let xib = UINib(nibName: CityCollectionViewCell.identifier, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        
        collectionView.collectionViewLayout = layout
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 200)
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        
        layout.sectionInset = UIEdgeInsets(top: 100, left: 50, bottom: 100, right: 50)
        
        domesticSeg.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentChanged(domesticSeg)
    }
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            Cities = city
        case 1:
            Cities = city.filter { $0.domestic_travel }
        case 2:
            Cities = city.filter { $0.domestic_travel == false }
        default:
            break
        }
        collectionView.reloadData()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as! CityCollectionViewCell
            
        let row = Cities[indexPath.row]
        cell.configureData(row: row)
        return cell
    }
    
    @IBAction func returnKeyTapped(_ sender: UITextField) {
        searchContaintextFilter()
    }
    @IBAction func searchingSomething(_ sender: UITextField) {
        searchContaintextFilter()
    }
    
    
    func searchContaintextFilter() {
        guard let text = searchTextField.text?.trimmingCharacters(in: .whitespaces), ((searchTextField.text?.lowercased()) != nil)  else { searchTextField.placeholder = "다시 입력하세요"
            return }
        
        if text.isEmpty {
            segmentChanged(domesticSeg)
        } else { // city_name, city_english_name, city_explain 에서 하나라도 키워드 or연산
            switch domesticSeg.selectedSegmentIndex {
            case 0:
                Cities = city.filter {
                    $0.city_name.lowercased().contains(text) ||
                    $0.city_english_name.lowercased().contains(text) ||
                    $0.city_explain.lowercased().contains(text)
                }
            case 1:
                Cities = city.filter{
                    $0.domestic_travel &&
                    ($0.city_name.lowercased().contains(text) ||
                     $0.city_english_name.lowercased().contains(text) ||
                     $0.city_explain.lowercased().contains(text)) //  논리 연산자의 우선순위때문에 ()먼저 묶음
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
        collectionView.reloadData()
    }
}



