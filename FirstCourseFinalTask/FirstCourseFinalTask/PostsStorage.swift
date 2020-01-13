//
//  PostsStorage.swift
//  FirstCourseFinalTask
//
//  Created by Aleksey Bardin on 29.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseFinalTaskChecker

class PostsStorage: PostsStorageProtocol {
  
  var posts: [PostInitialData]
  var likes: [(GenericIdentifier<UserProtocol>, GenericIdentifier<PostProtocol>)]
  var currentUserID: GenericIdentifier<UserProtocol>
  
  var count: Int { posts.count }

  //  MARK: Initialization
  
  required init(posts: [PostInitialData],
                likes: [(GenericIdentifier<UserProtocol>, GenericIdentifier<PostProtocol>)],
                currentUserID: GenericIdentifier<UserProtocol>) {
    
    self.posts = posts
    self.likes = likes
    self.currentUserID = currentUserID
  }
  
  func post(with postID: GenericIdentifier<PostProtocol>) -> PostProtocol? {
    guard isPostExist(postID) else { return nil }
    
    return fillPostData(for: postID)
  }
  
  func findPosts(by authorID: GenericIdentifier<UserProtocol>) -> [PostProtocol] {
    guard posts.contains(where: { $0.author == authorID }) else { return [PostProtocol]() }
    
    let allUserPost = post
    var postsArray = [PostProtocol]()
    
    for post in posts where post.author == authorID {
      guard let postID = allUserPost(post.id) else { break }
      postsArray.append(postID)
    }
    
    return postsArray
  }
  
  func findPosts(by searchString: String) -> [PostProtocol] {
    guard posts.contains(where: { $0.description == searchString }) else { return [PostProtocol]() }
    
    let foundPost = post
    var foundPosts = [PostProtocol]()
    
    for post in posts where post.description == searchString {
      guard let foundPostID = foundPost(post.id) else { break }
      foundPosts.append(foundPostID)
    }
    
    return foundPosts
  }
  
  func likePost(with postID: GenericIdentifier<PostProtocol>) -> Bool {
    guard posts.contains(where: { $0.id == postID }) else { return false }
    
    likes.append((currentUserID, postID))
    
    return true
  }
  
  func unlikePost(with postID: GenericIdentifier<PostProtocol>) -> Bool {
    guard isPostExist(postID) else { return false }
    
    for (index, like) in likes.enumerated() where like.0 == currentUserID && like.1 == postID {
      likes.remove(at: index)
    }
    
    return true
  }
  
  func usersLikedPost(with postID: GenericIdentifier<PostProtocol>) -> [GenericIdentifier<UserProtocol>]? {
    guard isPostExist(postID) else { return nil }
    
    var usersLike = [GenericIdentifier<UserProtocol>]()
  
    for like in likes where like.1 == postID {
      usersLike.append(like.0)
    }
    
    return usersLike
  }
}
