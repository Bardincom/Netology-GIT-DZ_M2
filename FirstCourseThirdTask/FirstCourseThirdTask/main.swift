// Этот файл пуст не по ошибке. В этот раз вам необходимо самостоятельно импортировать необходимые модули и запустить проверку
import Foundation
import FirstCourseThirdTaskChecker

let checker = Checker()

checker.checkInheritance(stack: stack, queue: queue)

checker.checkProtocols(stack: stackStruct, queue: queueStruct)

checker.checkExtensions(userType: User.self)
