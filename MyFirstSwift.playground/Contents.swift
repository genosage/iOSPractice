//: Playground - noun: a place where people can play

import UIKit
import Foundation
/*
var str = "Hello, playground"

println("Hello, Swift")

//let constant
//var variable

var x = 10,y = 8.00

//type safety

var websiteName:String
websiteName = "www.com"

var red,green,blue:Double

//Int Double(64/15) Float(32/6) String

let num_a:Float = 0.1415926
let num_b:Int = 3
let pi:Float = Float(num_b) + num_a

var 姓名:String = "张添"
姓名+" Hello"

let imtrue = true
let imfalse = false

if imfalse
{
    println("Testpass")
}
else if 2*2==4{
    println("Testfail")
}else{
    println("Never")
}

var a:Int = 1
if a {
    println("Test")
}*/

//Tuples
let registerResult = (true,404,"Account")

let (iftrue,num,id) = registerResult

iftrue
num
id

//println(registerResult.2)

//_ignore some value
let login:(Bool,String) = (true,"Account")
let (loginsuccess,_) = login

loginsuccess

//Optional
var aimoptional:Int?
aimoptional = 12

let userinput = "12"
var age = userinput.toInt()
if age != nil{
println("Your age is \(age)" + " "+String(age!))
}
age
age!

//Optional Binding

if let age1 = userinput.toInt(){
println("\(age1)")
}

var age2:Int! = 18
age2

Int.max - 1
Int.min

x
x++
x
++x

let Barheight = 20
let Viewheight = 548

var inFullScreenMode = true

var viewheight = Viewheight + (inFullScreenMode ? Barheight : 0)

var score = 9
var rate = score > 60 ? "及格" : "不及格"

var nil1:Int?
var nil2 = 2

nil1 ?? nil2

nil1 = 1

nil1 ?? nil2

var usernickname : String?
//usernickname = "zhangtian"
println("Hello \(usernickname)")
//println("Hello \(usernickname!)")

usernickname ?? "Guest"

//?? 判断加解包

for index in 1...10
{
    index
}

for index in 1..<10
{
    index
}

let teststring = ["one","two","three"]
for i in 0..<teststring.count
{
    teststring[i]
}

var str1 = "Hello Playground"
let str11 = "Im an immutable string"

//str1 = "hi"
str1 += " zt"

var emptystring = String()
emptystring.isEmpty
emptystring += "haha"
emptystring.isEmpty
for c in emptystring
{
    println(c)
    print(c)
}

var ch:Character = "A"
emptystring.append(ch)

count(emptystring)

var strr = "Hello ZT"
strr + "!"
strr
strr += "!"
strr

let str_a = "abc"
let str_b = "abc"
str_a == str_b
let str_c = "abcd"
str_a == str_c
str_a < str_c
let str_d = "bb"
str_a < str_d

//Prefix and Suffix
//.hasPrefix and .hasSuffix

let chapterName = [
    "yi ai",
    "yi ni",
    "yi bUUUUUNI",
    "er ce",
    "san se"
]

var count1 = 0
for name in chapterName{
    if name.hasPrefix("yi"){
        count1++
    }
    if name.hasSuffix("ni"){
        count1--
    }
}

count1


//Foundation

strr.capitalizedString
chapterName[2].capitalizedString
chapterName[2].uppercaseString
chapterName[2].lowercaseString
chapterName.count

//Foundation trim
strr = "      ! Hello  !!  ZT zt !!  "
strr.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
strr.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString : " !"))

//Foundation split
strr = " learn swift day by day"
strr.componentsSeparatedByString(" ")

strr = "learn swi!ft day by day"
strr.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: " !"))


//Foundation join
var str4 = "-"
str4.join(strr.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: " !")))
var strrindex = advance(strr.startIndex, 1)
strr.insert("A", atIndex : strrindex)

//substring
var s="1234567890"

let index11 = advance(s.startIndex, 5)
let index12 = advance(s.endIndex, -6);
var range = Range<String.Index>(start: index12,end: index11)

var s1:String=s.substringFromIndex(index11)
var s2:String=s.substringToIndex(index12)
var s3=s.substringWithRange(range)

println("\n"+s1)
println(s2)
println(s3)

/*extension String : CollectionType {
    struct Index : BidirectionalIndexType, Comparable, Reflectable {
        func successor() -> String.Index
        func predecessor() -> String.Index
        func getMirror() -> MirrorType
    }
    var startIndex: String.Index { get }
    var endIndex: String.Index { get }
    subscript (i: String.Index) -> Character { get }
    func generate() -> IndexingGenerator<String>
}*/

//range
strr = "Welcome to learn Swift, step by step day by day!"
strr.rangeOfString("Welcome")
strr.rangeOfString("step", options: NSStringCompareOptions.BackwardsSearch)
strr.rangeOfString("StEp",options: NSStringCompareOptions.CaseInsensitiveSearch)
strr.startIndex
strr.endIndex
let strrrange = Range<String.Index>(start: strr.startIndex, end: strr.endIndex)
let strrrange1 = Range<String.Index>(start: strr.startIndex, end: advance(strr.endIndex, -8))

strr.rangeOfString("step", options: NSStringCompareOptions.BackwardsSearch, range: Range<String.Index>(start: advance(strr.startIndex, 24), end: strr.endIndex))

//substring
strr.substringToIndex(advance(strr.startIndex, 6))
strr.substringFromIndex(advance(strr.endIndex, -3))
strr.substringWithRange(Range<String.Index>(start: advance(strr.startIndex, 17), end: advance(strr.endIndex, -26)))

//insert
strr.insert("爱", atIndex: advance(strr.startIndex, 17))

//remove
strr.removeAtIndex(advance(strr.startIndex, 23))
strr
//strr.removeRange(Range<String.Index>(start: advance(strr.startIndex, 11), end: advance(strr.startIndex, 16)))

//replace
strr.replaceRange(Range<String.Index>(start: advance(strr.startIndex, 11), end: advance(strr.startIndex, 16)), with: "Enjoy!!!")

//Arrays
var arrays = ["A!","ahaha","?"]
var arrays1:[Character] = ["A","b","C"]
var arrays2:Array<String> = ["A","b","CCC"]

arrays[0] = "aa"

var arrays4 = [Int]()
//var str = [String]()
var arrays5 = Array<Int>()
var arrays6:[Int] = []
arrays6.append(2)

arrays = []
arrays
arrays.append("xixi")
arrays
arrays = [String]()
arrays.append("haha")
arrays = Array<String>()
arrays

arrays6 = []
var arrays7 = [7,3,6]
arrays6 = [Int](count: 10, repeatedValue: 6)
var arrays8 = arrays7 + arrays6

arrays1
arrays1.count
arrays1.isEmpty
arrays1 += ["a","Q"]
arrays1 = []
arrays1 += ["a","Q"]
arrays1.append("B")
arrays1.insert("B", atIndex: 1)
//arrays1.removeAtIndex(0)
arrays1
//arrays1.removeLast()
//arrays1.removeRange(Range<Int>(start: 1, end: 3))

arrays1[1..<2] = ["b","q"]
arrays1
arrays1[1...2] = [" "]
arrays1

for arrays1i in arrays1{
    println(arrays1i)
}

for index1 in 0..<arrays1.count {
    println(arrays1[index1])
}

for (index2,item) in enumerate(arrays1){
    println((index2,item))
}




//Dictionary
var dictionary : Dictionary<Int,String> = [1:"A",2:"B",3:"C"]
//key and value can be any type
var dictionary1 : [String:String] = ["a":"A","b":"B","c":"C"]

dictionary1["a"]

var dic = Dictionary<Int,String>()
var dic1 = [String:String]()
//dictionary1 = [String:String]()
//dictionary1 = [:]

dictionary.count
dictionary.isEmpty
dictionary[2]

dictionary[1] ?? "NO"
dictionary[10] ?? "NO"

dictionary[4] = "D"

dictionary.updateValue("E", forKey: 4)
dictionary[4] = nil
dictionary
dictionary.removeValueForKey(2)
dictionary

for (key,value) in dictionary{
    println("\(key) : \(value)")
}

dictionary.keys
dictionary.values

for key in dictionary.keys{
    println(dictionary[key]!)
}

Array(dictionary.values)
[String](dictionary.values)

let dictionary2 = [1:"A",2:"B",3:"C"]
let array = ["A","B","C"]


let colors = [
    "Blue":(red:93,green:138,blue:168),
    "Yellow":(red:255,green:239,blue:0)
]

/*
var backview = UIView(frame: CGRectMake(0, 0, 320, CGFloat(colors.count*50)))
backview.backgroundColor = UIColor.blackColor()

var index = 0
for (colorName,RGBTuple) in colors{
    
    var colorsStripe = UILabel(frame: CGRectMake(0, CGFloat(index*50+5), 320, 40))
    
    colorsStripe.backgroundColor = UIColor(red: CGFloat(RGBTuple.red)/255, green: CGFloat(RGBTuple.green)/255, blue: CGFloat(RGBTuple.blue)/255, alpha: 1)
    
    colorsStripe
    
    var colorNameLabel = UILabel(frame: CGRectMake(0, 0, 300, 40))
    
    colorNameLabel.font = UIFont(name: "Arial", size: 24)
    
    colorNameLabel.textColor = UIColor.blackColor()
    colorNameLabel.textAlignment = NSTextAlignment.Right
    
    colorNameLabel.text = colorName
    
    colorNameLabel
    
    colorsStripe.addSubview(colorNameLabel)
    
    backview.addSubview(colorsStripe)
    
    
    index++
}*/

































