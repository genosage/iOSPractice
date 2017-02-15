//: Playground - noun: a place where people can play

import UIKit

/*
for i in -99..<99
{
    i*i
}

let str = "Find Swift!"
for i in str
{
    println(i)
}

let letters:Array<String> = ["I","love","Swift"]
for i in letters
{
    println(i)
}
for (index,item) in enumerate(letters)
{
    println("\(index) : \(item)")
}

var result = 1
for _ in 0..<10
{
    result *= 2
}

for var i = -9.99; i <= 9.99; i += 0.1
{
    sin(2*i) + cos(i/2)
}

var j = -9.99
while( j <= 9.99 )
{
    tan(2*j) / cos(j)
    j += 0.1
}

var k:UInt32 = arc4random()%1000
*/

/*
var array:[Int] = [4,2,7,9,3,7,3,6,3]
array.sort(>)
var array1:Array<String> = ["miss","Missaya","lolol","lll","azzzzzz"]
array1.sort(<)

var i = 100
switch i
{
case 100 :
    println("perfect!")
case 0...100 , 900..<1000 :
    println("It is edge!")

case 101..<900 :
    println("It is inside!")
default :
    println("error!")
}*/

/*
var array2 = ["miss","lol"]
switch array2
{
case ["miss","lol"]:
    println("Right")
}*/
/*
var xy:(Double,Double) = (9.9,10)
switch xy
{
case (0,0):
    println("It is origin!")
case (0,_) , (_,0):
    println("(\(xy.0),\(xy.1)) is on x-axis or y-axis!")
case (-10...10,-10...10):
    println("(\(xy.0),\(xy.1)) is near the origin!")
default:
    println("An ordinary coordinate!")
}*/

//value binding

/*var xy = (0.0030,0)

switch xy
{
case (0,0):
    println("It is origin!")
case (0,let y):
    println("(0,\(y)) is on y-axis!")
case (var x,0):
    println("(\(x),0) is on x-axis!")
case (-10...10,-10...10):
    println("(\(xy.0),\(xy.1)) is near the origin!")
default:
    println("An ordinary coordinate!")
}*/

//where
/*
var xy = (0,0)
switch xy
{
case let (x,y) where x == y :
    println("(\(x),\(y)) is on the line of x=y!")
    fallthrough
case (0,0):
    println("It is origin!")
case var (x,y) where x == -y :
    println("(\(x),\(y)) is on the line of x=-y!")
    fallthrough
default:
    println("An ordinary coordinate!")
}


var str = (120,"optional value binding")
switch str
{
case (let a,let strr) where strr.hasPrefix("option"):
    println(a)
default:
    println("Error!")
}

//do not need the default if the case statements cover all the possibilities

var cube = Array<Array<Array<Int>>>()

for i in 0..<10
{
    cube[i].append(Array<Int>(count: 10, repeatedValue: 1))
}

for x in 0..<10
{
    println(cube[x])
}*/
/*
var board = Array<Array<Int>>()

for i in 0..<10
{
    board.append(Array<Int>(count: 10, repeatedValue: 0))
}
var xrand = Int(arc4random()%10)
var yrand = Int(arc4random()%10)
board[xrand][yrand] = 1
board

var x = 0,y = 0

mainloop: for x = 0;x < 10;x++
{
    for y = 0; y < 10;y++
    {
        if board[x][y] == 1
        {
            break mainloop
        }
    }
}

println("board[\(x)][\(y)] = 1")
*/
/*
for x in 1...3
{
    for y in 1...3
    {
        if y == 2
        {
            break
        }
        println("x = \(x),y = \(y)")
    }
}


for x in 1...3
{
    for y in 1...3
    {
        if y == 2
        {
            continue
        }
        println("x = \(x),y = \(y)")
    }
}
*/
func Hello(name:String)->String
{
    var result = "Hello "+name+"!"
    return result
}

var nickname:String?

nickname = "ZT"

println(Hello(nickname ?? "Guest"))

func Welcome() -> Void
{
    println("Welcome!")
}

Welcome()

















