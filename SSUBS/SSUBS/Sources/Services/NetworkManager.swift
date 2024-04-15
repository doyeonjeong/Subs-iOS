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
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchBusStationRealTime(stationID: String) async throws -> BusArrivalResponse {
        guard let API_KEY = Bundle.main.apiKey else { throw NetworkError.API("API 불러오기 실패") }
        
        let url = API.baseURL.rawValue + API.realtimeStation.rawValue
        let params: Parameters = [
            "apiKey": API_KEY,
            "stationID": "\(stationID)"
        ]
        
        return try await AF.request(url, method: .get, parameters: params)
            .serializingDecodable(BusArrivalResponse.self)
            .value
    }
    
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
    
    func fetchBusStations(keyword: String, displayCount: Int = 20) async throws -> BusStationSearchResponse {
        guard let API_KEY = Bundle.main.apiKey else { throw NetworkError.API("API 불러오기 실패") }
        
        let url = API.baseURL.rawValue + API.searchStation.rawValue
        let params: Parameters = [
            "apiKey": API_KEY,
            "stationName": "\(keyword)",
            "displayCnt": "\(displayCount)",
            "stationClass": "\(API.busStationClass.rawValue)",
        ]
        
        return try await AF.request(url, method: .get, parameters: params)
            .serializingDecodable(BusStationSearchResponse.self)
            .value
    }
    
    func fetchNearbyBusStations(currentLatitude: Double, currentLongitude: Double) async throws -> NearbyBusStationSearchResponse {
        guard let API_KEY = Bundle.main.apiKey else { throw NetworkError.API("API 불러오기 실패") }
        
        let url = API.baseURL.rawValue + API.pointSearch.rawValue
        let params: Parameters = [
            "apiKey": API_KEY,
            "x": "\(currentLatitude)",
            "y": "\(currentLongitude)",
            "stationClass": "\(API.busStationClass.rawValue)"
        ]
        
        return try await AF.request(url, method: .get, parameters: params)
            .serializingDecodable(NearbyBusStationSearchResponse.self)
            .value
    }
    
    func fetchNearbySubwayStations(currentLatitude: Double, currentLongitude: Double) async throws -> NearbyBusStationSearchResponse {
        guard let API_KEY = Bundle.main.apiKey else { throw NetworkError.API("API 불러오기 실패") }
        
        let url = API.baseURL.rawValue + API.pointSearch.rawValue
        let params: Parameters = [
            "apiKey": API_KEY,
            "x": "\(currentLatitude)",
            "y": "\(currentLongitude)",
            "stationClass": "\(API.subwayStationClass.rawValue)"
        ]
        
        return try await AF.request(url, method: .get, parameters: params)
            .serializingDecodable(NearbyBusStationSearchResponse.self)
            .value
    }
}
