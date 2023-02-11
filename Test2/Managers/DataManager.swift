//
//  DataManager.swift
//  Test2
//
//  Created by Никита Чечнев on 05.02.2023.
//

import Foundation
import Network

struct Constants {
    static let baseURL: String = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
}

enum APIErrors: String, Error {
    case failedToGetData = "Error decoding network data. Please, make sure data is correct"
    case networkLost = "Unable to complete the request. Please check your internet connection"
}

final class DataManager {
    
    static let shared = DataManager()
    
    private let cache = Cache<NSString, [Employee]>()
    
    func getEmployees(completion: @escaping (Result<[Employee], Error>) -> Void) {
        
        if let employeeArray = cache.value(forKey: "array") {
            completion(.success(employeeArray))
            return
        }
        
        guard let url = URL(string: "\(Constants.baseURL)") else { return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self]
            data, _, error in
            guard let data, error == nil else {
                completion(.failure(APIErrors.networkLost))
                return
            }
            do {
                let result = try JSONDecoder().decode(Employees.self, from: data)
                self?.cache.insert(result.company.employees, forKey: "array")
                completion(.success(result.company.employees))
                
            } catch {
                completion(.failure(APIErrors.failedToGetData))
            }
        }
        task.resume()
    }
}
