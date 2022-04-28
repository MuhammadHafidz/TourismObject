//
//  ResponseTourism.swift
//  LastSubmissionIOSSederhana
//
//  Created by Enygma System on 05/04/22.
//

import Foundation

struct ResponseTourism: Decodable{
    var error : Bool
    var message : String
    var count : Int
    var places : [Tourism]
}
