//
//  Storage.swift
//  Multimedia-HomeWork-IOS-8 Kharin_ALEXEY
//
//  Created by Alexey Kharin on 10.05.2021.

import UIKit

struct PostContent {
    let urlString: URL?
    let name: String
}
class Storage {
    static let collection: [PostContent] = [PostContent(urlString: URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"), name: "Swift: Custom TableView Swipe Actions (2021, Xcode 12, Swift 5) - iOS Development"), PostContent(urlString: URL(string: "https://www.youtube.com/watch?v=SJnw8KFhTFQ"), name: "САМЫЕ БОЛЬШИЕ ВОЛНЫ снятые на камеру"), PostContent(urlString: URL(string: "https://www.youtube.com/watch?v=kF2BAFnHNH4"), name: "Мощные Природные Явления, снятые на камеру")]
}
