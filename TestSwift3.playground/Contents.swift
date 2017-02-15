//: Playground - noun: a place where people can play

import UIKit
import Foundation

//var str = "Hello, playground"
//print(str)
//
//let str1 = "Swift"
//let num = 3
//let current = str + String(num)
//
//let str2 = "Swift\(num)"
//
//var arr = [1,2,3]
//arr.count
//var dic = [1:"1", 2:"2"]
//dic[2]
//
//var emptyArr = [Int]()
//var emptyDic = [Int:String]()
//
//let boolArr = [true, false, true]
//var count = 0
//for bool in boolArr {
//    if bool {
//        count += 1
//    } else {
//        count -= 1
//    }
//}
//print(count)
//
//var opStr:String? = "optional"
//print(opStr)
//
//var n = 2
//repeat {
//    n = n*2
//} while n < 100
//print(n)
//
//func test(_ num: Int, _ str: String) -> String {
//    return "\(num),\(str)"
//}
////test(num: 10, str: "times")
//test(20, "times")
//
//let tuple = (1, "str", true)
//tuple.2
//
//func multiVar(numbers : Int...) -> Void {
//    for num in numbers {
//        print(num)
//    }
//}
//multiVar(numbers: 1,2,3,4,5)
//
//var numbers = [1,2,3,2,4]
//numbers.map({
//    (number: Int) -> Int in
//    let result = 3 * number
//    return result
//})
//
//numbers.sorted()
//
//class TestClass {
//    var classVar: Int
//    init (classVar: Int){
//        self.classVar = classVar
//    }
//    func classFunc() -> Void {
//        print("var is \(classVar)")
//    }
//}
//
//var testClass = TestClass(classVar: 10)
//testClass.classFunc()
//
//enum Rank: Int {
//    case Ace = 1
//    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
//    case Jack, Queen, King
//    func simpleDescription() -> String {
//        switch self {
//        case .Ace:
//            return "ace"
//        case .Jack:
//            return "jack"
//        case .Queen:
//            return "queen"
//        case .King:
//            return "king"
//        default:
//            return String(self.rawValue)
//        }
//    }
//}
//let ace = Rank.Two
//let aceRawValue = ace.rawValue
//
//var testArr: [Int] = [1,2,3,4]
//testArr[2...3] = [7,8,9]
//testArr.append(3)
//testArr += [4]
//
//let index = testArr.endIndex
//testArr[testArr.index(before: index)]
//
//var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//
//var namesOfIntegers = [Int: String]()
//namesOfIntegers[1] = "Hello"
//
//let sortedArr = [2,1,3,4].sorted(by: { (i1: Int, i2: Int) -> Bool in
//    i1 < i2
//})
//
//
//extension Int {
//    mutating func square() {
//        self = self * self
//    }
//}
//
//var someInt = 3
////someInt.square()
//
//numbers.count
////numbers.remove(at: 0)
////numbers.removeFirst()
//numbers.insert(1, at: 4)
//numbers

var singleArr = [1]
let first = singleArr.removeFirst()
singleArr


func bubbleSort<T: Comparable>(array: inout[T]) -> [T]{
    for i in 0..<array.count - 1 {
        for j in 0..<array.count - 1 - i {
            if array[j] > array[j + 1] {
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
            }
        }
    }
    return array
}

var arr = [7,3,5,8,8,2]
bubbleSort(array: &arr)


func quickSort<T: Comparable>(array: [T]) -> [T] {
    guard array.count > 0 else {
        return array
    }
    
    // 支点
    let pivot = array[array.count / 2]
    
    // 小于、等于、大于支点
    let less = array.filter{ $0 < pivot }
    let equal = array.filter{ $0 == pivot }
    let greater = array.filter{ $0 > pivot }
    
    // 递归并且拼接，加号是 swift 当中拼接数组的方法
    return quickSort(array: less) + equal + quickSort(array: greater)
}

quickSort(array: arr)

var empty = Int()
empty += 2
