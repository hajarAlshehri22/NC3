//
//  File.swift
//  
//
//  Created by Raghad on 18/02/2024.
//

//import Vapor
//import Fluent
//
//final class Device: Model, Content {
//    static let schema = "devices"
//    
//    @ID(key: .id)
//    var id: UUID?
//
//    @Field(key: "category")
//    var category: String
//
//    @Field(key: "name")
//    var name: String
//    
//    init() { }
//
//    init(id: UUID? = nil, category: String, name: String) {
//        self.id = id
//        self.category = category
//        self.name = name
//    }
//}

import Vapor
import Fluent

final class Device: Model, Content {
    static let schema = "devices"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "categories") 
    var categories: [String]

    @Field(key: "name")
    var name: String
    
    init() { }

    init(id: UUID? = nil, categories: [String], name: String) {
        self.id = id
        self.categories = categories
        self.name = name
    }
}


let iPhone12 = Device(categories: ["phones", "iPhone12"], name: "iPhone 12")
let iPhone12Pro = Device(categories: ["phones", "iPhone12Pro"], name: "iPhone 12 Pro")
let iPadAir = Device(categories: ["iPads", "iPadAir"], name: "iPad Air")
let iPadPro = Device(categories: ["iPads", "iPadPro"], name: "iPad Pro")
let appleWatchSE = Device(categories: ["watches", "AppleWatchSE"], name: "Apple Watch SE")
let appleWatchUltra = Device(categories: ["watches", "AppleWatchUltra"], name: "Apple Watch Ultra")

