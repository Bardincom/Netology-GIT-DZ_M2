//
//  SecondTask.swift
//  FirstCourseThirdTask
//
//  Created by Aleksey Bardin on 13.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseThirdTaskChecker

/// Вам необходимо создать две структуры. Одна из них должна реализовать стек(LIFO), а
/// вторая - очередь(FIFO). Они должны поддерживать протоколы StorageProtocol и
/// ArrayInitializable. Список методов и их требования смотрите в комментариях к ним.
/// Для проверки передайте экземпляры этих структур в метод. Если ваше решение окажется
/// правильным, то в консоли вы увидите часть кодового слова.

/// Структура реализующая  Стек
struct StackStruct: ArrayInitializable, StorageProtocol {
  
  var arrayStorage: [Int]
  
  var count: Int {
    return arrayStorage.count
  }
  
  mutating func push(_ element: Int) {
    arrayStorage.append(element)
  }
  
  mutating func pop() -> Int {
    return arrayStorage.removeLast()
  }
  
  init(array: [Int]) {
    arrayStorage = array
  }
  
  init() {
    arrayStorage = []
  }
  
}

let stackStruct = StackStruct()

/// Структура реализующая Очередь
struct QueueStruct: ArrayInitializable, StorageProtocol {
  
  var arrayStorege: [Int]
  
  var count: Int {
    return arrayStorege.count
  }
  
  mutating func push(_ element: Int) {
    arrayStorege.append(element)
  }
  
  mutating func pop() -> Int {
    return arrayStorege.removeFirst()
  }
  
  init(array: [Int]) {
    arrayStorege = array
  }
  
  init() {
    arrayStorege = []
  }
  
}

let queueStruct = QueueStruct()

