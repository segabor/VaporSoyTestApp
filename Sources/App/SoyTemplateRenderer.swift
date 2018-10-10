import Vapor
import Leaf

/// debug
extension String: Error {}

final class SoyTemplateRenderer: TagRenderer {
    init() {}

    func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        guard let templateName = tag.parameters[0].string else {
            throw "Missing tag name"
        }

        var output = "TBD"

        switch templateName {
        case "soy.examples.simple.helloWorld":
            output = helloWorld()
        default:
            throw "No template renderer is registered for \(templateName)"
        }

        return tag.container.future(.string(output))
    }
}
