//
//  ResponseManager.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/13/24.
//

import Foundation

class ResponseManager {
    private let networkService = NetworkService()

    /// 주어진 키워드를 기반으로 지하철 역을 검색합니다.
    /// - Parameters:
    ///   - keyword: 검색하고자 하는 지하철 역의 이름.
    ///   - completion: 검색 결과를 처리하는 클로저. 성공 시 `SubwayStationSearchResult` 타입의 결과를 반환하고, 실패 시 `Error`를 반환합니다.
    /// - Note: 검색 결과는 최대 20개의 지하철 역 정보를 반환합니다.
    func fetchSubwayStations(keyword: String, completion: @escaping (Result<SubwayStationSearchResult, Error>) -> Void) {
        let baseUrl = "https://api.odsay.com/v1/api/searchStation?lang=0&stationName=\(keyword)&stationClass=2&displayCnt=20"
        
        networkService.fetchData(url: baseUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let searchResult = try JSONDecoder().decode(SubwayStationSearchResult.self, from: data)
                    completion(.success(searchResult))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 주어진 키워드를 기반으로 버스 정류장을 검색합니다.
    /// - Parameters:
    ///   - keyword: 검색하고자 하는 버스 정류장의 이름.
    ///   - completion: 검색 결과를 처리하는 클로저. 성공 시 `BusStationSearchResult` 타입의 결과를 반환하고, 실패 시 `Error`를 반환합니다.
    /// - Note: 검색 결과는 최대 20개의 버스 정류장 정보를 반환합니다.
    func fetchBusStations(keyword: String, completion: @escaping (Result<BusStationSearchResult, Error>) -> Void) {
        let baseUrl = "https://api.odsay.com/v1/api/searchStation?lang=0&stationName=\(keyword)&stationClass=1&displayCnt=20"
        
        networkService.fetchData(url: baseUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let searchResult = try JSONDecoder().decode(BusStationSearchResult.self, from: data)
                    completion(.success(searchResult))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 주어진 위도와 경도를 기반으로 반경 내의 버스 정류장 정보를 검색합니다.
    /// - Parameters:
    ///   - currentLatitude: 현재 사용자의 위도.
    ///   - currentLongitude: 현재 사용자의 경도.
    ///   - completion: 검색 결과를 처리하는 클로저. 성공 시 `NearbyBusStationSearchResult` 타입의 결과를 반환하고, 실패 시 `Error`를 반환합니다.
    func fetchNearbyBusStations(currentLatitude: Double, currentLongitude: Double, completion: @escaping (Result<NearbyBusStationSearchResult, Error>) -> Void) {
        let baseUrl = "https://api.odsay.com/v1/api/pointSearch?x=\(currentLatitude)&y=\(currentLongitude)&stationClass=1"
        
        networkService.fetchData(url: baseUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let searchResult = try JSONDecoder().decode(NearbyBusStationSearchResult.self, from: data)
                    completion(.success(searchResult))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    /// 주어진 위도와 경도를 기반으로 반경 내의 지하철 정류장 정보를 검색합니다.
    /// - Parameters:
    ///   - currentLatitude: 현재 사용자의 위도.
    ///   - currentLongitude: 현재 사용자의 경도.
    ///   - completion: 검색 결과를 처리하는 클로저. 성공 시 `NearbySubwayStationSearchResult` 타입의 결과를 반환하고, 실패 시 `Error`를 반환합니다.
    func fetchNearbySubwayStations(currentLatitude: Double, currentLongitude: Double, completion: @escaping (Result<NearbySubwayStationSearchResult, Error>) -> Void) {
        let baseUrl = "https://api.odsay.com/v1/api/pointSearch?x=\(currentLatitude)&y=\(currentLongitude)&stationClass=2"
        
        networkService.fetchData(url: baseUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let searchResult = try JSONDecoder().decode(NearbySubwayStationSearchResult.self, from: data)
                    completion(.success(searchResult))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
