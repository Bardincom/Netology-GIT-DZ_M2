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
  
  var post: PostProtocol?
  var posts: [PostInitialData]
  var likes: [(GenericIdentifier<UserProtocol>, GenericIdentifier<PostProtocol>)]
  var currentUserID: GenericIdentifier<UserProtocol>
  
  var count: Int { posts.count }
  
  required init(posts: [PostInitialData],
                likes: [(GenericIdentifier<UserProtocol>, GenericIdentifier<PostProtocol>)],
                currentUserID: GenericIdentifier<UserProtocol>) {
    
    self.posts = posts
    self.likes = likes
    self.currentUserID = currentUserID
    
  }
  
  func post(with postID: GenericIdentifier<PostProtocol>) -> PostProtocol? {
    guard posts.contains(where: { (post) -> Bool in
      post.id == postID
    }) else {
      return nil
    }
//    print(posts)
    
//    var post = Post(id: "",
//                    author: "",
//                    description: "",
//                    imageURL: nil,
//                    createdTime: <#T##Date#>,
//                    currentUserLikesThisPost: <#T##Bool#>,
//                    likedByCount: <#T##Int#>)
//    
    
    return post
  }
  
  func findPosts(by authorID: GenericIdentifier<UserProtocol>) -> [PostProtocol] {
    return [post!]
  }
  
  func findPosts(by searchString: String) -> [PostProtocol] {
    return [post!]
  }
  
  func likePost(with postID: GenericIdentifier<PostProtocol>) -> Bool {
    return true
  }
  
  func unlikePost(with postID: GenericIdentifier<PostProtocol>) -> Bool {
    return true
  }
  
  func usersLikedPost(with postID: GenericIdentifier<PostProtocol>) -> [GenericIdentifier<UserProtocol>]? {
    return [currentUserID]
  }
  
}
