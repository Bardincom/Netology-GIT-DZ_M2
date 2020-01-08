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
    
    self.users = users
    self.followers = followers
    
    //    проверка содержит ли массив текущего пользователя
    guard users.contains(where: { $0.id == currentUserID }) else { return nil}
    
    self.currentUserID = currentUserID
  }
  
  // MARK: Method: CurrentUser
  
  func currentUser() -> UserProtocol {
    return fillUserData(for: currentUserID)
  }
  
  // MARK: Method: User by ID
  
  func user(with userID: GenericIdentifier<UserProtocol>) -> UserProtocol? {
    // проверка на наличие входящего ID в массиве пользователей
    guard users.contains(where: { $0.id == userID }) else { return nil }
    
    return fillUserData(for: userID)
  }
  
  //  MARK: Method - FindUsers
  
  func findUsers(by searchString: String) -> [UserProtocol] {
    
    guard users.contains(where: { $0.username == searchString }) else { return [User]() }
    
    /// найденный пользователь
    var foundUser = User(id: "",
                         username: "",
                         fullName: "",
                         currentUserFollowsThisUser: .init(),
                         currentUserIsFollowedByThisUser: .init(),
                         followsCount: .init(),
                         followedByCount: .init())
    
    for user in users where user.username == searchString {
      foundUser.id = user.id
      foundUser.fullName = user.fullName
      foundUser.username = user.username
    }
    
    return [foundUser]
  }
  
  // MARK: Method - Follow
  
  func follow(_ userIDToFollow: GenericIdentifier<UserProtocol>) -> Bool {
    //    проверка наличия переденного ID
    guard users.contains(where: { $0.id == userIDToFollow }) else {
      return false
    }
    // добавление нового подписчика для Текущего пользователя
    followers.append((currentUserID, userIDToFollow))
    
    return true
  }
  
  // MARK: Method - Unfollow
  
  func unfollow(_ userIDToUnfollow: GenericIdentifier<UserProtocol>) -> Bool {
    //    проверка наличия переденного ID
    guard users.contains(where: { $0.id == userIDToUnfollow }) else { return false }
    
    //    удаление Текущего пользователя из подписчиков
    for (index, follower) in followers.enumerated() where follower.0 == currentUserID {
      followers.remove(at: index)
    }
    
    return true
  }
  
  // MARK: Method - Users Following User
  
  func usersFollowingUser(with userID: GenericIdentifier<UserProtocol>) -> [UserProtocol]? {
    guard users.contains(where: { $0.id == userID }) else { return nil }
    
    var followerUser = User(id: "",
                            username: "",
                            fullName: "",
                            currentUserFollowsThisUser: .init(),
                            currentUserIsFollowedByThisUser: .init(),
                            followsCount: .init(),
                            followedByCount: .init())
    
    /// массив подписчиков пользователя
    var arrayFollowerUser = [User]()
    
    // возвращает всех подписчиков пользователя с переданным ID
    for follower in followers where follower.1 == userID {
      followerUser.id = follower.0
      // пользователи записываютсяв массив
      arrayFollowerUser.append(followerUser)
    }
    
    return arrayFollowerUser
  }
  
  
  // MARK: Method - Users Followed By User
  
  func usersFollowedByUser(with userID: GenericIdentifier<UserProtocol>) -> [UserProtocol]? {
    guard users.contains(where: { $0.id == userID }) else { return nil }
    
    var followedUser = User(id: "",
                            username: "",
                            fullName: "",
                            currentUserFollowsThisUser: .init(),
                            currentUserIsFollowedByThisUser: .init(),
                            followsCount: .init(),
                            followedByCount: .init())
    
    //  все подписки пользователя
    var arrayFollowedByUser = [User]()
    
    for follower in followers where follower.0 == userID {
      followedUser.id = follower.1
      // пользователи записываютсяв массив
      arrayFollowedByUser.append(followedUser)
    }
    
    return arrayFollowedByUser
  }
}


