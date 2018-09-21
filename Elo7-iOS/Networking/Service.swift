//
//  Service.swift
//  Elo7-iOS
//
//  Created by lugia on 20/09/18.
//  Copyright © 2018 MicFaifer. All rights reserved.
//

import Foundation

class Service {
    typealias careerPageResult = (Result<CareerPageResult, APIError>) -> ()

    func fetchCareerHome(completion: @escaping careerPageResult) {
        if let url = URL(string: CareerAPI.url) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error, error._code == NSURLErrorNotConnectedToInternet  {
                    return completion(Result.failure(APIError.noConnection))
                }
                if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let result = try jsonDecoder.decode(CareerPageResult.self, from: data)
                        return completion(Result.success(result))
                    } catch {
                        return completion(Result.failure(APIError.jsonParsingFailure))
                    }
                }
            }.resume()
        } else {
            completion(Result.failure(APIError.requestFailed))
        }
    }
}
