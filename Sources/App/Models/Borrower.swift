//
//  File.swift
//  
//
//  Created by Raghad on 18/02/2024.
//


import Vapor
import Fluent

final class Borrower: Model, Content {
    static let schema = "borrowers"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "name")
    var name: String

    @Field(key: "email")
    var email: String
    
    init() { }

    init(id: UUID? = nil, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
