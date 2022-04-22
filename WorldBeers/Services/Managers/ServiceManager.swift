//
//  ServiceManager.swift
//  WorldBeers
//
//  Created by Rajesh Konga on 19/04/22.
//

import Foundation

class ServiceManager {
    public static let shared = ServiceManager()
    
    func callService<T: Decodable>(urlString: String, method: HTTPMethod, onCompletion: @escaping (Result<T, HTTPError>) -> Void) {
        let url = URL(string: urlString)
        guard let urlObj = url else {
            onCompletion(.failure(.urlFailed))
            return
        }
        let session = URLSession.shared
        var request = URLRequest(url: urlObj)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest, completionHandler: { data, _, error in
            
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    onCompletion(.failure(.noData))
                    return
                }
                let decoder = JSONDecoder()
                if let json = try? decoder.decode(T.self, from: data) {
                    onCompletion(.success(json))
                } else {
                    onCompletion(.failure(.parsingFailed))
                }
            }
        })
        task.resume()
    }
}
