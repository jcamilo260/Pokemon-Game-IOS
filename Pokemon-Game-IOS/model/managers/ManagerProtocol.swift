//
//  ManagerProtocol.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 2/11/23.
//

import Foundation
protocol ManagerProtocol{
    associatedtype Element
    func decodeModel(data: Data)->[Element]?
}
