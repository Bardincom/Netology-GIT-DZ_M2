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
  /// Данный метод помогает избежать излишнего повторения и нагромождения однотипного кода
  /// - Parameter userID: ID пользователя которого нужно вернуть
  /// - Returns: Пользователя поддерживающего UserProtocol.
  /// Eсли переданный userID совпадает с Текущим пользователем исключается подписка на самого себя
  func fillUserData(for userID: GenericIdentifier<UserProtocol>) -> UserProtocol {
    var returnUser = User(id: "",
                    username: "",
                    fullName: "",
                    currentUserFollowsThisUser: .init(),
                    currentUserIsFollowedByThisUser: .init(),
                    followsCount: .init(),
                    followedByCount: .init())
    
    for user in users where user.id == userID {
      returnUser.id = user.id
      returnUser.username = user.username
      returnUser.followsCount = followers.filter{ $0.0 == userID }.count
      returnUser.followedByCount = followers.filter{ $0.1 == userID }.count
      
      if userID == currentUserID {
        returnUser.currentUserFollowsThisUser = false
        returnUser.currentUserIsFollowedByThisUser = false
      } else {
        returnUser.currentUserFollowsThisUser = followers.contains(where: { $0.0 == userID})
        returnUser.currentUserIsFollowedByThisUser = followers.contains(where: { $0.1 == userID })
      }
    }
    return returnUser
  }
}
