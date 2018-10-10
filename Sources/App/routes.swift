import Vapor
import Leaf

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get() { req in
        return try req.view().render("index")
    }

    // JavaScript examples
    router.get("js", "simple", "helloWorld") { req in
        return try req.view().render("js_simple/helloWorld")
    }
    router.get("js", "simple", "helloName") { req in
        return try req.view().render("js_simple/helloName", ["name": "John Appleseed"])
    }
    router.get("js", "simple", "helloNames") { req in
        return try req.view().render("js_simple/helloNames", ["name": "John Appleseed"])
    }

    // Swift examples
    router.get("swift", "simple", "helloWorld") { req in
        return try req.view().render("swift_simple/helloWorld")
    }
    router.get("swift", "simple", "helloName") { req in
        return try req.view().render("swift_simple/helloName", ["name": "John Appleseed"])
    }
    router.get("swift", "simple", "helloNames") { req in
        return try req.view().render("swift_simple/helloNames", ["name": "John Appleseed"])
    }
}
