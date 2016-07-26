//: Playground - noun: a place where people can play

import UIKit
//var 为变量 let 常量
var str = "Hello, playground"

let a = 1

let b:Double = 3.0

//不同类不能相加
let c = Double(a)+b

let d = String(c) + str

//不可变
let shoppinglist = ["catfish","fish"]

var shoppinglist1 = ["one","two"]

//取数组里的数据
shoppinglist1[1] = "haha"

print(shoppinglist1)

var occupatins  = ["Malcolm":"Captain","Kaylee":"Mechanic"]

//去字典的数据
occupatins["Jayne"] = "public Relations"

print(occupatins["Malcolm"])

let emptyArray = [String]()
let emptyDictionary = [String :Float]()

//数组置为空
shoppinglist1 = []
print(shoppinglist1)

//字典置为空
occupatins = [:]
print(occupatins)


let individualScores = [75,43,103,87,12]
var teamScore = 0

for score in individualScores{
    if score > 50 {
        teamScore += 3;
    }else{
        teamScore += 1;
    }
}
print(teamScore);


//通常在什么情况下才会使用optional类型呢？
//（1）当我们需要声明这样一个变量，变量在设计初始化函数中没有进行初始化时，就需要声明这个变量为optional类型。因为变量在使用前必须先
//声明，并且在设计初始化函数中进行初始化。比如我们在viewDidLoad函数中才进行初始化的控件（类成员），就需要声明为optional且必须是var声明，
//因为let声明的常量只能是在初始化函数中进行初始化。
//（2）当我们不知道是否会有值的时候，这个变量可以声明为optional,比如代理，我们并没有要求必须传代理过来，那么就需要声明为optional。
//（3）作为函数参数时，如果这个参数可以没有值，那么就使用optional类型，比如传代理的时候，通常就是可选的，可以设置为nil
//......暂时只想到这些，任何人都可以继续往下补充！

var  optionalString:String? = "Hello"
print(optionalString == nil)

var optionalName:String? = "John Appleseed"
var greeting = "Hello!";

if let name = optionalName{
    greeting = "Hello,\(name)"
}else{
     greeting = "nihao"
}

let vegetable = "watercress"
switch vegetable{
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber","watercress":
        print("That would make a good tea sanwich.")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("nothing");
}

let interestingNumbers = [
    "Prime":[2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,8],
    "Square":[1,4,9,16,25],
]
var  largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers
    {
        if number > largest{
           largest = number
        }
    }
}

print(largest);

var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var  m = 2
repeat {
    m = m * 2
}while m < 100
print(m)

func greet(name: String, day: String) -> String {
    return "Hello \(name),today is \(day)."
}
greet("Bob",day: "Tuesday")

print(greet("Bob",day: "Tuesday"));


func calculateStatistics(scores:[Int]) ->(min: Int,max: Int,sum: Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores{
        if score > max {
            max = score
        }else if score < min{
            min = score
        }
//        print(score)

        sum += score;
    }
    return(min,max,sum);
}

let statustics = calculateStatistics([5,3,1])

print(statustics.max)
print(statustics.min)
//调用函数输出第一个值
print(statustics.2)


func sumOf(numbers: Int...) ->Int{
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf()
sumOf(42,597,12)

//函数嵌套
func returnFifteen() -> Int {
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}

returnFifteen()

func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int{
        return 1 + number
    }
    return addOne
}

var increment = makeIncrementer()
increment(7)



func hasAnyMatches(list: [Int],condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item){
            return true
        }
    }
    return false
}

//函数视为参数
func lessThanTen(number:Int) -> Bool {
    return number < 10
}

var numbers = [20,19,7,12]

hasAnyMatches(numbers, condition: lessThanTen)


numbers.map ({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

let mappedNumbers = numbers.map({number in 3 * number})

print(mappedNumbers)

//let sortedNumbers = numbers.sort { &0 > $1}

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides)sides."
    }
    
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()


class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String){
        self.name = name;
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}


class Square1: NamedShape {
    var sideLength : Double
    init(sideLength: Double,name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func are() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length\(sideLength)."
    }
}

let  test = Square1(sideLength: 5.2,name: "my test square")
test.are()
test.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double,name:String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimter:Double{
        get{
           return 3.0 * sideLength
        }
        set{
           sideLength = newValue/3.0
        }
    }
    override func simpleDescription()->String{
        return "An wquilateral truangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1 ,name: "a triangle")
print(triangle.perimter)

triangle.perimter = 9.9
print(triangle.sideLength)

//class TraiangleAndSquare{
//    var triangele:EquilateralTriangle{
//        willSet{
//        
//        }
//    }
//    
//}

enum Rank:Int {
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.Jack
let aceRawValue = ace.rawValue
let aceRawValue1 = ace.simpleDescription()


//struct Card {
//    var rank: Rank
//    
//    var suit: Suit
//    
//    func simpleDescription() ->String{
//        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
//    }
//}
//
//let threeOfSpades = Card(rank:.Three, suit:.Spades)
//
//let thressOfSpadesDescription = threeOfSpades.simpleDescription()
//

enum ServerResponse {
    case Result(String ,String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

//print(success)
//print(failure)

switch success{
case let .Result(sunrise,sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at\(sunset)."
case let .Error(error):
    let serviceResponse = "Failure...\(error)"
}

let http404Error = (404,"Not Found")
let (statusCode,statusMessage) = http404Error


print("The state is \(statusCode)")

print("The state message is \(statusMessage)")

let(justTheStatusCode,_) = http404Error

print("The state code is \(justTheStatusCode)")

print("The status message is \(http404Error.1)")

let http2005staus = (statusCode:200, description:"OK")
print("The status code is \(http2005staus.statusCode)")

print("The status message is \(http2005staus.description)")


let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode:String

if convertedNumber != nil{
    print("convertedNumber contaions some integer value.")
}

if convertedNumber != nil{
  print("convertedNumber has an integer value of\(convertedNumber)")
}


if let aa = convertedNumber{
    print("22\(aa)")
}else{
    print("234")
}

let possibleString: String? = "Anoptional String."
let forcedString: String = possibleString!//requires an exclamation mark 

let assumedString: String!="An implicitly unwrapped optional string."
let implicitString: String = assumedString //no need for an exclamation mark


if assumedString != nil{
  print(assumedString)
}

if let definiteString = assumedString {
  print(definiteString)
}

func canThrowAnError() throws {
    
}

do{
    try canThrowAnError()
}catch{

}

func makeASandwich() throws {
    
}

//do {
//    try makeASandwich()
////    eatASandwich()
//}catch Error.OutOfCleanDishes{
//
//}catch Error.MissingIngredients(let ingreditens){
//  
//}


let age = -3
//assert(age >= 0,"A person's age cannot be less than zero")
//assert(age >= 0)


//let b = 10
//var a = 5
//a = b

print(Float(8/2.5))

var i = 0

let three = 3
let minusThree = -three
let plusThree = -minusThree

var str1 = "我要飞的更高"

for c in str1.characters{
  print(c)
}
// swift 2.0 中遍历字符
for c in str1.characters {
    print(c)
}

// 字符串拼接
let im = 1
let rect = CGRectMake(0, 0, 100, 100)
str = str + "\(im)" + "\(rect)"

// 拼接字符串的时候，一定记住如果是可选项，要特别注意，带上 Optional
var x: Int?
x = 10
let str2 = "\(x!)"

// 格式
let frmString = String(format:"%02d:%02d:02d",arguments: [11, 1, 59])

/*:
 如果使用 Range 的时候，最好用 NSString
 */
// 跟原来的字符串一模一样
var subStr = str.substringWithRange(Range<String.Index>(start: str.startIndex, end: str.endIndex))
print(subStr)

var strDemo = "Hello ,playground"
/*
   数组定义[]
 */

let arrayDemo = ["zhangsan","lisi"]

//遍历
for strDemo in arrayDemo{
    print(strDemo)
}

print(arrayDemo[0])
print(arrayDemo[1])

// 不能向不可变数组添加内容
var array1 = ["XIAOMING","XIAOHONG"];
var array2 = ["xiaohua","xiaohong",123];
array1.append("laozhang")
array2.append(100)


/*
 数组的定义
 */
//array3 是一个仅允许存放字符串的数组，定义类型
var array3:[String]

//对array3 进行实例化，在此之前，不允许操作
array3 = [String]()
array3.append("laowang")

//数组的合并
array3 += array1

//必须相同类型的才能够合并
//提示：在swift 开发中，通常数组中保存的对象类型，都是一样的！
//array3 += array2

//数组的删除
array3.removeAtIndex(2)
array3


array3 += array1
print(array3.count)

array3.removeAll(keepCapacity: false)

// 添加内容
// 如果向数组中追加元素，超过了容量，会直接在现有容量基础上 * 2
// OC 实例化可变数组，最好指定容量
for i in 0..<16 {
    array3.append("hello - \(i)")
    print(array3[i])
    print(array3.capacity)
}

var strDicr = "Hello,playgroud"
/*
  定义字典[]
  let 不可变
  var 可变
 //[String: NSObject]- 类型最常见
 // JSON  的数据格式，key 是String
 // [key: value]
 */

var dict = ["name": "张三","age": 18]

// 如果 key不存在，会新建
dict["title"] = "boss"
dict

// 如果 key存在，会覆盖
dict["name"] = "lisi"

/*:
 字典的遍历
 k, v 可以随便写，前面是 key，后面是 value
 */
for (vv, kk) in dict {
    print(vv + "--- \(kk)")
}


/*:
 合并字典
 */
// 1. 定义字典
var dict1: [String: NSObject]
dict1 = [String: NSObject]()
dict1["nickname"] = "老王"
dict1["age"] = 80

// 2. 合并-如果存在会覆盖，如果没有会新建
for (k, v) in dict1 {
    dict[k] = v
}

dict




