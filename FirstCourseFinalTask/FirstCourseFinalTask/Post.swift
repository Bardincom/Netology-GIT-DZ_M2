//
//  Post.swift
//  FirstCourseFinalTask
//
//  Created by Aleksey Bardin on 06.01.2020.
//  Copyright © 2020 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseFinalTaskChecker

struct Post: PostProtocol {
  var id: Self.Identifier
  
  var author: GenericIdentifier<UserProtocol>
  
  var description: String
  
  var imageURL: URL { return .init(fileURLWithPath: "") }
  
  var createdTime: Date { return .init() }
  
  var currentUserLikesThisPost: Bool
  
  var likedByCount: Int
}
