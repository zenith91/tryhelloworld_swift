//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

////////////////////////////////////////
////////////////// 함수//////////////////
////////////////////////////////////////


// 1. function type
func addTwoInts(a:Int, b:Int) -> Int
{
    return a + b
}
func multiplyTwoInts(a:Int, b:Int) -> Int
{
    return a * b
}

// 함수 자체를 하나의 타입으로 사용한다.
// (Int, Int) -> Int => 정수형 변수 두개를 넣어서 하나의 정수형을 리턴받는 타입이라는 의미.
var mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction(2,3)
mathFunction = multiplyTwoInts
mathFunction(2,3)

// 2. function type의 사용
func addVAT(source:Double) -> Double{
    return source * 1.1
}

func couponDiscount(source:Double) -> Double {
    return source * 0.9
}

var additional: (Double) -> Double

let transaction1 = 120.8
additional = addVAT

let price1 = additional(transaction1)

func finalPrice(source:Double, additional: (Double) -> Double) -> Double {
    let price = additional(source)
    return price
}

// 함수 타입을 매개변수에 넣는다.
let price2 = finalPrice(source: 350.0, additional: couponDiscount)


// 3. Closure
// 1등 시민으로 사용가능한 독립적인 코드조각
// 자신이 정의된 환경을 캡처해서 저장한 뒤 닫아버린다고 해서 클로저라 부름.

// 기본적인 구조
// { (params) -> returnType in
//     statements
// }

// addVAT함수를 클로저 함수로 바꿔보자.
let addVATClosure = { (source:Double) -> Double in
    return source * 1.1
}
let couponDiscountClosure = { (source:Double) -> Double in
    return source * 0.9
}

let price3 = addVATClosure(157.6)

// 4. Closure 축약하기
// 1.1이 곱해진 값이 리턴되므로 리턴타입 Double로 추론 가능 -> 생략
// 매개변수 타입도 생략 가능.
let addVATClosure2 = { source in
    return source * 1.1
}

// 리턴문도 생략 가능
let addVATClosure3 = { source in
    source * 1.1
}

// 위치를 이용해 참조
// 내부에서 사용하는 이름이기 때문에 의미가 없다.
let addVATClosure4 = { $0 * 1.1 }


// couponDiscountClosure 축약
let couponDiscountClosure2 = { source in
    return source * 0.9
}

let couponDiscountClosure3 = { source in
    source * 0.9
}

let couponDiscountClosure4 = { $0 * 0.9 }

addVATClosure(100)
addVATClosure2(100)
addVATClosure3(100)
addVATClosure4(100)

couponDiscountClosure(100)
couponDiscountClosure2(100)
couponDiscountClosure3(100)
couponDiscountClosure4(100)








