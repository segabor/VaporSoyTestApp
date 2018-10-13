import Vapor
import Leaf

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get() { req in
        return try req.view().render("index")
    }

    // Client-Side rendering entrypoints
    router.get("js", "simple", "helloWorld") { req in
        return try req.view().render("js_simple/helloWorld")
    }
    router.get("js", "simple", "helloName") { req in
        return try req.view().render("js_simple/helloName", ["name": "John Appleseed"])
    }
    router.get("js", "simple", "helloNames") { req in
        return try req.view().render("js_simple/helloNames", ["name": "John Appleseed"])
    }

    // Server-Side rendering entrypoints
    router.get("swift", "simple", "helloWorld") { req in
        return try req.view().render("swift_simple/helloWorld")
    }
    router.get("swift", "simple", "helloName") { req in
        return try req.view().render("swift_simple/helloName", ["name": "John Appleseed"])
    }
    router.post(HelloName.self, at: "swift", "simple", "helloName") { req, form in
        return try req.view().render("swift_simple/helloName", ["name": form.name])
    }
    router.get("swift", "simple", "helloNames") { req in
        return try req.view().render("swift_simple/helloNames", ["names": ["John", "Peter", "Ramsey"]])
    }
}
