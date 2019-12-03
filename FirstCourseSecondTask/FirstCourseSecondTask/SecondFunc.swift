//
//  SecondFunc.swift
//  FirstCourseSecondTask
//
//  Created by Aleksey Bardin on 02.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker

/// Передайте в этот метод функцию, преобразующую массив окружностей по следующему алгоритму:
  /// белые окружности должны быть первыми
  /// радиус черных должен быть увеличен в 2 раза
  /// красные нужно убрать из результата
  /// зеленые перекрасить в синие
  /// затем разместить синие в конце массива
  /// Если не указано иное, то порядок окружностей должен сохраняться.
  /// Если ваше решение окажется правильным то в консоли вы увидите еще одну часть кодового слова.

/// Перечисление, представляющее один из пяти цветов
public enum Color {

    case white

    case black

    case red

    case green

    case blue
}

/// Структура, описывающая окружность
public struct Circle {

    public var radius: Double

    public var color: FirstCourseSecondTaskChecker.Checker.Color
}



func convertArray (of circles: [Checker.Circle]) -> [Checker.Circle] {
  var newArra: [Checker.Circle] = []
  let whiteArray = circles.filter { $0.color == .white }
  var blackArray = circles.filter { $0.color == .black }
  var greenArray = circles.filter{ $0.color == .green }
  var blueArray = circles.filter{ $0.color == .blue}
  
  

  for (index, item) in blackArray.enumerated() {
    blackArray[index].radius = item.radius * 2
  }
  
  for (index, _) in greenArray.enumerated() {
    greenArray[index].color = .blue
  }
  
  blueArray.append(contentsOf: greenArray)
  
  newArra.append(contentsOf: whiteArray)
  newArra.append(contentsOf: blackArray)
  newArra.append(contentsOf: blueArray)

  

  print("Исходный массив: ---------------------- \(circles.count)")
  for (index, value) in circles.enumerated() {
    print(index, value.color, value.radius)
  }
  print("---------------------- \(newArra.count)")
  for (index, item) in newArra.enumerated() {
    print(index, item.color, item.radius)
  }
  return newArra
}



