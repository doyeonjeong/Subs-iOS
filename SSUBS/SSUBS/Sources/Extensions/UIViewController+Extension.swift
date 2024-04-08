//
//  UIViewController+Extension.swift
//  SSUBS
//
//  Created by doyeonjeong on 4/8/24.
//

import UIKit

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
}
