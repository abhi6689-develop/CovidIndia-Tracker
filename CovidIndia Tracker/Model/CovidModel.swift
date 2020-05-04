//
//  CovidModel.swift
//  CovidIndia Tracker
//
//  Created by Abhishek Tiwari on 04/05/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import Foundation

struct CovidModel{
    let total: Int
    let active: Int
    let cured: Int
    
    var totalString: String{
        return(String(total))
    }
    
    var activeString: String{
        return(String(active))
    }
    
    var curedString: String{
        return(String(cured))
    }
}
