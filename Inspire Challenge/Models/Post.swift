// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let posts = try Posts(json)

import Foundation

struct PostList: Codable {
    let posts: [Post]
}

extension PostList {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PostList.self, from: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

struct Post: Codable, Identifiable {
    let id, trackingId, slug: String
    let author: Author?
    let url, title, content: String
    let created: Date
    let updated: String?
    let reactions: [Reaction]?
    let isFollowed: Bool?
    let replyCountNonDeleted: Int?
}



struct Author: Codable {
    let nickname: String?
    let avatar: Avatar?
}

struct Avatar: Codable {
    let small: String?
}

struct Reaction: Codable {
    let type: TypeEnum?
    let count: Int?
    let reactedByMe: Bool?
    let users: String?

    enum CodingKeys: String, CodingKey {
        case type, count
        case reactedByMe
        case users
    }
}

enum TypeEnum: String, Codable {
    case support = "support"
    case thanks = "thanks"
    case useful = "useful"
}

// Helper functions for creating encoders and decoders
func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
