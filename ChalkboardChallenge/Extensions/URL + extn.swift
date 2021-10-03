//
//  URL + extn.swift
//  URL + extn
//
//  Created by Darren Gillman on 03/10/2021.
//

import Foundation

import Foundation

extension URL {
   /**
    Appends query parameters to a URL from a dictionary of parameters and values.
    If unable to generate a valie URL it returns self
    - Parameter parametersDictionary: dictionary of query parameters [paramter : value] where both are String
    - Returns: URL with added parameters if possible, else original URL
    */
   func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
      guard var components = URLComponents(string: self.absoluteString) else {return self}
      if components.queryItems == nil  {components.queryItems = []}
      for parameter in parametersDictionary {
         components.queryItems?.append(URLQueryItem(name: parameter.key, value: parameter.value))
      }
      return components.url ?? self
   }
}
