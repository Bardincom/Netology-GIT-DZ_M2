//
//  ThirdTask.swift
//  FirstCourseThirdTask
//
//  Created by Aleksey Bardin on 14.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseThirdTaskChecker

/// Ваша задача добавить в класс User поддержку протоколов JSONSerializable и JSONInitializable.
/// Требования к ним смотрите в комментариях. Обратите внимание, что проверять данные на
/// корректность не нужно. Checker всегда будет передавать правильный JSON. Для проверки
/// передайте в метод тип User. Если ваше решение окажется правильным, то в консоли вы увидите
/// часть кодового слова. Внимание! Это задание нельзя решать с помощью протокола Codable.
/// Формат и порядок данных в строке нужно соблюсти строго.

/// Расширение класса конвертирующее данные в формат JSON
extension User: JSONSerializable {
  
  public func toJSON() -> String {
    return "{\"fullName\": \"\(fullName)\", \"email\": \"\(email)\"}"
  }
  
}

/// Расширение класса создающее из входящего JSON свойства класса User
extension User: JSONInitializable {
  
  public convenience init(JSON: String) {
    self.init()
    
    guard
      let dictionary = JSON.convertToDictionary(),
      let fullName = dictionary["fullName"],
      let email = dictionary["email"]
    else { return }
    
      self.fullName = fullName
      self.email = email
  }
}

/// Расширение для String - помогает перевести входящую строку JSON в словарь
extension String {
  
  func convertToDictionary() -> [String: String]? {
    
         if let data = self.data(using: .utf8) {
             do {
               return try JSONSerialization.jsonObject(with: data, options: []) as? [String : String]
             } catch {
                 print(error.localizedDescription)
             }
         }
    
       return nil
     }
}
