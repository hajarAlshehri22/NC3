//
//  File.swift
//  
//
//  Created by Raghad on 18/02/2024.
//

import Vapor
import Fluent

final class Request: Model, Content {
    static let schema = "requests"
    
    @ID(key: .id)
    var id: UUID?

    @Field(key: "borrower_id")
    var borrowerID: UUID
    
    @Field(key: "device_id")
    var deviceID: UUID
    
    @Field(key: "status")
    var status: String
    
    init() { }

    init(id: UUID? = nil, borrowerID: UUID, deviceID: UUID, status: String) {
        self.id = id
        self.borrowerID = borrowerID
        self.deviceID = deviceID
        self.status = status
    }
}
