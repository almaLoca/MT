//
//  ListModel.swift
//  MT
//
//  Created by Reshma on 16/02/21.
//

import Foundation

// MARK: - ListModel
struct ListModel: Codable {
    var status: Int?
    var message: String?
    var data: DataClass?
    var code: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    var body: [Body]?
    var banner: Banner?
}

// MARK: - Banner
struct Banner: Codable {
    var list: [BannerList]?
    var title, type: String?
}

// MARK: - BannerList
struct BannerList: Codable {
    var text, id, type, listID: String?
    var image: String?

    enum CodingKeys: String, CodingKey {
        case text
        case id = "_id"
        case type
        case listID = "id"
        case image
    }
}

// MARK: - Body
struct Body: Codable {
    var title, type: String?
    var list: [BodyList]?
    var fullList: String?
}

// MARK: - BodyList
struct BodyList: Codable {
    var id, userTitle: String?
    var accountVerified: Bool?
    var userID: Int?
    var userDesc: String?
    var userAvthar: String?
    var tags: [String]?
    var packageID: String?
    var bannerCover: String?
    var bannerDesc, paymentType, userSubTitle, price: String?
    var bannerTitle, postTitle: String?
    var postAuthor: PostAuthor?
    var attachment: [Attachment]?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userTitle, accountVerified
        case userID = "userId"
        case userDesc, userAvthar, tags
        case packageID = "packageId"
        case bannerCover, bannerDesc, paymentType, userSubTitle, price, bannerTitle, postTitle, postAuthor, attachment
    }
}

// MARK: - Attachment
struct Attachment: Codable {
    var mimeType: String?
    var thumb: String?
}

// MARK: - PostAuthor
struct PostAuthor: Codable {
    var accountVerified: Bool?
    var id: String?
    var userDP: String?
    var userType: Int?
    var lastName, firstName: String?
    var userDkID: Int?

    enum CodingKeys: String, CodingKey {
        case accountVerified
        case id = "_id"
        case userDP = "userDp"
        case userType, lastName, firstName
        case userDkID = "userDkId"
    }
}
