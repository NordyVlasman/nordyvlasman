//
//  File.swift
//  
//
//  Created by Nordy Vlasman on 16/09/2020.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.ListContext {
    static func postExcerpt<T: Website>(for item: Item<T>) -> Node {
        .li(
            .article(
                .dl(
                    .dt(
                        .text("Published on: "),
                        .class("sr-only")
                    ),
                    .dd(
                        .p(
                            .text(DateFormatter.blog.string(from: item.date).capitalized)
                        ),
                        .class("text-base leading-6 font-medium dark:prose-dark")
                    )
                ),
                .wrapper(
                    .wrapper(
                        .h2(
                            .a(
                                .href(item.path),
                                .text(item.title),
                                .class("text-gray-700")
                            ),
                            .class("text-2xl leading-7 font-bold tracking-tight")
                        ),
                        .p(
                            .text("Door: Nordy Vlasman"),
                            .class("space-y-4  dark:prose-dark")
                        ),
                        .wrapper(
                            .text(item.description),
                            .class("prose max-w-none  dark:prose-dark")
                        ),
                        .class("space-y-2")
                    ),
                    .wrapper(
                        .a(
                            .href(item.path),
                            .text("Lees verder &rarr;"),
                            .class("text-blue-500 hover:text-blue-600")
                        ),
                        .class("text-base leading-6 font-medium")
                    ),
                    .class("space-y-5 xl:col-span-3")
                ),
                .class("space-y-2 xl:grid xl:grid-cols-4 xl:space-y-9 xl:items-baseline  dark:prose-dark")
            ),
            .class("py-12")
        )
    }
}
