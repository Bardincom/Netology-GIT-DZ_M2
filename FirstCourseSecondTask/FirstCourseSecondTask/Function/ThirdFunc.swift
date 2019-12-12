//
//  ThirdFunc.swift
//  FirstCourseSecondTask
//
//  Created by Aleksey Bardin on 03.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


func convert (arrayDictionaries: [Checker.EmployeeData]) -> [Checker.Employee] {
  
/// массив в который будут передаваться обработанные данные
  var  employee: [Checker.Employee] = []
  
/// обходим массив словарей
  for dictionary in arrayDictionaries {

/// проверка на количество элементов в масси
    guard dictionary.count == 3 else { continue }
    
/// проверяем соответствие клчючей
    guard
      let fullName = dictionary["fullName"],
      let salary = dictionary["salary"],
      let company = dictionary["company"]
    else { continue }

/// записываем в новый массив значения по ключам
    employee.append(.init(fullName: fullName,
                          salary: salary,
                          company: company))
  }
  
  return employee
}
