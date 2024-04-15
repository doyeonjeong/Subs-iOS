//
//  SubwayStationSearchResponse.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/13/24.
//

import Foundation

// MARK: - 대중교통 정류장 검색(Public Transit Stop) - 지하철

// 지하철 검색 결과 전체를 나타내는 최상위 구조
struct SubwayStationSearchResponse: Codable {
    let result: SubwayStationResult
}

// 지하철 검색 결과 내의 세부 정보
struct SubwayStationResult: Codable {
    let totalCount: Int
    let stations: [SubwayStation]
    
    enum CodingKeys: String, CodingKey {
        case totalCount
        case stations = "station"
    }
}

// 지하철 정류장 정보
struct SubwayStation: Codable {
    let stationName: String
    let stationID: Int
    let x, y: Double
    let cid: Int
    let cityName, stationDo, gu: String
    let dong: String
    let type: Int
    let laneName, laneCity: String
    let arsID, ebid: String?

    enum CodingKeys: String, CodingKey {
        case stationName, stationID, x, y
        case cid = "CID"
        case cityName, arsID
        case stationDo = "do"
        case gu, dong, type, laneName, laneCity, ebid
    }
}
