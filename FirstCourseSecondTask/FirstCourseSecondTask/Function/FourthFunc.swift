//
//  FourthFunc.swift
//  FirstCourseSecondTask
//
//  Created by Aleksey Bardin on 04.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


func convertArrayToDictionary(name: [String]) -> [String: [String]] {
  
/// сортирую каждый элемент массива в обратном алфавитному порядку
  let sortetNameList = name.sorted(by: > )
  
/// группирую имена в словарь, где ключем будет первая буква имен в виде String, а значением - массив имен начинающихся с этой буквы, используя фильтр сразу убираю группы в которых меньше двух элементов
  let dictionary = Dictionary(grouping: sortetNameList, by: { String($0.first!) }).filter { ($0.value.count > 1)}
  
  return dictionary
}
