//
//  ArticleModel.swift
//  pituku-ios-tes-2
//
//  Created by Ferry Julian on 11/11/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status, message: String
    let data: [Data]
    let totalItems, totalPages, currentPage: Int
}

// MARK: - Data
struct Data: Codable {
    let id, title, description: String
    let cover: String
    let createdAt: String
}
