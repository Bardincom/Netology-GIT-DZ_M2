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
  
  //  var post: Post
  
  var posts: [PostInitialData]
  var likes: [(GenericIdentifier<UserProtocol>, GenericIdentifier<PostProtocol>)]
  var currentUserID: GenericIdentifier<UserProtocol>
  
  var count: Int { posts.count }
  
  required init(posts: [PostInitialData],
                /// (id пользователя поставившего лайк, ID - публикации где стоит лайк)
    likes: [(GenericIdentifier<UserProtocol>, GenericIdentifier<PostProtocol>)],
    currentUserID: GenericIdentifier<UserProtocol>) {
    
    self.posts = posts
    self.likes = likes
    self.currentUserID = currentUserID
    
  }
  //
  //  init() {
  //    self.post = self
  //  }
  
  //  MARK: Method - Post
  /// Возвращает публикацию с переданным ID.
  ///
  /// - Parameter postID: ID публикации которую нужно вернуть.
  /// - Returns: Публикация если она была найдена.
  /// (id пользователя поставившего лайк - like.0, ID - публикации где стоит лайк - like.1)
  
  func post(with postID: GenericIdentifier<PostProtocol>) -> PostProtocol? {
    //   проверка содержит ли хранилище Публикацию
    guard posts.contains(where: { (post) -> Bool in
      post.id == postID
    }) else {
      return nil
    }
    
    var postUser = Post(id: "",
                        author: "",
                        description: "",
                        currentUserLikesThisPost: .init(),
                        likedByCount: .init())
    
    for post in posts where post.id == postID {
      postUser.id = post.id
      postUser.author = post.author
      postUser.description = post.description
      postUser.likedByCount = likes.filter{$0.1 == postID}.count
    }
    
    for like in likes {
      if like.0 == currentUserID, like.1 == postID {
        postUser.currentUserLikesThisPost = true
      }
    }
    
    return postUser
  }
  
  // MARK: Method - Find Posts
  
  func findPosts(by authorID: GenericIdentifier<UserProtocol>) -> [PostProtocol] {
    
    
    guard posts.contains(where: { (post) -> Bool in
      post.author == authorID
    }) else {
      return [Post]()
    }
    
    var postInArray = Post(id: "",
                           author: "",
                           description: "",
                           currentUserLikesThisPost: .init(),
                           likedByCount: .init())
    
    var postsArray = [Post]()
    
    for post in posts where post.author == authorID {
      postInArray.id = post.id
      postInArray.author = post.author
      postInArray.description = post.description
      
      postsArray.append(postInArray)
    }
    
//    print(postsArray)
    return postsArray
  }
  
  //  MARK: Method - Find Posts
  func findPosts(by searchString: String) -> [PostProtocol] {
    guard posts.contains(where: { (post) -> Bool in
      post.description == searchString
    }) else {
      return [Post]()
    }
    
    var postInFind = Post (id: "",
                           author: "",
                           description: "",
                           currentUserLikesThisPost: .init(),
                           likedByCount: .init())
    
    for post in posts where post.description == searchString {
      postInFind.id = post.id
    }
    
    return [postInFind]
  }
  
  //  MARK: - Method - Like Post
  
  func likePost(with postID: GenericIdentifier<PostProtocol>) -> Bool {
    guard posts.contains(where: { (post) -> Bool in
      post.id == postID
    }) else {
      return false
    }
    likes.append((currentUserID, postID))
    
    return true
  }
  //  MARK: - Method - Unlike Post
  
  func unlikePost(with postID: GenericIdentifier<PostProtocol>) -> Bool {
    guard posts.contains(where: { (post) -> Bool in
      post.id == postID
    }) else {
      return false
    }
    
    for (index, like) in likes.enumerated() where like.0 == currentUserID && like.1 == postID {
      likes.remove(at: index)
    }
    
  
    return true
  }
  
  func usersLikedPost(with postID: GenericIdentifier<PostProtocol>) -> [GenericIdentifier<UserProtocol>]? {
    guard posts.contains(where: { (post) -> Bool in
      post.id == postID
    }) else {
      return nil
    }
    
    var arrayUserID = [GenericIdentifier<UserProtocol>]()
    
    var post = Post(id: "",
                    author: "",
                    description: "",
                    currentUserLikesThisPost: .init(),
                    likedByCount: .init())
    
    for like in likes where like.1 == postID {
      post.author = like.0
      arrayUserID.append(post.author)
    }
    
    return arrayUserID
  }
  
}
