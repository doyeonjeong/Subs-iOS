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
    var waitStatus: String
    var busStatus: String // 운행여부: (1:운행중, 2:차고지대기, 3:회차지대기, 이 외:운행종료)
    var endBusYn: String // 막차여부: Y:막차버스, N:일반버스
    var leftStation: Int // 첫번째 버스 남은 정류장 수
    var lowBusYn: String // 저상버스
    var arrivalSec: Int // 도착 예정 시간 (초)
}
