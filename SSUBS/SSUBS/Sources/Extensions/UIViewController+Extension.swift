//
//  UIViewController+Extension.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/8/24.
//

import UIKit
import Alamofire

extension UIViewController {
    func testFetchData() {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        
        let stringTestURL = Constant.TestURL.rawValue + "&apiKey=" + apiKey
        
        guard let url = URL(string: stringTestURL) else { return }
        
        let request = URLRequest(url: url)
        
        let session = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(TestModel.self, from: data)
                print(decodedData.result)
            } catch let error {
                print("Decoding error: \(error.localizedDescription)")
            }
        }
        session.resume()
    }

    func getAlamoTest() {
        guard let API_KEY = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        let url = "https://api.odsay.com/v1/api/searchStation"
        let params: Parameters = [
            "apiKey": API_KEY,
            "lang": "0",
            "stationName": "부산",
            "displayCnt": "20",
            "stationClass": "1",
        ]
        AF.request(url, method: .get, parameters: params).responseDecodable(of: BusStationSearchResult.self) { response in
            switch response.result {
            case .success(let rootData):
                print(rootData.result.stations[0].stationName)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchBusStations(keyword: String, displayCount: Int = 20) {
        guard let API_KEY = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else { return }
        
        let url = "https://api.odsay.com/v1/api/searchStation"
        let params: Parameters = [
            "apiKey": API_KEY,
            "stationName": "\(keyword)",
            "displayCnt": "20",
            "stationClass": "1",
        ]

        AF.request(url, method: .get, parameters: params).responseDecodable(of: BusStationSearchResult.self) { response in
            switch response.result {
            case .success(let rootData):
                print(rootData.result.stations[0].stationName)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
