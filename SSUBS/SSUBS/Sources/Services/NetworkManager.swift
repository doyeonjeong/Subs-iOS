//
//  NetworkManager.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/15/24.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case API(String) // API 관련 에러, 연관 값으로 에러 메시지를 포함
}

class NetworkManager {
    
    static let shard = NetworkManager()
    private init() {}
    
    func fetchSubwayStations(keyword: String, displayCount: Int = 20) async throws -> SubwayStationSearchResponse {
        guard let API_KEY = Bundle.main.apiKey else { throw NetworkError.API("API 불러오기 실패") }
        
        let url = API.baseURL.rawValue + API.searchStation.rawValue
        let params: Parameters = [
            "apiKey": API_KEY,
            "stationName": "\(keyword)",
            "displayCnt": "\(displayCount)",
            "stationClass": "\(API.subwayStationClass.rawValue)",
        ]
        
        return try await AF.request(url, method: .get, parameters: params)
                    .serializingDecodable(SubwayStationSearchResponse.self)
                    .value
    }
    
    func fetchBusStations(keyword: String, displayCount: Int = 20, completion: @escaping (Result<BusStationSearchResult, Error>) -> Void) {
        guard let API_KEY = Bundle.main.apiKey else { return }
        
        let url = "https://api.odsay.com/v1/api/searchStation"
        let params: Parameters = [
            "apiKey": API_KEY,
            "stationName": "\(keyword)",
            "displayCnt": "\(displayCount)",
            "stationClass": "1",
        ]

        AF.request(url, method: .get, parameters: params).responseDecodable(of: BusStationSearchResult.self) { response in
            switch response.result {
            case .success(let rootData):
                print(rootData.result.stations[0].stationName)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchNearbyBusStations(currentLatitude: Double, currentLongitude: Double, completion: @escaping (Result<NearbyBusStationSearchResult, Error>) -> Void) {
        guard let API_KEY = Bundle.main.apiKey else { return }
        let url = API.baseURL.rawValue + API.pointSearch.rawValue
        let params: Parameters = [
            "apiKey": API_KEY,
            "x": "\(currentLatitude)",
            "y": "\(currentLongitude)",
            "stationClass": "\(API.busStationClass.rawValue)"
        ]
        
        AF.request(url, method: .get, parameters: params).responseDecodable(of: NearbyBusStationSearchResult.self) { response in
            switch response.result {
            case .success(let rootData):
                print(rootData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func fetchNearbySubwayStations(currentLatitude: Double, currentLongitude: Double, completion: @escaping (Result<NearbySubwayStationSearchResult, Error>) -> Void) {
        guard let API_KEY = Bundle.main.apiKey else { return }
        
        let url = API.baseURL.rawValue + API.pointSearch.rawValue
        let params: Parameters = [
            "apiKey": API_KEY,
            "x": "\(currentLatitude)",
            "y": "\(currentLongitude)",
            "stationClass": "\(API.subwayStationClass.rawValue)"
        ]

        AF.request(url, method: .get, parameters: params).responseDecodable(of: NearbySubwayStationSearchResult.self) { response in
            switch response.result {
            case .success(let rootData):
                print(rootData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
