//
//  SecondFunc.swift
//  FirstCourseSecondTask
//
//  Created by Aleksey Bardin on 02.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


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



func convertArrayOfShapes (of circles: [Checker.Circle]) -> [Checker.Circle] {
/// сводный массив в который будет попадать все отобранные
  var resultingArray: [Checker.Circle] = []
/// промежуточный массивы по цветам
  var whiteArray: [Checker.Circle] = []
  var blackArray: [Checker.Circle] = []
  var blueArray: [Checker.Circle] = []
  
/// сортировка по промужуточным массивам
  for figure in circles {
    switch figure.color {
      case .white:
        whiteArray.append(figure)
      case .black:
        blackArray.append(figure)
      case .green:
        blueArray.append(figure)
      case .blue:
        blueArray.append(figure)
      case .red:
        break
    }
  }

/// изменение радиуса черных окружностей
  for (index, _) in blackArray.enumerated() {
    blackArray[index].radius *= 2
  }
  
/// изменение цвета зеленых фигур
  for (index, _) in blueArray.enumerated() {
    blueArray[index].color = .blue
  }
  
/// добавление промежуточных массивов в результирующий
  resultingArray.append(contentsOf: whiteArray)
  resultingArray.append(contentsOf: blackArray)
  resultingArray.append(contentsOf: blueArray)

  return resultingArray
}



