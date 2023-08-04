//
//  Album.swift
//  21_06_2023_JSONDecoderDemo
//
//  Created by Vishal Jagtap on 04/08/23.
//

import Foundation
struct Album : Decodable{
    var userId : Int
    var id : Int
    var title : String
}
