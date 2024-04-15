//
//  NearbySubwayStationSearchResponse.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/13/24.
//

import Foundation

// MARK: - 반경내 대중교통 POI 검색(Public Transit POI within Radius) - 지하철

// 반경내 지하철 검색 결과 전체를 나타내는 최상위 구조
struct NearbySubwayStationSearchResponse: Codable {
    let result: NearbySubwayStationResult
}

// 반경내 지하철 검색 결과 내의 세부 정보
struct NearbySubwayStationResult: Codable {
    let count: Int
    let station: [NearbySubwayStation]
}

// 반경내 지하철 정류장 정보
struct NearbySubwayStation: Codable {
    let stationName: String
    let stationID: Int
    let arsID: String
    let type: Int
    let laneName, laneCity, ebid: String
}
