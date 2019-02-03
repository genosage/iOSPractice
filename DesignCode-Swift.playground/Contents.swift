import UIKit

var str = "Hello, playground"

let myName = "ZhangTian"
var myAge = 24

var numbers = [4, 3, 2, 1]
numbers[0]
numbers.append(0)
numbers.remove(at: 0)
numbers

if myAge > 30
{
    print("old")
}
else
{
    print("young")
}

for number in numbers
{
    print("number is \(number)")
}

func multiplyTwo(number: Int) -> Int
{
    return number * 2
}

multiplyTwo(number: 320)

// MARK: Class

struct UserStruct
{
    var name: String
    var age: Int
    var gender: String
}

var user = UserStruct(name: "ZT", age: 24, gender: "male")

class UserClass
{
    var name: String
    var age: Int
    var gender: String
    
    init(name: String, age: Int, gender: String)
    {
        self.name = name
        self.age = age
        self.gender = gender
    }
}

var userA = UserClass(name: "Joshua", age: 24, gender: "male")


var answer: String?

var answerString: String!

UILabel().text = answer ?? ""




