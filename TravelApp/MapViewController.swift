import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var categorySegmentControl: UISegmentedControl!
    
    private let restaurantList = RestaurantList()
    private var showAnnotations: [MKPointAnnotation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMapView()
        allRestaurants()
        
    }
    
    private func configureMapView() {
        let center = CLLocationCoordinate2D(latitude: 37.65370, longitude: 127.04740)
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 210, longitudinalMeters: 210)
    }
    
    func allRestaurants() {
        filterRestaurants(category: "모두") // 처음실행시 모든카테고리 식당 보여주
    }
    
    @IBAction func categorySegmentChanged(_ sender: UISegmentedControl) {
        let selectCategory = sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "모두"
        filterRestaurants(category: selectCategory)
    }
    
    func filterRestaurants(category: String) {
        mapView.removeAnnotations(showAnnotations) // 제거 하고 보여줘야됩니다 이인간아...
        showAnnotations.removeAll()
        
        
        let filteredRestaurants = category == "모두" // 식당 필터링
            ? restaurantList.restaurantArray
            : restaurantList.restaurantArray.filter { $0.category == category } //{조건 참일때 만 필터링} 또차함수
        
        for restaurant in filteredRestaurants {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: restaurant.latitude,
                                                         longitude: restaurant.longitude)
            annotation.title = restaurant.name
            annotation.subtitle = "\(restaurant.category) · \(restaurant.price)원"
            
            showAnnotations.append(annotation) //지웠던 보여줄 어노테이션 배열에 추가ㅅ
        }
        
        mapView.addAnnotations(showAnnotations)
    }
    
    /*
     dataSource와 delegate의 차이...
     textView는 왜 delegate밖에 없냐 이거야
     DataSource가 가진기능에는 cellForRowAt, numerOfInSection과 같이 데이터를 받아와서! 어떤식으로 그림을 그릴건지를 정하도록 도와주는 역할을 하는데
     textView는 디자인을 위한 데이터를 받아와서 보여주는 친구가 아니기 때문에 애당초 필요가 없어 갖고있지 않은거라고...
     */
}
