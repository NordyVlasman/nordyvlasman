import Foundation
import Publish
import Plot
import SwiftPygmentsPublishPlugin

struct Nordyvlasman: Website {
    enum SectionID: String, WebsiteSectionID {
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
    }

    var url = URL(string: "https://nordyvlasman.nl")!
    var name = "Nordy Vlasman"
    var description = "nordyvlasman.nl"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

try Nordyvlasman().publish(
    withTheme: .myTheme,
    additionalSteps: [
        .installPlugin(.pygments()),
        .generateRSSFeed(including: [.posts], config: RSSFeedConfiguration(targetPath: "feed.xml", ttlInterval: 250, maximumItemCount: 100, indentation: nil))
    ],
    plugins: [.pygments()]
)
