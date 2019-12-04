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

func returnTheNumberOfEvenOdd (in array: [Int]) -> (Int, Int) {
  return (array.filter {$0 % 2 == 0}.count, array.filter {$0 % 2 != 0}.count)
  
}
