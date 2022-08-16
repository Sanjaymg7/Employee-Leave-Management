//
//  UserDefaultExtension.swift
//  Employee-Leave-Management
//
//  Created by Sanjay M G on 16/08/22.
//

import Foundation

extension UserDefaults{
    
    func setAppData<T:Codable>(data:[T],dataKey:String) -> Bool {
        do{
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(data)
            appUserDefaults.setValue(encodedData, forKey: dataKey)
            return true
        }catch{
            return false
        }
    }
    
    func getAppData<T:Codable>(dataKey:String) -> [T]{
        guard let schemaData = appUserDefaults.object(forKey: dataKey) as? Data else{return []}
        do{
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([T].self, from: schemaData)
            return decodedData
        }catch{
            return []
        }
    }
    
}
