//
//  LocationManager.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/11/24.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    /// [싱글톤] 공유 인스턴스, 앱 전체에서 하나의 LocationManager를 사용하기 위함
    static let shared = LocationManager()
    
    private var locationManager: CLLocationManager?
    
    private var currentLatitude: CLLocationDegrees? {
        didSet {
            currentLatitude = startUpdatingCurrentLocation().0
        }
    }
    private var currentLongitude: CLLocationDegrees? {
        didSet {
            currentLongitude = startUpdatingCurrentLocation().1
        }
    }
    
    private override init() {
        super.init()
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.desiredAccuracy = kCLLocationAccuracyBest // 정확도를 최고로 설정
        self.locationManager?.requestWhenInUseAuthorization() // 앱 사용 중 위치 정보 사용 요청
    }
    
    /// 사용자의 현재 위치 업데이트 시작
    func startUpdatingCurrentLocation() -> (CLLocationDegrees, CLLocationDegrees) {
        locationManager?.startUpdatingLocation()
        guard
            let currentLatitude,
            let currentLongitude
        else { return (0, 0) }
        
        return (currentLatitude, currentLongitude)
    }
    
    /// 위치가 업데이트될 때마다 호출되는 메서드
    /// - Parameters:
    ///   - manager: 위치 관리자 인스턴스
    ///   - locations: 업데이트된 위치 정보 배열. 가장 최근 위치는 배열의 마지막 요소
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.last {
            let latitude = currentLocation.coordinate.latitude
            let longitude = currentLocation.coordinate.longitude
            //print("Current Latitude: \(latitude), Current Longitude: \(longitude)")
        }
    }
}
