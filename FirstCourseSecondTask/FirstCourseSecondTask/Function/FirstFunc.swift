//
//  FirstFunc.swift
//  FirstCourseSecondTask
//
//  Created by Aleksey Bardin on 02.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation

/// Решение первой задачи.
/// Использовал функцию filter и подсчет элеметнов массива count, фильтром я отобрал соответственно четные и нечетные значения и тут же их посчитал и положил в кортеж.
//Передайте в этот метод функцию, вычисляющую количество четных и нечетных чисел в массиве. На вход она должна принимать массив целых чисел, а возвращать кортеж из двух значений. Первое - количество четных чисел, второе - нечетных. Если ваше решение окажется правильным то в консоли вы увидите часть кодового слова.

func evenOddCount (in array: [Int]) -> (Int, Int) {
  
  var cortageArray: (even: [Int], odd: [Int]) = ([], [])
  
  array.forEach { value in
    guard value % 2 == 0 else {
      cortageArray.odd.append(value)
      return
    }
    cortageArray.even.append(value)
  }
  
  return (cortageArray.even.count, cortageArray.odd.count)
}

//    (array.filter { $0 % 2 == 0 }.count, array.filter { $0 % 2 != 0 }.count)


func measureEfficiency(method: () -> Void) {
  
  let start = CFAbsoluteTimeGetCurrent()
  method()
  let diff = CFAbsoluteTimeGetCurrent() - start
  print("Затрачено \(diff) секунд")
  
}


