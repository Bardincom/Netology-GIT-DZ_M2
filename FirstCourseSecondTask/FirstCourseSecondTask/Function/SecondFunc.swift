//
//  SecondFunc.swift
//  FirstCourseSecondTask
//
//  Created by Aleksey Bardin on 02.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


func convertArrayOfShapes (of circles: [Checker.Circle]) -> [Checker.Circle] {
//
//  for item in circles {
//    print(item.color, item.radius)
//  }
//
///// сводный массив в который будет попадать все отобранные
//  var resultingArray: [Checker.Circle] = []
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
        /// изменение радиуса черных окружностей
        let blackCircle = Checker.Circle(radius: figure.radius * 2, color: .black)
        blackArray.append(blackCircle)
      case .green:
        /// изменение цвета зеленых фигур
        let greenCircle = Checker.Circle(radius: figure.radius, color: .blue)
        blueArray.append(greenCircle)
      case .blue:
        blueArray.append(figure)
      case .red:
        break
    }
  }


//  for (index, _) in blackArray.enumerated() {
//    blackArray[index].radius *= 2
//  }
  

//  for (index, _) in blueArray.enumerated() {
//    blueArray[index].color = .blue
//  }
  
///
//  resultingArray.append(contentsOf: whiteArray)
//  resultingArray.append(contentsOf: blackArray)
//  resultingArray.append(contentsOf: blueArray)
//
//  for item in circles {
//    print(item.color, item.radius)
//  }
  
  return whiteArray + blackArray + blueArray
}


