//
//  UsersStorage.swift
//  FirstCourseFinalTask
//
//  Created by Aleksey Bardin on 29.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseFinalTaskChecker

class UserStorage: UsersStorageProtocol {
  
  var users: [UserInitialData]
  var followers: [(GenericIdentifier<UserProtocol>, GenericIdentifier<UserProtocol>)]
  var currentUserID: GenericIdentifier<UserProtocol>
  var count: Int { users.count }
  
  //  MARK: Initialization
  
  required init?(users: [UserInitialData],
                 followers: [(GenericIdentifier<UserProtocol>, GenericIdentifier<UserProtocol>)],
                 currentUserID: GenericIdentifier<UserProtocol>) {
    
    guard users.contains(where: { $0.id == currentUserID }) else { return nil}

    self.users = users
    self.followers = followers
    self.currentUserID = currentUserID
  }
  
  func currentUser() -> UserProtocol {
    return fillUserData(for: currentUserID)
  }
  
  func user(with userID: GenericIdentifier<UserProtocol>) -> UserProtocol? {
    guard isUserExist(userID) else { return nil }
    return fillUserData(for: userID)
  }
  
  func findUsers(by searchString: String) -> [UserProtocol] {
    guard users.contains(where: { $0.username == searchString }) else { return [UserProtocol]() }
    
    let foundUser = user
    var foundUsers = [UserProtocol]()
    
    for user in users where user.username == searchString {
      guard let foundUserID = foundUser(user.id) else { break }
      foundUsers.append(foundUserID)
    }
    
    return foundUsers
  }
  
  func follow(_ userIDToFollow: GenericIdentifier<UserProtocol>) -> Bool {
    guard isUserExist(userIDToFollow) else { return false }
    
    followers.append((currentUserID, userIDToFollow))
    
    return true
  }
  
  func unfollow(_ userIDToUnfollow: GenericIdentifier<UserProtocol>) -> Bool {
    guard isUserExist(userIDToUnfollow) else { return false }
    
    for (index, follower) in followers.enumerated() where follower.0 == currentUserID {
      followers.remove(at: index)
    }
    
    return true
  }
  
  func usersFollowingUser(with userID: GenericIdentifier<UserProtocol>) -> [UserProtocol]? {
    guard isUserExist(userID) else { return nil }
    
    let followerUser = user
    var arrayFollowerUser = [UserProtocol]()
    
    for follower in followers where follower.1 == userID {
      guard let followerID = followerUser(follower.0) else { break }
      arrayFollowerUser.append(followerID)
    }
    
    return arrayFollowerUser
  }
  
  func usersFollowedByUser(with userID: GenericIdentifier<UserProtocol>) -> [UserProtocol]? {
     guard isUserExist(userID) else { return nil }
    
    let followedUser = user
    var arrayFollowedByUser = [UserProtocol]()
    
    for followed in followers where followed.0 == userID {
      guard let followedID  = followedUser(followed.1) else { break }
      arrayFollowedByUser.append(followedID)
    }
    
    return arrayFollowedByUser
  }
}


