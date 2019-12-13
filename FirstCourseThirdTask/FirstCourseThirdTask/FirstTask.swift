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

class StackArray: ArrayInitializableStorage {
  override var count: Int {
    return array.count
  }

  var array: [Int]
  
  override func push(_ element: Int) {
    array.append(element)
  }
  
  override func pop() -> Int {
    return array.removeLast()
  }
  
/// инициализация хранилища
  required init(array: [Int]) {
    self.array = array
    super.init(array: array)
  }
  
/// инициализация пустого массива
  required init() {
    self.array = []
    super.init()
  }
  

  
}

let stack = StackArray()


class QueueArray: ArrayInitializableStorage {
  override var count: Int {
    return array.count
  }
  var  array: [Int]
  
  override func push(_ element: Int) {
    array.append(element)
  }
  
  override func pop() -> Int {
    return array.removeFirst()
  }
  
  
  required init(array: [Int]) {
    self.array = array
    super.init(array: array)
  }
  
  required init() {
    self.array = []
    super.init()
  }
  
}

let queue = QueueArray()

