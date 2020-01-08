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
  
  private var users: [UserInitialData]
  
  private var followers: [(GenericIdentifier<UserProtocol>, GenericIdentifier<UserProtocol>)]
  
  private var currentUserID: GenericIdentifier<UserProtocol>
  
  var count: Int { users.count }
  
  //  MARK: Initialization
  
  required init?(users: [UserInitialData],
                 followers: [(GenericIdentifier<UserProtocol>, GenericIdentifier<UserProtocol>)],
                 currentUserID: GenericIdentifier<UserProtocol>) {
    
    self.users = users
    self.followers = followers
    
    //    проверка содержит ли массив текущего пользователя
    guard users.contains(where: { (user) -> Bool in
      user.id == currentUserID
    }) else {
      return nil
    }
    self.currentUserID = currentUserID
  }
  
  // MARK: Method: CurrentUser
  
  func currentUser() -> UserProtocol {
    
    var currentUser = User(id: "",
                           username: "",
                           fullName: "",
                           avatarURL: nil,
                           currentUserFollowsThisUser: false,
                           currentUserIsFollowedByThisUser: false,
                           followsCount: 0,
                           followedByCount: 0)
    
    // TODO: переделать на forEach - ПОВТОРЯЮЩИЙСЯ КОД № 1
    for user in users where user.id == currentUserID {
      currentUser.id = user.id
      currentUser.username = user.username
    }
    
    // TODO: переделать на forEach - Повторяющийся код №2
    for follower in followers {
      
      if follower.0 == currentUserID {
        currentUser.followsCount += 1
      } else if follower.1 == currentUserID {
        currentUser.followedByCount += 1
      }
    }
    
    return currentUser
  }
  
  // MARK: Method: User by ID
  
  func user(with userID: GenericIdentifier<UserProtocol>) -> UserProtocol? {
    
    ///   опциональная переменная равная входящему ID
    let userIDReal: GenericIdentifier<UserProtocol>? = userID
    
    // проверка на наличие входящего ID в массиве пользователей
    //    TODO: переделать на guard
    
    guard users.contains(where: { (user) -> Bool in
      user.id == userIDReal
    }) else {
      return nil
    }
    
    //  извлекается опциональное значение из userIDReal или возвращаем nil
    guard let userID = userIDReal else { return nil }
    // TODO: возможно стоит сделать typealias для User
    
    var user = User(id: "",
                    username: "",
                    fullName: "",
                    avatarURL: nil,
                    currentUserFollowsThisUser: false,
                    currentUserIsFollowedByThisUser: false,
                    followsCount: 0,
                    followedByCount: 0)
    
    // ПОВТОРЯЮЩИЙСЯ КОД №1
    for userInArray in users where userInArray.id == userID {
      user.id = userInArray.id
      user.username = userInArray.username
    }
    
    // TODO: переделать на forEach - Повторяющийся код №2
    for follower in followers {
      
      if follower.0 == userID {
        user.followsCount += 1
        user.currentUserFollowsThisUser = true
      } else if follower.1 == userID {
        user.followedByCount += 1
        user.currentUserIsFollowedByThisUser = true
      }
    }
    
    return user
  }
  
  //  MARK: Method - FindUsers
  
  func findUsers(by searchString: String) -> [UserProtocol] {
    
    guard users.contains(where: { (user) -> Bool in
      user.username == searchString
    }) else {
      return [User]()
    }
    
    /// найденный пользователь
    var foundUser = User(id: "",
                         username: "",
                         fullName: "",
                         avatarURL: nil,
                         currentUserFollowsThisUser: false,
                         currentUserIsFollowedByThisUser: false,
                         followsCount: 0,
                         followedByCount: 0)
    
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
    guard users.contains(where: { (user) -> Bool in
      user.id == userIDToFollow
    }) else {
      return false
    }
    // добавление нового подписчика для Текущего пользователя
    followers.append((currentUserID, userIDToFollow))
    
    return true
  }
  
  // MARK: Method - Unfollow
  
  func unfollow(_ userIDToUnfollow: GenericIdentifier<UserProtocol>) -> Bool {
    //    проверка наличия переденного ID
    guard users.contains(where: { (user) -> Bool in
      user.id == userIDToUnfollow
    }) else {
      return false
    }
    
    //    удаление Текущего пользователя из подписчиков
    for (index, follower) in followers.enumerated() where follower.0 == currentUserID {
      followers.remove(at: index)
    }
    
    return true
  }
  
  // MARK: Method - Users Following User
  
  func usersFollowingUser(with userID: GenericIdentifier<UserProtocol>) -> [UserProtocol]? {
    guard users.contains(where: { (user) -> Bool in
      user.id == userID
    }) else {
      return nil
    }
    
    var followerUser = User(id: "",
                            username: "",
                            fullName: "",
                            avatarURL: nil,
                            currentUserFollowsThisUser: false,
                            currentUserIsFollowedByThisUser: false,
                            followsCount: 0,
                            followedByCount: 0)
    
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
    guard users.contains(where: { (user) -> Bool in
      user.id == userID
    }) else {
      return nil
    }
    
    var followedUser = User(id: "",
                            username: "",
                            fullName: "",
                            avatarURL: nil,
                            currentUserFollowsThisUser: false,
                            currentUserIsFollowedByThisUser: false,
                            followsCount: 0,
                            followedByCount: 0)
    
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

