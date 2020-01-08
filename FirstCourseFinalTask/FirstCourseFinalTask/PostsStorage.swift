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
  
  required init(posts: [PostInitialData],
                likes: [(GenericIdentifier<UserProtocol>, GenericIdentifier<PostProtocol>)],
                currentUserID: GenericIdentifier<UserProtocol>) {
    
    self.posts = posts
    self.likes = likes
    self.currentUserID = currentUserID
  }
  
  //  MARK: Method - Post
  
  func post(with postID: GenericIdentifier<PostProtocol>) -> PostProtocol? {
    //   проверка содержит ли хранилище Публикацию
    guard posts.contains(where: { $0.id == postID }) else { return nil }
    
    var post = Post(id: "",
                    author: "",
                    description: "",
                    currentUserLikesThisPost: .init(),
                    likedByCount: .init())
    
    for postInArray in posts where postInArray.id == postID {
      post.id = postInArray.id
      post.author = postInArray.author
      post.description = postInArray.description
      post.likedByCount = likes.filter{$0.1 == postID}.count
      post.currentUserLikesThisPost = likes.contains(where: { $0.0 == currentUserID && $0.1 == postID})
    }
    
    return post
  }
  
  // MARK: Method - Find Posts
  
  func findPosts(by authorID: GenericIdentifier<UserProtocol>) -> [PostProtocol] {
    
    guard posts.contains(where: { $0.author == authorID }) else { return [Post]() }
    
    /// все публикации пользователя
    var allUserPost = Post(id: "",
                           author: "",
                           description: "",
                           currentUserLikesThisPost: .init(),
                           likedByCount: .init())
    
    var postsArray = [Post]()
    
    for post in posts where post.author == authorID {
      allUserPost.id = post.id
      allUserPost.author = post.author
      allUserPost.description = post.description
      
      postsArray.append(allUserPost)
    }
    
    return postsArray
  }
  
  //  MARK: Method - Find Posts
  
  func findPosts(by searchString: String) -> [PostProtocol] {
    guard posts.contains(where: { $0.description == searchString }) else { return [Post]() }
    
    var foundPost = Post (id: "",
                          author: "",
                          description: "",
                          currentUserLikesThisPost: .init(),
                          likedByCount: .init())
    
    for post in posts where post.description == searchString {
      foundPost.id = post.id
    }
    
    return [foundPost]
  }
  
  //  MARK: - Method - Like Post
  
  func likePost(with postID: GenericIdentifier<PostProtocol>) -> Bool {
    guard posts.contains(where: { $0.id == postID }) else { return false }
    
    likes.append((currentUserID, postID))
    
    return true
  }
  
  //  MARK: - Method - Unlike Post
  
  func unlikePost(with postID: GenericIdentifier<PostProtocol>) -> Bool {
    guard posts.contains(where: { $0.id == postID }) else { return false }
    
    for (index, like) in likes.enumerated() where like.0 == currentUserID && like.1 == postID {
      likes.remove(at: index)
    }
    
    return true
  }
  
  //  MARK: Method - Users Liked Post
  
  func usersLikedPost(with postID: GenericIdentifier<PostProtocol>) -> [GenericIdentifier<UserProtocol>]? {
    guard posts.contains(where: { $0.id == postID }) else { return nil }
    
    ///    пользователи которые поставили лайк
    var usersLike = [GenericIdentifier<UserProtocol>]()
    
    var post = Post(id: "",
                    author: "",
                    description: "",
                    currentUserLikesThisPost: .init(),
                    likedByCount: .init())
    
    for like in likes where like.1 == postID {
      post.author = like.0
      usersLike.append(post.author)
    }
    
    return usersLike
  }
}
