//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var dict = ["liguiyang":47,"gaoyuexiang":20]
print(dict.map({
    return String($0.value)
}))

var array = ["a","12","1s","13"]
print(array.filter({
    return Int($0) != nil
}))

print(array.reduce("",{
    return $0 == "" ? $1 : $0 + "," + $1
}))


var arrInt = [10,4,2,11,6,3]
func reduce(arr:[Int]) -> (Int,Int,Int){
    var max = arr[0]
    var min = arr[0]
    var sum = 0
    for i in arr{
        if i > max {
            max = i
        }
        if i < min {
            min = i
        }
        sum = sum + i
    }
    return (max,min,sum)
}
print(reduce(arr: arrInt))
func test(x:Int) -> Int {
    return 1
}

max(2,3,4,8,7)

print(arrInt.reduce((max:Int.min,min:Int.max,sum:0),{
    return (max($0.max,$1),min($0.min,$1),$0.sum+$1)
}))


func f1(a:Int) -> Int {
    return 0
}

func f2(a:String) -> Int {
    return 0
}

func f3(a:Int) -> Int {
    return 0
}

var arrFunc:[Any] = [f1,f2,f3]

func isfunc(arr:[Any]) -> Void {
    for i in 0..<arr.count {
        if arr[i] is (Int)->Int{
            print("第\(i)个是（Int）-> Int类型")
        }
        
    }
}

print(isfunc(arr: arrFunc))

var p = arrFunc[0]
print(p)

print(arrFunc)


extension Int {
    var Sqrt:Double {
        return sqrt(Double(self))
    }
}

let sqrttest = 9.Sqrt
print(sqrttest)


func comparable <T:Comparable> (datas:T...) -> (max:T,min:T) {
    var max = datas[0]
    var min = datas[0]
    for data in datas {
        if max < data {
            max = data
        }
        if min > data {
            min = data
        }
    }
    return (max,min)
}

print(comparable(datas:13,14,12))
print(comparable(datas: 13.2,14.3,13.3))
print(comparable(datas: "aa","ab","vv"))


 

enum Gender:Int{
    case male = 1
    case female
    
}
//    要求具有firstName,  lastName，age，gender等存储属性,fullName计算属性；其中gender是枚举类型（male，female）；

class Person{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        set{
            
        }
        get{
            return firstName+lastName
        }
    }
    //  具有指定构造函数和便利构造函数；
    init(firstName:String,lastName:String,age:Int,gender:Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:18,gender:Gender.male)
    }
    //  Person实例可以直接用print输出；
    func description() -> String {
        return "firstName:\(self.firstName) lastName:\(self.lastName) age:\(self.age) gender:\(self.gender)"
    }
    //•    Person增加run方法(方法里面直接print输出Person XXX is running;
    func run() -> Void {
        print("Person \(self.fullName) is running")
    }
}
//两个Person实例对象可以用==和!=进行比较；
func ==(p1:Person,p2:Person) -> Bool{
    return p1.fullName == p2.fullName
}
func !=(p1:Person,p2:Person) -> Bool{
    return p1.fullName != p2.fullName
}
var p1 = Person(firstName: "li", lastName: "guiyang", age: 47, gender: Gender.male)
var p2 = Person(name: "gaoyuexiang")
if p1 == p2 {
    print("==")
}
if p1 != p2 {
    print("!=")
}
//  从Person分别派生Teacher类和Student类：
//  •    Teacher类增加属性title，实例可以直接用print输出；
//    •    Student类增加属性stuNo，实例可以直接用print输出；


//新建一个协议SchoolProtocol，协议包括一个department属性(Enum，自己实现enum的定义)和lendBook方法（随便写点内容，能区隔即可）；


enum Enum {
    case teacher
    case student
}



protocol SchoolProtocol {
    var department:Enum { get }
    
    func lendBook() -> Void
    
}

//•    修改Teacher和Student，让这两个类实现该协议；
class Teacher:Person,SchoolProtocol{
    var department: Enum = Enum.teacher
    var title:String
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title = title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
//  •    Teacher和Student重载run方法(方法里面直接print输出Teacher XXX is running和Student XXX is running)
    override func run() -> Void {
        print("Teacher \(self.fullName) is running")
        
    }
    func lendBook() {
        print("这是Teacher的lendBook ")
    }
    
}
class Student:Person,SchoolProtocol{
    var department: Enum = Enum.teacher
    var stuNo:String
    init(firstName: String, lastName: String, age: Int, gender: Gender,stuNo:String) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override func run() -> Void {
        print("Student \(self.fullName) is running")
        
    }
    func lendBook() {
        print("这是Student的lendBook ")
    }
}


var t1 = Teacher(firstName: "liao", lastName: "xuehua", age: 18, gender: Gender.female, title: "c")
var t2 = Teacher(firstName: "xia", lastName: "yu", age: 80, gender: Gender.male, title: "java")
var s1 = Student(firstName: "xiao", lastName: "ming", age: 20, gender: Gender.male, stuNo: "001")
var s2 = Student(firstName: "xiao", lastName: "zhu", age: 19, gender: Gender.female, stuNo: "002")
//  分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中；
var array1 = [p1,p2,t1,t2,s1,s2]

//  对数组执行以下要求：
//    •    分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容；

var per:Int = 0
var tea:Int = 0
var stu:Int = 0
for i in 0..<array1.count {
    if array1[i] is Student {
        stu = stu + 1
    }else if array1[i] is Teacher{
        tea = tea + 1
    }else{
        per = per + 1
    }
}

var dict1 = [String:Int]()
dict["Person"] = per
dict["Student"] = stu
dict["Teacher"] = tea

for(key,value) in dict1{
    print("\(key):\(value)")
}
//    •    对数组按以下要求排序并输出：age、fullName、gender+age；
array1.sort(by: {
    (per1:Person,per2:Person) -> Bool in
    return per1.age > per2.age
})
print("按年龄")
for a in array1 {
    print(a.description())
}


array1.sort(by: { $0.fullName > $1.fullName })
print("按姓名")
for a in array1 {
    print(a.description())
}


array1.sort(by: { String($0.gender.rawValue)+String($0.age) >  String($1.gender.rawValue)+String($1.age) }
)
print("按性别年龄")
for a in array1 {
    print(a.description())
}

//•    对数组进行穷举，调用每个对象的run方法，同时调用满足协议SchoolProtocol对象的lendBook方法；

for i in array1 {
    i.run()
    if let t = i as? Teacher {
        t.lendBook()
    } else if let s = i as? Student{
        s.lendBook()
    }
}







