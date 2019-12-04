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
  var  employee: [Checker.Employee] = []
  
  for dictionary in arrayDictionaries {

    guard dictionary.count == 3 else { continue }

    guard
      let fullName = dictionary["fullName"],
      let salary = dictionary["salary"],
      let company = dictionary["company"]
    else { continue }

    employee.append(.init(fullName: fullName, salary: salary, company: company))
  }
  
  return employee
}

