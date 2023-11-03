//
//  Collection+ext.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 2/11/23.
//

import Foundation
extension Collection where Indices.Iterator.Element == Index{
    
    public subscript(index: Index)->Iterator.Element?{
        return (index >= startIndex && index < endIndex) ? self[index] : nil
    }
}

extension Collection{
    public func choose(length: Int)->Array<Element>{
        return Array(shuffled().prefix(length))
    }
}
