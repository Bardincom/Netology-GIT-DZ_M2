//
//  main.swift
//  FirstCourseSecondTask
//
//  Copyright © 2017 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseSecondTaskChecker


let checker = Checker()


checker.checkFirstFunction(function: evenOddCount)
measureEfficiency {
  checker.checkFirstFunction(function: evenOddCount)
}

checker.checkSecondFunction(function: convertArrayOfShapes)

measureEfficiency {
  checker.checkSecondFunction(function: convertArrayOfShapes)
}

checker.checkThirdFunction(function: convert)

measureEfficiency {
  checker.checkThirdFunction(function: convert)
}


checker.checkFourthFunction(function: convertArrayToDictionary)

measureEfficiency {
  checker.checkFourthFunction(function: convertArrayToDictionary)
}
