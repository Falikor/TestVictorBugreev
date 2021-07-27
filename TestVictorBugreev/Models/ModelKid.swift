//
//  ModelKid.swift
//  TestVictorBugreev
//
//  Created by 17760021 on 26.07.2021.
//

import Foundation

struct Kids {
    var name: String
    var surname: String
    var middleName: String
    var age: Int
    
    var fullName: String {
        "\(name) \(middleName) \(surname)"
    }
    

}


