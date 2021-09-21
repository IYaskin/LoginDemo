//
//  NetworkManager.swift
//  LoginDemo
//
//  Created by Игорь Яськин on 21.09.2021.
//

import Foundation

typealias SuccessHandler = (_ json : Any) -> ()
typealias ErrorHandler = (_ error : Error) -> ()


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = URL(string: "https://imagin.sandro.cc")!
    
    private lazy var defaultSession: URLSession = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Content-Type" : "application/json; charset=UTF-8"]
        return URLSession(configuration: config, delegate: nil, delegateQueue: nil)
    }()
    
    private init(){}
    
    func getRequest(path: ApiPaths,
                    success: @escaping SuccessHandler,
                    failure: @escaping ErrorHandler) {
        
        let url = baseURL.appendingPathComponent(path.rawValue)
        var urlRequest = URLRequest(url: url)

        let task = defaultSession.dataTask(with: urlRequest, completionHandler: { (data, response, error) -> () in
            guard error == nil else {
                failure(error!)
                return
            }
            
            guard let data = data,
                  let urlResponse = response as? HTTPURLResponse,
                  (200..<300).contains(urlResponse.statusCode) else {
                failure(NetworkError.badResponse)
                return
            }
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: data, options: [])
                success(responseJSON)
            }
            catch {
                failure(NetworkError.parseError)
            }
        })
        task.resume()
    }
    
    func postRequest(path: ApiPaths,
                     params:[String : Any],
                     success:@escaping (SuccessHandler),
                     failure:@escaping (ErrorHandler)) {
        
        let url = baseURL.appendingPathComponent(path.rawValue)
        print("URL = \(url)")
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        
        let task = defaultSession.dataTask(with: urlRequest, completionHandler: {(data, response, error) -> () in
            print("Response")
            print(response)
            guard error == nil else {
                failure(error!)
                return
            }
            
            guard let data = data,
                  let urlResponse = response as? HTTPURLResponse,
                  (200..<300).contains(urlResponse.statusCode) else {
                failure(NetworkError.badResponse)
                return
            }

            do {
                let responseJSON = try JSONSerialization.jsonObject(with: data, options: [])
                success(responseJSON)
            }
            catch {
                failure(NetworkError.parseError)
            }
        })
        
        task.resume()
    }
    
}
