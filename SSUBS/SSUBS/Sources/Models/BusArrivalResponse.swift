//
//  BusArrivalResponse.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/15/24.
//

import Foundation

struct BusArrivalResponse: Codable {
    let result: BusArrivalResult
}

struct BusArrivalResult: Codable {
    let real: [BusArrival]
}

struct BusArrival: Codable {
    let routeId: String
    let updownFlag: String
    let localRouteId: String
    let stationSeq: String
    let routeNm: String
    var arrival1: ArrivalDetails?
    var arrival2: ArrivalDetails?
}

struct ArrivalDetails: Codable {
    var fulCarAt: String
    var busPlateNo: String
    var waitStatus: String
    var busStatus: String
    var endBusYn: String
    var leftStation: Int
    var lowBusYn: String
    var arrivalSec: Int
}
