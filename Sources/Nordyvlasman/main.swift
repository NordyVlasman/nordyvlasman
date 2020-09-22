import Foundation
import Publish
import Plot
import SwiftPygmentsPublishPlugin

// This type acts as the configuration for your website.
struct Nordyvlasman: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://nordyvlasman.nl")!
    var name = "Nordy Vlasman"
    var description = "nordyvlasman.nl"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try Nordyvlasman().publish(
    withTheme: .myTheme,
    additionalSteps: [
        .installPlugin(.pygments()),
    ],
    plugins: [.pygments()]
)
