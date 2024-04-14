//
//  Constant.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/8/24.
//

import Foundation

enum Constant: String {
    case TestURL = "https://api.odsay.com/v1/api/subwayTimeTable/?lang=0&stationID=100&wayCode=1&showExpressTime=1&sepExpressTime=1"
}

enum API: String {
    case baseURL = "https://api.odsay.com/v1/api/"
    case searchStation = "searchStation?lang=0"
    case pointSearch = "pointSearch?lang=0"
    case busStationClass = "1"
    case subwayStationClass = "2"
    case key = "&apiKey="
}
