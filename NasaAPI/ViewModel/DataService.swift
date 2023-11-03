//
//  DataService.swift
//  NasaAPI
//
//  Created by Christopher Woods on 11/2/23.
//

import Foundation


//setDate(current: date)
class NasaDataService {
    
    var URLString = ""
    
    func setDate(current: String){
        URLString = "https://api.nasa.gov/planetary/apod?api_key=\(APIkey)&date=\(current)"
    }
    
    func fetchPicture(completion: @escaping(String) -> Void) {
        guard let url = URL(string: URLString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data received.")
                return
            }

            do {
                let response = try JSONDecoder().decode(NasaResponse.self, from: data)
                let picture = response.hdurl
                
                completion(picture)
            } catch {
                print("Error decoding data: \(error)")
            }
            
            
        }.resume()
    }
    
    
    
    
}
