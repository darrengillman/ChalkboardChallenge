//
//  Data.swift
//  Data
//
//  Created by Darren Gillman on 03/10/2021.
//

import Foundation

struct User: Codable, Equatable, Hashable {
   
   enum CodingKeys: String,CodingKey {
      case identity = "name"
      case dob
   }
   
   struct Identity: Codable, Equatable,Hashable {
      let title: String
      let first: String
      let last: String
      
      var initials: String {
         (!first.isEmpty ? String(first.first!) : "") + (!last.isEmpty ? String(last.first!) : "")
      }
   }
   
   struct DOB: Codable, Equatable, Hashable {
      static let inputDateFormatter : ISO8601DateFormatter = {
         let df = ISO8601DateFormatter()
         df.formatOptions.update(with: .withFractionalSeconds)
         return df
      }()
      
      static let outputDateFormatter: DateFormatter = {
         let df = DateFormatter()
         df.locale = Locale(identifier: "en_UK")
         df.dateStyle = .short
         return df
      }()
      
      static let dateErrorStr = "prefers to be ageless"
      
      let date: String
      let age: Int
      
      var birthday: String {
         guard let date = DOB.inputDateFormatter.date(from: date) else {return DOB.dateErrorStr}
         return DOB.outputDateFormatter.string(from: date)
      }
   }
   
   let identity: Identity
   let dob: DOB
}
   
