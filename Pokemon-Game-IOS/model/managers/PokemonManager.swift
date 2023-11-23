//
//  PokemonManager.swift
//  Pokemon-Game-IOS
//
//  Created by Juan Camilo Argüelles Ardila on 2/11/23.
//

import Foundation
protocol PokemonManagerDelegate{
    func pokemonDidUpdate(_ pokemonManager: PokemonManager, models: [PokemonDTO])
    func pokemonDidNotUpdate(error: Error)
}

struct PokemonManager: ManagerProtocol{
    typealias Element = PokemonDTO
    private let url: String
    public var delegate: PokemonManagerDelegate?
    
    init(){
        self.url = "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0"
    }
    
    public func fetchRequest(){
        print("Im here")
        self.performRequest(theUrl: self.url)
    }
    
    private func performRequest(theUrl: String){
        if let url = URL(string: theUrl){
            let session = URLSession(configuration: .default)
            var request: URLRequest = URLRequest(url: url)
            request.httpMethod = "GET"
            let task = session.dataTask(with: request) { data, response, error in
                if error != nil{
                    self.delegate?.pokemonDidNotUpdate(error: error!)
                    return
                }
                
                if let response = response as? HTTPURLResponse, response.statusCode != 200{
                    return
                }
                
                if let data = data{
                    guard let decoded: [PokemonDTO] = decodeModel(data: data) else {return}
                    self.delegate?.pokemonDidUpdate(self, models: decoded)
                }
            }
            task.resume()
        }
    }
    
    func decodeModel(data: Data)->[PokemonDTO]?{
        let decodedData: PokemonData? = JsonConverter.decodeModel(dataType: PokemonData.self, data: data)
        guard let decodedData = decodedData else {return nil}
        let pokemonsDTO: [PokemonDTO] = decodedData.results.map {
            PokemonDTO(name: $0.name, url: $0.url)
        }
        return pokemonsDTO
    }
}
