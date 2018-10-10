//
//  simple.swift
//  App
//
//  Created by Sebestyén Gábor on 2018. 09. 27..
//

import Foundation

// utility functions //

/* Messages */

struct Message {
    let format: String
    let placeholders: [String]
}

var messages = [Int: Message]()

struct translator_impl {
    public static func prepare(_ random: Int, _ format: String, _ placeholders: [String] = []) -> Message {
        // pick cached message
        if let msg = messages[random] {
            return msg
        }

        // cache message
        let msg = Message(format: format, placeholders: placeholders)
        messages[random] = msg

        return msg
    }

    public static func prepare_literal(_ random: Int, _ format: String) -> Message {
        return prepare(random, format)
    }

    public static func render_literal(_ message: Message) -> String {
        return message.format
    }

    public static func render(_ message: Message, _ arguments: [String: CustomStringConvertible]) -> String {
        var content = message.format
        arguments.forEach({ (placeholder, value) in
            content = content.replacingOccurrences(of: "{"+placeholder+"}", with: value.description)
        })
        return content
    }
}

/* Sanitizers */

struct soy {
    public static func escapeHtml(_ content: CustomStringConvertible) -> CustomStringConvertible {
        return content.description
    }
}

// renderers //

public func helloWorld(_ data: [String:SoyValue] = [:], _ ijData: [String:SoyValue] = [:]) -> String {
    var output = ""
    output.append(translator_impl.render_literal(translator_impl.prepare_literal(3022994926184248873, "Hello world!")))
    return output
}


public func helloName(_ data: [String:SoyValue] = [:], _ ijData: [String:SoyValue] = [:]) -> String {
    var output = ""
    output.append((data["name"] != nil) ? translator_impl.render(translator_impl.prepare(6936162475751860807, "Hello {NAME}!", ["NAME"]), ["NAME": soy.escapeHtml(data["name"] as! CustomStringConvertible).description]) : helloWorld([:], ijData).description)
    return output
}


public func helloNames(_ data: [String:SoyValue] = [:], _ ijData: [String:SoyValue] = [:]) -> String {
    var output = ""
    if let nameList30 = data["names"] as? [SoyValue] {
        for (nameIndex30, nameData30) in nameList30.enumerated() {
            output.append(helloName(["name": nameData30], ijData).description)
            // "<br>"
            if nameIndex30 != nameList30.endIndex {
                //
                output.append("<br>")
            }
        }
    } else {
        output.append(helloWorld([:], ijData).description)
    }
    return output
}
