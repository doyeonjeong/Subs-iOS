//
//  Bundle+Extension.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/15/24.
//

import Foundation

extension Bundle {
    var apiKey: String? {
        return infoDictionary?["API_KEY"] as? String
    }
}
