//
//  SessionManager.swift
//  SessionManager
//
//  Created by Darren Gillman on 03/10/2021.
//

import Foundation


class SessionManager {
   
   enum SessionError: Error {
      case invalidURL
      case APIError
      case APIDidNotCompleteError
      case invalidDataError
   }
  
   enum httpMethods: String {
      case get  = "GET"
      case post = "POST"
   }
   
   lazy var session: URLSession = {
      let sessionConfig = URLSessionConfiguration.default
      let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
      return session
   }()
   
   func downloadFromAPI(address: String, withParams params: [String:String], completion: @escaping (Data?, Error?) -> () ) {
      guard var url = URL(string: address) else {
         completion(nil, SessionError.invalidURL)
         return
      }
      
      url = url.appendingQueryParameters(params)
      var request = URLRequest(url: url)
      request.httpMethod = httpMethods.get.rawValue

      let task = session.dataTask(with: request,
                                  completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void  in
         guard error == nil else {
            completion(nil, SessionError.APIError)
            return
         }
         
         guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            completion (nil, SessionError.APIDidNotCompleteError)
            return
         }
         
         guard let data = data else {
            completion(nil, SessionError.invalidDataError)
            return
         }
         completion(data, nil)
      })
      task.resume()
   }
   
}
