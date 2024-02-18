//
//  File.swift
//  
//
//  Created by Raghad on 18/02/2024.
//

import Vapor
import Fluent

final class Admin: Model, Content {
    static let schema = "admins"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "username")
    var username: String

    @Field(key: "password")
    var password: String
    
    init() { }

    init(id: UUID? = nil, username: String, password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
}
