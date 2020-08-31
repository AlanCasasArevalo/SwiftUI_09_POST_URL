//
//  File.swift
//  SwiftUI_09_POST_URL
//
//  Created by Everis on 31/08/2020.
//  Copyright © 2020 Alan. All rights reserved.
//

import Foundation
// MARK: - LoginResponseEntity
struct LoginResponseEntity: Codable {
    let token: String?
    var error: String?
}
