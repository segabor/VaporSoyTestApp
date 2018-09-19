import Vapor
import Leaf

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // JavaScript examples
    router.get("js", "simple") { req in
        return try req.view().render("simple", ["name": "John Doe"])
    }
}
