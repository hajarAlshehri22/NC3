//import Vapor
//
//func routes(_ app: Application) throws {
//    app.get { req async in
//        "It works!"
//    }
//
//    app.get("hello") { req async -> String in
//        "Hello, world!"
//    }
//}


import Vapor
import Fluent

func routes(_ app: Application) throws {
    // 1. Fetch all requests (GET) - by Admin
    app.get("requests") { req -> EventLoopFuture<[Request]> in
        return Request.query(on: req.db).all()
    }
    
    // 2. Fetch devices by category (GET) - by Borrower
    app.get("devices", ":category") { req -> EventLoopFuture<[Device]> in
        let category = req.parameters.get("category")!
        return Device.query(on: req.db)
            .filter(\.$category == category)
            .all()
    }
    
    // 3. Fetch request status (GET) - by Borrower
    app.get("request", ":id", "status") { req -> EventLoopFuture<Request> in
        let requestId = req.parameters.get("id")!
        return Request.find(UUID(requestId), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
    
    // 4. Update status (PUT) - by Admin
    app.put("request", ":id", "status") { req -> EventLoopFuture<HTTPStatus> in
        let requestId = req.parameters.get("id")!
        return Request.find(UUID(requestId), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { request in
                let newStatus = try req.content.decode(RequestStatus.self)
                request.status = newStatus
                return request.save(on: req.db)
                    .transform(to: .ok)
            }
    }
    
    // 5. Add new request (POST) - by Borrower
    app.post("requests") { req -> EventLoopFuture<Request> in
        let newRequest = try req.content.decode(Request.self)
        return newRequest.save(on: req.db).map { newRequest }
    }
    
    // 6. Delete request (DELETE) - by Borrower
    app.delete("request", ":id") { req -> EventLoopFuture<HTTPStatus> in
        let requestId = req.parameters.get("id")!
        return Request.find(UUID(requestId), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { request in
                return request.delete(on: req.db)
                    .transform(to: .noContent)
            }
    }
}
