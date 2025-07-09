//
//  URLSessionHTTPClient.swift
//  EssentialFeed
//
//  Created by Yauheni Karas on 04/07/2025.
//

import Foundation

public class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession
    
    public init(session: URLSession = .shared) {
        self.session = session
    }
    
    
    private struct UnexpectedValuesRepresentatiomError: Error {}
    
    public func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {

        session.dataTask(with: url) { data, response, error in
            if let error = error  {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success(data, response))
            } else {
                completion(.failure(UnexpectedValuesRepresentatiomError()))
            }
        }.resume()
    }
}
