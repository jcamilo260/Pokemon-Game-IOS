//
//  ImageManager.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 2/11/23.
//

import Foundation
protocol ImageManagerDelegate{
    func imageDidUpdate(_ imageManager: ImageManager, model: ImageDTO)
    func imageDidNotUpdate(error: Error)
}

struct ImageManager: ManagerProtocol{
    typealias Element = ImageDTO
    public var delegate: ImageManagerDelegate?
    
    public func fetchRequest(url: String){
        self.performRequest(url)
    }
    
    private func performRequest(_ url: String){
        if let url = URL(string: url){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    self.delegate?.imageDidNotUpdate(error: error!)
                    return
                }
                
                if let data = data{
                    let decodedImage = decodeModel(data: data)
                    guard let firstDecodedImage: ImageDTO = decodedImage?.first else {return}
                    self.delegate?.imageDidUpdate(self, model: firstDecodedImage)
                }
            }
            task.resume()
        }
    }
    
    func decodeModel(data: Data) -> [ImageDTO]? {
        let url: ImageData? = JsonConverter.decodeModel(dataType: ImageData.self, data: data)
        guard let safeURL = url else {return nil}
        let imageDTO: [ImageDTO] = [ImageDTO(imageURL: safeURL.sprites.other?.officialArtwork.frontDefault ?? "")]
        return imageDTO
    }
    
}
