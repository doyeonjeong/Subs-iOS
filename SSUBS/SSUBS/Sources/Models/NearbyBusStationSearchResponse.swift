//
//  NearbyBusStationSearchResponse.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/13/24.
//

import Foundation

// MARK: - 반경내 대중교통 POI 검색(Public Transit POI within Radius) - 버스

// 반경내 버스 검색 결과 전체를 나타내는 최상위 구조
struct NearbyBusStationSearchResponse: Codable {
    let result: NearbyBusStationResult
}

// 반경내 버스 검색 결과 내의 세부 정보
struct NearbyBusStationResult: Codable {
    let count: Int
    let station: [NearbyBusStation]
}

// 반경내 버스 정류장 정보
struct NearbyBusStation: Codable {
    let stationName: String
    let stationID: Int
    let arsID, ebid: String
}
