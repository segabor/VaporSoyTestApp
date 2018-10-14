# What is this?

This is a demo application demonstrating Closure Templates, a language neutral web templating in Vapor.

# Closure what?

Closure Templates is one of Google’s tools developed primarily for their internal apps like Google Mail or Google Calendar. It is a client-side and server-side templating system used to build dynamic and reusable HTML and UI elements.

Note, Closure Templates are sometimes called Soy or Soy templates.

# Sure, ok. Go on.

One key feature of Closure Templates is that they can be rendered on both client and server-side. So you can have your page fully rendered at load time but any part can be updated purely in the browser using the very same templates!
Just a few web templating solution can do this trick. Not to mention that Closure Templates are designed to be fast as hell, and secure.

# How does it work?

In order to use templates they must be compiled first. The resulted source contains the actual renderers that produces the part of the final web content described in the template file.
For the browser, target language is JavaScript. On server side you choose. Primary languages are Java and Python but I included Swift support as well.

This demo app includes an experimental version of Soy compiler that transforms templates to Swift functions. Check out them in `Tools` folder. Helper scripts `soy2js.sh` and `soy2swift.sh` are also provided.

# Files please

- Soy templates are put under `Resources/SoyTemplates` folder.
- Generated JS code is here `Public/soy/simple.js`
- Generated Swift code is at `Source/App/Renderers/simple.swift`
- Custom Leaf tag `#soy` that invokes Soy template renderers is here `Sources/App/SoyTemplateRenderer.swift`
- Leaf templates containing client-side examples are in `Resources/Views/js_simple` folder
- Leaf templates including `#soy()` tag are in `Resources/Views/swift_simple`

# Enough! How can I try it out?

Clone this repository on your computer, build and run it as a usual Vapor app and jump to the home page.

You can try out three simple templates rendered on client and server-side.

# Interesting stuff! Can I use it now for production?

Sorry, bad news. This is just an experimental project, far from stable, working version. Even the included compiler is full of hack and generates buggy stuff so I needed to fix the source to make it work.

I made this demo for the public to see if it raises enough interest.

If you find it cool just star the [demo app repo](https://github.com/segabor/VaporSoyTestApp)! Found a bug, have an improvement, PRs are most welcome! Questions? Open an issue to discuss!

# References

- Demo project repository: [github](https://github.com/segabor/VaporSoyTestApp)
- Experimental Closure Templates Compiler repo: [github](https://github.com/segabor/closure-templates)
- Closure Templates Docs: [Google Developers site](https://developers.google.com/closure/templates/docs/concepts) (note, that home page is broken, links are outdated).
