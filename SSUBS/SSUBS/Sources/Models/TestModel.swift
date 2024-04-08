//
//  TestModel.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/8/24.
//

import Foundation

// MARK: - Root
struct TestModel: Codable {
    let result: TestResult
}

// MARK: - Result
struct TestResult: Codable {
    let type: Int
    let laneName, laneCity: String
    let ordList, satList, sunList: TestList
    let upWay, downWay: String
    let stationID: Int
    let stationName: String

    enum CodingKeys: String, CodingKey {
        case type, laneName, laneCity
        case ordList = "OrdList"
        case satList = "SatList"
        case sunList = "SunList"
        case upWay, downWay, stationID, stationName
    }
}

// MARK: - List
struct TestList: Codable {
    let up: TestUp
}

// MARK: - Up
struct TestUp: Codable {
    let time: [TestTime]
}

// MARK: - Time
struct TestTime: Codable {
    let idx: Int
    let list: String

    enum CodingKeys: String, CodingKey {
        case idx = "Idx"
        case list
    }
}
