//
//  Node+Header.swift
//  
//
//  Created by Nordy Vlasman on 16/09/2020.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func siteHeader<T: Website>(for context: PublishingContext<T>) -> Node {
        .header(
            .wrapper(
                .nav(
                    .class("site-name"),
                    .div(
                        .a(
                            .text("Nordy Vlasman"),
                            .class("bg-clip-text text-transparent bg-gradient-to-r from-green-400 to-light-blue-500"),
                            .href("/")
                        ),
                        .class("font-bold text-2xl")
                    )
                )
            ),
            .wrapper(
                .a(
                    .href("https://github.com/NordyVlasman"),
                    .text("Github &rarr;"),
                    .class("font-medium hover:text-gray-700 dark:prose-dark")
                ),
                .class("text-base leading-5")
            ),
            .class("flex justify-between items-center py-10")
        )
    }
}

extension Node where Context == HTML.BodyContext {
    static func pageHeader(title: String, description: String) -> Node {
        .wrapper(
            .h1(
                .text(title),
                .class("text-2xl leading-9 font-extrabold text-gray-900 tracking-tight sm:text-4xl sm:leading-10 md:text-5xl md:leading-14 dark:prose-dark")
            ),
            .p(
                .text(description),
                .class("text-lg leading-7 dark:text-white")
            ),
            .class("pt-6 pb-8 space-y-2 md:space-y-5 dark:prose-dark")
        )
    }
}
