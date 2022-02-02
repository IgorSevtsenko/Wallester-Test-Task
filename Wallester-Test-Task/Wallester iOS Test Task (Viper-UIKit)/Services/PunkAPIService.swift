//
//  PunkAPIService.swift
//  Wallester iOS Test Task (Viper-UIKit)
//
//  Created by Igor Ševtšenko on 31.12.2021.
//

import Foundation

struct PunkApiService{
    
    func loadList(at page: Int, completion: @escaping ([Beer]) -> ()){
        //MARK: - Checks is URL is valid + pagination
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)&per_page=25") else {
            print("Invalid URL")
            return
        }
        //MARK: - Creating URLSession DataTask
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            //MARK: - Handling no erros came
            guard error == nil else {
                print(error!)
                return
            }
            //MARK: - Handling data came
            guard let data = data else{
                print("Failed to load data")
                return
            }
            guard let beers = try? JSONDecoder().decode([Beer].self, from: data) else{
                print("Failed to decode data")
                return
            }
            completion(beers)
        }
        task.resume()
    }
}

