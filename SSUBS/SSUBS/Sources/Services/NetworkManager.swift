//
//  NetworkManager.swift
//  SSUBS
//
//  Created by DOYEON JEONG on 4/13/24.
//

import Foundation
import Alamofire

class NetworkService {
    
    // 데이터를 GET 방식으로 요청하는 메서드
    func fetchData(url: URLConvertible, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // JSON 데이터를 POST 방식으로 전송하는 메서드
    func postData(url: URLConvertible, parameters: Parameters, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

