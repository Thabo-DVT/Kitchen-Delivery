//
//  URLSession+Extension.swift
//  Kitchen Delivery
//
//  Created by Thabo Chesane on 2023/03/12.
//

import Foundation


extension URLSession{
    
    
    enum CustomError: Error{
        case invalidResponse
        case invalidRequest
        case invalidUrl
        case invalidData
    }
    func makeRequest<Generic: Codable>(url: URL?,
                                       model: Generic.Type,
                                       completion: @escaping (Result<Generic, Error>) -> Void){
        
           
            guard let endpointUrl = url else {
                completion(.failure(CustomError.invalidUrl))
                return
            }
        
        var request = URLRequest(url: endpointUrl,timeoutInterval: Double.infinity)
        request.addValue(Constants.apiKey, forHTTPHeaderField: Constants.httpHeader)
        request.addValue(Constants.cookieValue, forHTTPHeaderField: Constants.cookieHeader)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }

        
            do{
                //print("decoding now")
                let myData = try JSONDecoder().decode(model, from: data)
                completion(.success(myData))
                
            }
            catch{
                //print("Can not decode")
                completion(.failure(error))
            }
            
        
        }

        task.resume()

           
            
    }
    
}
