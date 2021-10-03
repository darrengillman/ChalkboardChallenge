//
//  Result.swift
//  Result
//
//  Created by Darren Gillman on 03/10/2021.
//

import Foundation

// Wrapper for API download
// To facilitate quick data handling without writing custom decoders.

struct Results: Codable {  //wrapper for easy decoding
   let results: [User]
}
