//
//  Extension + UserStorage.swift
//  FirstCourseFinalTask
//
//  Created by Aleksey Bardin on 08.01.2020.
//  Copyright © 2020 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseFinalTaskChecker

extension UserStorage {
  /// Заполняет данными пользователя по ID
  ///
  /// - Parameter userID: ID пользователя которого нужно вернуть
  /// - Returns: Пользователя поддерживающего UserProtocol.
  /// Eсли переданный userID совпадает с Текущим пользователем исключается подписка на самого себя
  func fillUserData(for userID: GenericIdentifier<UserProtocol>) -> UserProtocol {
    
    var username = ""
    var fullName = ""
    var currentUserFollowsThisUser = false
    var currentUserIsFollowedByThisUser = false
    var followsCount = 0
    var followedByCount = 0
    
    for user in users where user.id == userID {
      username = user.username
      fullName = user.fullName
    }
    
    for (followerID, followerByID) in followers {
      if followerID == userID {
        followsCount += 1
      }
      
      if followerByID == userID {
        followedByCount += 1
      }
      
      if followerID == currentUserID && followerByID == userID  {
        currentUserFollowsThisUser = true
      }
      
      if followerID == userID && followerByID == currentUserID {
        currentUserIsFollowedByThisUser = true
      }
    }
    
    return User(id: userID,
                username: username,
                fullName: fullName,
                currentUserFollowsThisUser: currentUserFollowsThisUser,
                currentUserIsFollowedByThisUser: currentUserIsFollowedByThisUser,
                followsCount: followsCount,
                followedByCount: followedByCount)
  }
}

extension UserStorage {
  /// Проверяет наличие пользователя по ID
  ///
  /// - Parameter userID: ID пользователя которого нужно найти
  /// - Returns: False или True в зависимости от результата проверки.
  func isUserExist(_ userID: GenericIdentifier<UserProtocol>) -> Bool {
    guard users.contains(where: {$0.id == userID}) else { return false }
    return true
  }
}
