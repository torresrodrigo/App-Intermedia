//
//  Service.swift
//  App-Intermedia
//
//  Created by Rodrigo Torres on 18/05/2021.
//

import Foundation

class ServiceAPI {
    
    static let shared = ServiceAPI()
    
    
    
    func getCharacters(limit : Int, offset: Int , completed: @escaping (Result<CharacterBaseData, ErrorMessage>) -> Void) {
        
        
        let urlString : String = "https://gateway.marvel.com/v1/public/characters?limit=\(limit)&offset=\(offset)&ts=1&apikey=\(publicKey)&hash=\(hash)"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(CharacterBaseData.self, from: data)
                completed(.success(results))
                
                
            } catch {
                completed(.failure(.invalidData))
            }
            
            
        }
        task.resume()
    }
    
  
    
    func getEvents(limit : Int , completed: @escaping (Result<EventBaseData, ErrorMessage>) -> Void) {
        
        
        let urlString : String = "https://gateway.marvel.com/v1/public/events?limit=\(limit)&ts=1&apikey=\(publicKey)&hash=\(hash)"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completed(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let results = try decoder.decode(EventBaseData.self, from: data)
                completed(.success(results))
                
                
            } catch {
                completed(.failure(.invalidData))
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
}
