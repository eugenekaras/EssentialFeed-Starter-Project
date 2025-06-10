//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Yauheni Karas on 10/06/2025.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get (from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
