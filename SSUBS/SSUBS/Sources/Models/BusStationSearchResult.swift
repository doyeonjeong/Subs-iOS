//
//  BusStationSearchResult.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/13/24.
//

import Foundation

// MARK: - 대중교통 정류장 검색(Public Transit Stop) - 버스

// 버스 검색 결과 전체를 나타내는 최상위 구조
//struct BusStationSearchResult: Codable {
//    let result: BusSearchResult
//}
//
//// 버스 검색 결과 내의 세부 정보
//struct BusSearchResult: Codable {
//    let totalCount: Int
//    let stations: [BusStation]
//    
//    enum CodingKeys: String, CodingKey {
//        case totalCount
//        case stations = "station"
//    }
//}
//
//// 버스 정류장 정보
//struct BusStation: Codable {
//    let stationName: String
//    let stationID: Int
//    let x, y: Double
//    let cid: Int // 도시코드
//    let cityName, stationDo, gu, dong: String
//    let busInfo: [BusInfo]
//    let localStationID, ebid, stationDirectionName, arsID: String? // ebid, arsID: 버스 정류장 고유번호(5자리) 01-234
//    
//    enum CodingKeys: String, CodingKey {
//        case stationName, stationID, x, y
//        case cid = "CID"
//        case cityName, arsID
//        case stationDo = "do"
//        case gu, dong
//        case busInfo = "businfo"
//        case localStationID, ebid, stationDirectionName
//    }
//}

// 버스 정보
//struct BusInfo: Codable {
//    let busClass: String // 버스 타입 - 1: 일반, 2: 우등 ...
//    let busLocalBlID: String // 각 지역 버스노선 ID - ex) "223000130"
//    let busNo: String // 버스번호
//}

struct BusStationSearchResult: Codable {
    let result: BusSearchResult
}

// 버스 검색 결과 내의 세부 정보
struct BusSearchResult: Codable {
    let totalCount: Int
    let stations: [BusStation]
    
    enum CodingKeys: String, CodingKey {
        case totalCount
        case stations = "station"
    }
}

// 버스 정류장 정보
struct BusStation: Codable {
    let stationName: String
}
