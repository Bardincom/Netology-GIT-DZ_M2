//
//  Extansion + PostStorage.swift
//  FirstCourseFinalTask
//
//  Created by Aleksey Bardin on 13.01.2020.
//  Copyright © 2020 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseFinalTaskChecker

extension PostsStorage {
  /// Заполняет данными публикацию по ID
  ///
  /// - Parameter postID: ID публикации которую нужно вернуть
  /// - Returns: Публикацию поддерживающую  UserProtocol.
  func fillPostData(for postID: GenericIdentifier<PostProtocol>) -> PostProtocol? {
    var author: GenericIdentifier<UserProtocol> = ""
    var description = ""
    let imageURL: URL = .init(fileURLWithPath: "")
    let createdTime: Date = . init()
    var currentUserLikesThisPost = false
    var likedByCount = 0
    
    for post in posts where post.id == postID {
      author = post.author
      description = post.description
    }
    
    for like in likes {
      if like.1 == postID {
        likedByCount += 1
      }
      
      if like.0 == currentUserID && like.1 == postID {
        currentUserLikesThisPost = true
      }
      
    }
    
    return Post(id: postID,
                author: author,
                description: description,
                imageURL: imageURL,
                createdTime: createdTime,
                currentUserLikesThisPost: currentUserLikesThisPost,
                likedByCount: likedByCount)
  }
}

extension PostsStorage {
  /// Проверяет наличие публикации по ID
  ///
  /// - Parameter postID: ID публикации которую нужно найти
  /// - Returns: False или True в зависимости от результата проверки.
  func isPostExist(_ postID: GenericIdentifier<PostProtocol>) -> Bool {
    guard posts.contains(where: { $0.id == postID }) else { return false }
    return true
  }
}
