//
//  JsonConverter.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 2/11/23.
//

import Foundation
class JsonConverter{
    
    private static let decoder: JSONDecoder = JSONDecoder()
    
    public static func decodeModel<T: Codable>(dataType: T.Type, data: Data)->T?{
        let decodedData = try? decoder.decode(dataType, from: data)
        guard let decodedData = decodedData else {return nil}
        return decodedData
    }
}
