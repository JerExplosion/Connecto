//
//  InterWebServers.swift
//  Connecto
//
//  Created by Jerry Ren on 6/21/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct Resourcefulness<T: Codable> {
    let url: URL
}

class InterWebService{
    func loader<T>(resource: Resourcefulness<T>, completionBlock: @escaping (Result<T, InterNetError>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { (data, response, error) in
               
            guard let unwrappedData = data, error == nil else {
                completionBlock(.failure(InterNetError.domainError))
                return
            }
            let result = try? JSONDecoder().decode(T.self, from: unwrappedData)
            if let unwrappedResult = result {
                DispatchQueue.main.async {
                    completionBlock(.success(unwrappedResult))
                }
            }
            else {
                completionBlock(.failure(InterNetError.decoderError))
            }
        }.resume()
        
    }
}
              

enum InterNetError: Error {
    case domainError
    case decoderError
    case urlError
}
    
