import Vapor
import Leaf

/// debug
extension String: Error {}

/**
 * This class implements #soy renderer leaf tag
 *
 * Format: #soy("canonical template name", ...)
 *
 * Actually it receives arbitrary params but the
 * final version should only accept a map of [String: SoyValue] or like
 * Now leaf does not let composing map of single values in template
 */
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
        case "soy.examples.simple.helloName":
            // accepting single values will not be allowed in the final version
            // but for sake of experiment we leave it as-is
            let name = tag.parameters[1].string

            let context : [String: SoyValue] = name == nil ? [:] : ["name": name!]
            output = helloName(context)
        case "soy.examples.simple.helloNames":
            // TODO: this is so ugly ...
            let arrayOfThings = tag.parameters[1].array ?? []
            let namesList : [String] = arrayOfThings.map{ $0.string }.compactMap{ $0 }

            let context = ["names": namesList]
            output = helloNames(context)
        default:
            throw "No template renderer is registered for \(templateName)"
        }

        return tag.container.future(.string(output))
    }
}
