//
//  FourthFunc.swift
//  FirstCourseSecondTask
//
//  Created by Aleksey Bardin on 04.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


///Передайте в этот метод функцию, принимающую массив имен и преобразующую его по алгоритму:
///func checkFourthFunction(function: ([String]) -> [String : [String]])
///Группирует имена в словарь, где ключем будет первая буква имен в виде String, а значением - массив имен начинающихся с этой буквы.
///Например: [“Вася”, “Олег”, “Вова”] -> [“В” : [“Вася”, “Вова”], “О” : [“Олег”]]
///Убирает группы в которых меньше двух элементов.
///Сортирует элементы в каждой группе в обратном алфавитному порядке.


func convertArrayToDictionary(name: [String]) -> [String: [String]] {
  
/// сортирую каждый элемент массива в обратном алфавитному порядку
  let sortetNameList = name.sorted(by: {$0 > $1})
  
/// группирую имена в словарь, где ключем будет первая буква имен в виде String, а значением - массив имен начинающихся с этой буквы.
  var dictionary = Dictionary(grouping: sortetNameList, by: { String($0.first!) })
  
/// убираю группы в которых меньше двух элементов.
  for (key, value) in dictionary {
    guard value.count == 1 else { continue }
      dictionary[key] = nil
  }
  
  return dictionary
}
