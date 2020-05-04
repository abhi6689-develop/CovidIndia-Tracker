//
//  CovidManager.swift
//  CovidIndia Tracker
//
//  Created by Abhishek Tiwari on 04/05/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//
import Foundation

protocol UpdateCovidData {
    func didUpdateData(_ covidManager: CovidManager, data1: CovidModel)
    func didFailWithError(error: Error)
}

struct CovidManager{
    
    var delegate: UpdateCovidData?
    var url = "https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true"
    
    func fetchData(){
        performRequest(url: url)
        
    }
    func performRequest(url: String){
        if let urls = URL(string: url){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urls) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let data1 = self.parseJSON(safeData){
                        self.delegate?.didUpdateData(self, data1: data1)
                        
                    }
                }
            }
            task.resume()
        }
        
    }
    func parseJSON(_ data1: Data) -> CovidModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(CovidData.self, from: data1)
            let total = decodedData.totalCases
            print(decodedData.totalCases)
            let active = decodedData.activeCases
            let cured = decodedData.recovered
            let data1 = CovidModel(total: total, active: active, cured: cured)
            return data1
        }
        catch{
            delegate?.didFailWithError(error: error)
            return nil
            
        }
        
            
        }
    }

