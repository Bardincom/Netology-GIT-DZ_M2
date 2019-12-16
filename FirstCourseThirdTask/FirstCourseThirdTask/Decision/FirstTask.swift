//
//  FirstTask.swift
//  FirstCourseThirdTask
//
//  Created by Aleksey Bardin on 13.12.2019.
//  Copyright © 2019 E-Legion. All rights reserved.
//

import Foundation
import FirstCourseThirdTaskChecker

/// Вам необходимо создать два сабкласса ArrayInitializableStorage. Один из них должен
/// реализовать стек(LIFO), а второй - очередь(FIFO). Список методов и их требования
/// смотрите в комментариях к классу ArrayInitializableStorage и AbstractStorage.
/// Для проверки передайте экземпляры этих классов в метод. Если ваше решение окажется
/// правильным, то в консоли вы увидите часть кодового слова.

/// Подкласс реализующий Стек
class StackArray: ArrayInitializableStorage {
  
  override var count: Int {
    return arrayStorage.count
  }

  var arrayStorage: [Int]
  
  override func push(_ element: Int) {
    arrayStorage.append(element)
  }
  
  override func pop() -> Int {
    return arrayStorage.removeLast()
  }
  
/// инициализация хранилища
  required init(array: [Int]) {
    self.arrayStorage = array
    super.init(array: array)
  }
  
/// инициализация пустого массива
  required init() {
    self.arrayStorage = []
    super.init()
  }
  
}

let stack = StackArray()

/// Подкласс реализующий Очередь
class QueueArray: ArrayInitializableStorage {
  
  override var count: Int {
    return arrayStorage.count
  }
  
  var  arrayStorage: [Int]
  
  override func push(_ element: Int) {
    arrayStorage.append(element)
  }
  
  override func pop() -> Int {
    return arrayStorage.removeFirst()
  }
  
  required init(array: [Int]) {
    self.arrayStorage = array
    super.init(array: array)
  }
  
  required init() {
    self.arrayStorage = []
    super.init()
  }
  
}

let queue = QueueArray()

