//
//  MyHtmlFactory.swift
//  
//
//  Created by Nordy Vlasman on 16/09/2020.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func wrapper(_ nodes: Node...) -> Node {
        .div(.class("wrapper"), .group(nodes))
    }
    
    static func itemList<T: Website>(for items: [Item<T>], on site: T) -> Node {
        return .ul(
            .class("item-list"),
            .forEach(items) { item in
                .li(.article(
                    .h1(.a(
                        .href(item.path),
                        .text(item.title)
                    )),
                    .p(.text(item.description))
                ))
            }
        )
    }
}

struct MyHtmlFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .head(for: index, on: context.site),
            
            .body(
                .class("bg-white dark:bg-gray-800"),
                .wrapper(
                    .siteHeader(for: context),
                    .class("max-w-3xl mx-auto px-4 sm:px-6 xl:max-w-5xl xl:px-0")
                ),
                .wrapper(
                    .pageHeader(title: "Laatste posts", description: "Een overzicht van mijn laatste posts"),
                    .ul(
                        .class("divide-solid divide-y border-t border-solid"),
                        .forEach(
                            context.allItems(sortedBy: \.date, order: .descending)
                        ) { item in
                            .postExcerpt(for: item)
                        }
                    ),
                    .class("max-w-3xl mx-auto px-4 sm:px-6 xl:max-w-5xl xl:px-0 ")
                )
            )
        )
    }
    
    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        try makeIndexHTML(for: context.index, context: context)
    }
    
    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .head(for: item, on: context.site),
            
            .body(
                .class("bg-white dark:bg-gray-800"),
                .wrapper(
                    .siteHeader(for: context),
                    .class("max-w-3xl mx-auto px-4 sm:px-6 xl:max-w-5xl xl:px-0")
                ),
                
                .wrapper(
                    .pageHeader(title: item.title, description: "Gepubliceerd op " + DateFormatter.blog.string(from: item.date).capitalized),
                    .article(
                        .contentBody(item.body),
                        .class("break-words border-t border-solid py-12 prose prose-sm sm:prose-xl max-w-none dark:prose-dark")
                    ),
                    .class("max-w-3xl mx-auto px-4 sm:px-6 xl:max-w-5xl xl:px-0")
                )
            )
        )
    }
    	
    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        try makePageHTML(for: page, context: context)
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        nil
    }
}

extension Theme {
    static var myTheme: Theme {
        Theme(
            htmlFactory: MyHtmlFactory(),
            resourcePaths: ["Resources/MyTheme/styles.css"]
        )
    }
}
