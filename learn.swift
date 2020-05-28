// FIXME: To run the file, use this command to suppress all warning:
// swiftc learn.swift -suppress-warnings && ./learn 

// FIXME: you will see many do{...} block, that's because
// i want code snippets are context-independent and 
// this file continue to run even when an exception throw.


/*
    TODO: Swift introduction
        + Variables and Constants 
        + Data types
        + Optionals
        + Characters & Strings
        + Input & Output
        + Enums
*/

/*
    Swift variables following basic syntax:
    var <variable name> : <type> = <value>

        + Must not start with a digit
        + After the first character, digits are allowed
        + Can begin with and include an underscore character
        + Symbol names are case sensitive
        + Reserved language keywords may be used as variable 
          names if enclosed in backticks
*/
do {
    var pi : Double = 3.14159
}

/*
    Swift variables are declared using the `var` keyword, 
    while Swift constants are declared using the `let` keyword.
*/
do {
    var a = 3.14159
    let b = 3.15159
}

/*
    We created the variable without specifying its data type. 
    We took advantage of a Swift compiler feature called type inference.
    As a type-safe language, once a data type is inferred by the compiler, 
    it remains fixed for the life of the variable or constant.
*/
do {
    var name = "George Smith"
    // name = 3.14159  // Error: "Cannot assign value of type 'Double' to 'String'
}

/*
    While Swift is a type-safe language, where variable types are explicit
    and do not change, it is possible to create Swift code that behaves like 
    a dynamic type language using the Swift Any data type. 

    While this is legal, it's not a good Swift programming practice. 
    The Any type is mainly provided to allow bridging between Objective-C 
    and Swift code. To keep your code as safe and error-free as possible, 
    you should use explicit types wherever possible.
*/
do {
    var anyType: Any
    anyType = "Hello, World!"
    anyType = 3.14159
}

/*
    Unlike many other programming languages, Swift is not restricted to 
    the Western alphabet for its variable name characters. You may use any 
    Unicode character as part of your variable declarations. The following 
    variable declarations are legal in Swift:
*/
do {
    var helloWorld = "Hello, World"
    var 你好世界 = "Hello World"
    var 😊 = "Smile!"
}

/*
    Tuple & Optionals  
    You can think of them as `compound values`, and they function 
    almost identically to a `structure`, which is a single named 
    object which can store more than one variable embedded 
    within it.

    Tuples behave much like structures—which are 
    predefined compound data types in Swift and 
    many other languages. You may be tempted to 
    use tuples rather than making the extra effort 
    to create structures since they provide similar utility. 
    Be careful not to overuse tuples. They are convenient for 
    ad hoc, lightweight composite data types, but when used in 
    complex programming, use cases can result in code that's 
    more difficult to understand and harder to maintain. 
    Use tuples as they're intended, as a means to bundle 
    a few related components of a data element.
*/

do {
    // We can define and access the individual members 
    // of the tuple as follows:
    var country = (44, "GB", "United Kingdom")

    print(country.0)  // outputs 44
    print(country.1)  // outputs GB
    print(country.2)  // outputs United Kingdom
}

/*
    An Optional value either contains a value or contains 
    nil to indicate that a value is missing. Write a 
    question mark (?) after the type of a value
    to mark the value as optional.

    Think of an optional as a value wrapped in an envelope. 
    You cannot access the contents of an envelope without 
    opening it (unwrapping it), and then removing the contents.

    You can primarily unwrap an optional and use its value 
    in two ways:
        + Force unwrap
        + Conditional unwrap
*/
do {
    var optionalName: String? = nil
    var greeting = "Hello!"
    if let name = optionalName {
        greeting = "Hello \(name)"
    }
    print(greeting)
}

/*
    With conditional unwrapping, we ask the compiler to first 
    check whether the optional has a value, and return the value 
    if present, or nil if not.
*/
do {
    // var a: Int? = 4
    var a: Int?
    if let b = a {
        print(b)
    }
}


/*
    A force unwrap shifts all the responsibility to the programmer
    for ensuring optionals actually have values. The above example,
    b = a!, would allow the code to compile, but would generate the 
    following runtime error, and the application will crash.

    Force unwrapping should not be viewed as a way to get around
    compiler type-safety features. Only use force unwrapping when 
    you're absolutely certain that it's impossible for an optional 
    variable to contain a nil value.
*/
do {
    var a: Int?
    var b: Int = 4
    // b = a!   // => runtime error
}

/*
    Guard statement == short for if ... let else ...
    is often use when u need to chech data state checks at 
    the beginning of functions
*/
do {
    func doubleValue(input: Int?) -> Int? {
        if let i = input {
            return i * 2
        }
        return nil
    }

    func anotherDoubleValue(input: Int?) -> Int? {
        guard let i = input else {
            return nil
        }
        return i*2
    }
}

// another way to handle optional values is to provide a default
// value using the ?? operator. If the optional value is missing, 
// the default value is used instead
do {
    let nickName: String? = nil
    let fullName: String = "John Applessed"
    let informalGreeting = "Hi \(nickName ?? fullName)"
    print(informalGreeting)
}

/*
    When assigning constant values to numeric types, Swift provides 
    a handy format to make code more readable: the underscore 
    character is ignored when parsing numeric literals.
*/
do {
    var minutes = 100_000_000
}

/*
    Like many fully compiled languages, Swift is a strongly typed language, 
    and requires explicit type conversions (or casts) when assigning 
    the value from one variable type to a variable of a different type.

    This requirement for explicit type assignment is one reason why most 
    Swift programming uses the generic numeric variablesInt and Double, 
    except when specific usage requires tuning 
    for numeric range or memory storage size.
*/
do {
    var smallNumber: Int8 = 100
    var mediumNumber: Int16 = Int16(smallNumber)
}

/*
    The following code create three Int variables, 
    using binary, base10, and base16 literal notation
*/
do {
    var base2 = 0b101010
    var base10 = 42
    var hex = 0x2A

    // note that the three variables all have the same 
    // data type (Int) and same value (42 in base 10).
    print("Printing \(type(of: base2)): \(base2)")
    print("Printing \(type(of: base10)): \(base10)")
    print("Printing \(type(of: hex)): \(hex)")
}

/*
    Note that both variables were created as Double types—even though 
    the value of the first is actually an Integer. Swift's inference 
    system doesn't always look at the actual value. In this case, 
    the presence of scientific notation in the literal value 
    caused Swift to assume the value should be a Double.
*/
do {
    var scientific = 4.2E+7
    let double = 4.99993288828
    print("Printing \(type(of: scientific)): \(scientific)")
    print("Printing \(type(of: double)): \(double)")
}


/*
    Character & String
    The Character data type in Swift is an extended grapheme cluster.

    What does that mean?

    An extended grapheme cluster is an ordered sequence of one or 
    more Unicode scalars (that is, values) that, when taken 
    together, produce a human-readable character.

    Most important to understand is that, unlike ASCII or ANSI character 
    representations many programmers have worked with before, 
    a Character in Swift may be made 
    of more than one Unicode value.
*/

do {
    // In Swift, a Character literal is delimited by a double quote, 
    // rather than the single quote that's common in most C-inspired languages.
    // Because the Swift compiler's type inference rules will assume double 
    // quotes around a literal imply a string variable, the above ch1 assignment 
    // must explicitly declare the variables as Character type—otherwise 
    // the Swift compiler will create ch1 as a String.
    let ch1: Character = "A"
    let ch2: Character = "😎"
}

/*
    To construct a Character type using Unicode values, you can assign 
    an escape sequence, or use the UnicodeScalar struct to create 
    a Character using numeric Unicode values as input.
*/
do {
    let ch3 = Character(UnicodeScalar(65))
    let ch4 = "\u{1F601}"  // sets ch3 to "😁"
    let ch5 = "e\u{301}"   // é
}

/*
    Fundamentally, strings are arrays of the Character types, supporting 
    the familiar assignment operator =, substrings, 
    concatenation, and C-inspired escape characters.    
*/
do {
    var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let macCharacters = "⌘⌃⌥⇧ ⏎⌫⇪⎋⇥"
    let emoji = "😎😂🎃🐳🍎😜😆"
}

/*
    Extracting Characters

    In Swift, the input to the subscript operator 
    (that is, what's between the [] characters) 
    is expected to be of type String.Index, not Int.
*/
do {
    var alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let macCharacters = "⌘⌃⌥⇧ ⏎⌫⇪⎋⇥"
    let emoji = "😎😂🎃🐳🍎😜😆"

    // let ch = alphabet[4] // => the following syntax with Swift strings is illegal
    let idx = alphabet.index(alphabet.startIndex, offsetBy: 4)
    let ch = alphabet[idx]  // ch is assigned the character "E"


    // String length
    let alphabetLength = alphabet.count  // 26
}

/*
    TODO: ENUMS

    are frequently used in Swift to create custom data types 
    that have a predefined set of possible values to select 
    from. Enums serve to make code more readable and maintainable, 
    and also provide compile-time checking for parameters and value 
    assignments which yield higher quality, more robust code.
*/

do {
    enum DayOfWeek: Int {
        case monday, tuesday, wednesday, thursday, friday
    }

    var today = DayOfWeek.wednesday
    if today == .friday {
        print("Today is Friday")
    } else {
        print("Today is not Friday")
    }

    var nthDay = today.rawValue - DayOfWeek.monday.rawValue + 1 // 3
    var tomorrow = DayOfWeek(rawValue: today.rawValue + 1) // DayOfWeek.thursday

    enum AnotherDayOfWeek: String {
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
        case thursday = "Thursday"
        case friday = "Friday"
        case saturday = "Saturday"
    }
    
    var anotherToday = AnotherDayOfWeek.wednesday // DayOfWeek.wednesday
    let dayString = anotherToday.rawValue  // "Wednesday"
}


/*
    TODO: Swift Operator
        + Assignment operators
        + Arithmetic operators
        + Comparison operators
        + Logical operators
        + Bitwise operators
        + Nil-coalescing operators
        + Range operators
        (break down into categories by the function they perform)

    Operators are special characters—usually drawn from 
    mathematics—that are used to process evaluations, 
    modify variable values, and combine values.
*/
do {

    // === Assignment Operator
    let x = 3.0


    // === Arithmetic Operators
    let res = 14 % 4   // r == 2
    let rem = 15.3.remainder(dividingBy: 5.0) // r == 0.3
    var y = -x // y == -3
    // y = y + 1 // => x += 1
    // y++    // Unary operator '++' cannot be applied


    // === Comparison Operators
    // To compare whether the value of two value types are equal
    // use the double-equals sign ==, for example:
    if x == 3 {
        // do something ... 
    }

    // To compare whether two class instances are the same 
    // instance, use the triple-equals sign ===, for example:
    // if obj1 === obj2 {
    //     // do something if the variables 
    //     // refer to the same object
    // }
    

    // === Ternary Conditional Operator
    // conventional if..then..else
    if x > 4 {
       y = 1
    } else {
       y = 2
    }
    // and the same ternary conditional operator
    y = x > 4 ? 1 : 2


    // === Logical Operators
    /*
        Swift's logical operators follow the same conventions
        as other C-inspired languages.
        - NOT	!
        - AND	&&
        - OR	||
    */


    // === Nil-Coalescing Operator
    // The nil-coalescing operator is used when unwrapping 
    // an optional when a default value is desired in the case 
    // that the optional is nil.
    func username(for  id: Int) -> String? {
        if id == 1 {
            return "Taylor Swift"
        } else {
            return nil
        }
    }

    let user = username(for: 15) ?? "Anonymous"
    print(user)


    // === Range Operators
    for var i in 0..<10 { // 0 -> 9
        print(i)
    }

    // Closed range operator
    var someNumbers1 = 0...10   // numbers = [0,1,2,3,4,5,6,7,8,9,10]
    // Half-open range operator
    var someNumbers2 = 0..<10   // numbers = [0,1,2,3,4,5,6,7,8,9]
    // One-sided range operator
    let range = ..<2
    print(range.contains(-1))
    print(range.contains(2))

    let ex = [-1,-2,-3,0,1,2,3]
    let b = ex[range] // => [-1,-2]

}



/*
    TODO: CONTROL FLOW
    Flow control structures enable developers to apply logical 
    processes and make decisions about what code is executed.
        + if ... else
        + switch
        + for ... in
        + while & repeat ... while
        + break, continue & guard statement
*/
do {
    // if statement must be a boolean expression -- this means
    // that code such as if score {...} is an error, 
    // not an implicit comparison to zero 
    let individualScores = [75, 43, 103, 87, 12]
    var teamScore = 0
    for score in individualScores {
        if score > 50 {
            teamScore += 3
        } else {
            teamScore += 1
        }
    }
    print(teamScore)

    // Conditonal lists
    let isCar = true
    let isNew = true

    if isCar, isNew {
        print("new car")
    }
}

// Switch support any kind of data and a wide variety of 
// comparison operations -- they arent limited to 
// integers and tests for equality
do {
    let vegetable = "red pepper"
    switch vegetable {
        case "celery":                          print("Add some raisins and make ants on a log.")
        // Multiple Patterns in a Single Case
        case "cucumber", "watercress":          print("That would make a good tea sandwich.")
        case let x where x.hasSuffix("pepper"): print("Is it a spicy \(x)?")
        default:                                print("Everything tastes good in soup.")
    }

    // another example
    let quarterName = "Second Quarter"
    var quarterNum: Int?

    switch quarterName {
    case "First Quarter": quarterNum = 1
    case "Second Quarter": quarterNum = 2
    case "Third Quarter": quarterNum = 3
    default: quarterNum = 4
    }

    // break keyword
    // If a case is matched that should run no code, 
    // simply include a break statement.
    let personAge : Int = 15
    switch personAge {
        case 0..<1: print("baby")
        case 1..<18: break
        default: print("adult")
    }

    // the fallthrough keyword
    // If a matched case should execute statements declared for 
    // the case that directly follows it, use the fallthrough keyword.
    switch personAge {
        case 0..<1: print("baby")
        case 1..<3: print("toddler")
        case 3..<5: fallthrough
        case 5..<13: fallthrough
        case 13..<18: print("teen")
        default: print("adult")
    }

    // using `where` statement within case
    let temperature = 21.5
    let humidity = 22.0
    
    switch (temperature, humidity) {
        case let (t,h) where t > h: print("humidity lower")
        case let (t,h) where t < h: print("humidity higher")
        default: "humidity and temperature are the same"
    }

    // another switch and where combination ...
    let responseCode = 501
    
    switch(responseCode) {
    case 200: print("ok")
    case let code where code >= 500: print("server error")
    default: print("Request failed for another reason")
    }
}

// you can use for-in to iterate over items in a dictionary
// by providing a pair of names to use for each key-value pair
// Dict are an unordered collection, so their keys and values 
// are iterate over in an arbitrary order
do {
    let interestingNumbers = [
        "Prime": [2,3,5,7,11,13],
        "Fibonacci":[1,1,2,3,5,8],
        "Square":[1,4,9,16,25],
    ]

    var largest = 0
    for (_, numbers) in interestingNumbers {
        for number in numbers {
            if number > largest {
                largest = number
            }
        }
    }
    print(largest)
}


// use while to repeat a block of code until a condition changes.
// the condition of a loop can be at the end instead, 
// ensuring that the loop is run at least once
do {
    var n = 2
    while n < 100 {
        n *= 2
    }
    print(n) // => 128

    var m = 2
    repeat {
        m *= 2
    } while m < 1
    print(m) // => 4
}


/*
    TODO: Collections
        + Arrays
        + Sets
        + Dcitionary
*/
// An array is simply a container that can hold multiple data 
// (values) of a data type in an ordered list, i.e. you get 
// the elements in the same order as you defined the items 
// in the array.
do {
    // declare empty array
    let emptyIntArr:[Int] = []
    print(emptyIntArr)

    var shoppingList = ["catfish", "water", "tulips"]
    shoppingList.append("blue paint")
    print(shoppingList)

    // access member
    let secondElement = shoppingList[1]
    print(secondElement)

    // util
    print(shoppingList.isEmpty)
    print(shoppingList.first)
    print(shoppingList.count)

    // append another array
    var secondArr = ["computer", "mouse"]
    shoppingList.append(contentsOf: secondArr)
    print(shoppingList)

    // insert at specific index
    shoppingList.insert("keyboard", at: 1)
    print(shoppingList)

    // remove at specific index
    shoppingList.remove(at: 1)
    print(shoppingList)

    // revered array
    let reversedArr = Array(shoppingList.reversed())
    print(reversedArr)
}

// Dictionary
// simply a container that can hold multiple data as 
// key-value pair in an unordered way.
do {
    // Declaring an empty dictionary
    let emptyDic:[Int:String] = [:]
    print(emptyDic)

    let anotherEmptyDic:Dictionary<Int, String> = [:]
    print(anotherEmptyDic)

    // Creating dictionary from two arrays
    let customKeys = ["Facebook", "Google", "Amazon"]
    let customValues = ["Mark", "Larry", "Jeff"]
    let newDictionary = Dictionary(uniqueKeysWithValues: zip(customKeys,customValues))
    print(newDictionary)

    // Accessing element in a dictionary
    let someDic = ["a":1, "b":2, "c":3, "d":4, "e":5, "f":6, "g":7, "h":8, "i":9]
    print(someDic["a"])
    print(someDic["h"])

    // Access using for ... in loop
    for (key,value) in someDic {
        print("key:\(key) value:\(value)")
    }

    // util
    var someDictionary = ["Nepal":"Kathmandu", "China":"Beijing", "India":"NewDelhi"]
    print(someDictionary.isEmpty)
    print(someDictionary.first)
    print(someDictionary.count)
    
    let dictKeys  = Array(someDictionary.keys)
    print(dictKeys)

    // remove key - value
    let val  = someDictionary.removeValue(forKey: "Nepal")
    print(val)
    print(someDictionary)

    // !! key should be present
    // let val  = someDictionary["Vietnam"]
    // print(val) // => nil

    // default value for non-existen key
    let val1  = someDictionary["nepal", default:"Not Found"]
    print(val1)
}


// Sets is simply a container that can hold multiple value of 
// data type in an unordered list and ensures unique element 
// in the container (i.e each data appears only once).
do {
    // Declaring an empty set
    var letters = Set<Character>()
    print("letters is of type Set<Character> with \(letters.count) items.")

    // insert
    letters.insert("a")

    // letters is now an empty set, 
    // but is still of type Set<Character>
    letters = []

    // create Set with an array literal
    // var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    // or 
    var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]

    // remove an item
    if let removedGenre = favoriteGenres.remove("Rock") {
        print("\(removedGenre)? I'm over it.")
    } else {
        print("I never much cared for that.")
    }

    // check contains
    print(favoriteGenres.contains("Funk"))

    // iterating over a Set
    for genre in favoriteGenres {
        print("\(genre)")
    }

    // Set operation
    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

    oddDigits.union(evenDigits).sorted()
    // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    oddDigits.intersection(evenDigits).sorted()
    // []
    oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
    // [1, 9]
    oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
    // [1, 2, 9]

    // Set Membership and Equality
    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]

    houseAnimals.isSubset(of: farmAnimals)
    // true
    farmAnimals.isSuperset(of: houseAnimals)
    // true
    farmAnimals.isDisjoint(with: cityAnimals)
    // true
}


/*
    TODO: Functions and Closures
    Functions are a key part of Swift's structure, and are 
    units of code that can accept parameters and can 
    return values.
*/

// use func to declare a function
do {
    func greet(person: String, day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    print(greet(person:"Bob", day :"Tuesday"))
}

// by default, functions use their parameter names as labels for 
// their arguments. Write a custom argument label before the 
// parameter name, or write _ to use no argument label
do {
    func greet(_ person: String, on day: String) -> String {
        return "Hello \(person), today is \(day)"
    }
    print(greet("John", on: "Wednesday"))
}

// use a tuple to make compound value -- for example, to 
// return multiple value from a function, the elements of 
// a tuple can be referred to either by name or by number 
do {
    func calculateStats(scores: [Int]) 
        -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0

        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        return (min, max, sum)
    }

    let statistics = calculateStats(scores: [5, 3, 100, 3, 9])
    print(statistics.min)   // => 3   (min)
    print(statistics.2)     // => 120 (sum)   
}

// func can be nested
do {
    func returnFifteen() -> Int {
        var y = 10
        func add() { y += 5 }
        add()
        return y
    }

    print(returnFifteen())  // => 15
}

// func are first-class type. This means that a function 
// can return another function as its value.
do {
    func makeIncrementer() -> ((Int)->Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }

    var increment = makeIncrementer()
    print(increment(2))     // => 3
}

// a func can take another func as one of its arguments
do {
    func hasAnyMatches(
        list: [Int], condition: (Int) -> Bool)-> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }

    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }

    var numbers = [20, 19, 7, 12]
    print(hasAnyMatches(list: numbers, condition: lessThanTen))
}

// func are actually a special case of Closures: 
// Blocks of code that can be called later
// you can write a closure without a name by 
// surrounding code with `braces: {}`. use in to separate 
// the arguments and the type from the body
do {
    var someNumbers = [1,2,3,4,5,6]
    print(
        someNumbers.map({
            (number: Int) -> Int in 
            if number%2==0 {
                return number
            } else {
                return 0
            }
        })
    )
}

// When a closure’s type is already known, 
// such as the callback for a delegate, 
// you can omit the type of its parameters, 
// its return type, or both. Single statement closures
// implicitly return the value of their only statement.
do {
    var someNumbers = [1,2,3,4,5,6]
    let mappedNumbers = someNumbers.map({ number in 3 * number })
    print(mappedNumbers)
}

// You can refer to parameters by number instead of by 
// name—this approach is especially useful in very short closures. 
// A closure passed as the last argument to a function can 
// appear immediately after the parentheses. When a closure 
// is the only argument to a function, you can omit the 
// parentheses entirely.
do {
    var numbers = [20, 19, 7, 12]
    let sortedNumbers = numbers.sorted { $0 > $1 }
    print(sortedNumbers)
}


/*
    TODO: Error handling
    Swift Error Handling is all about handling the failing 
    conditions gracefully, ensure all the code you develop 
    will be robust and of high quality.
    
    ! Error Protocol is just a type for representing error 
    values that can be thrown.
*/

// Swift requires you to create a custom Error type. 
// Typically an Enum is used which conforms to the Error Protocol.
// The Error Protocol is more or less empty. Hence you don’t 
// need to override anything from them. Error Protocol is a must 
// for Error Handling and creating Error types.
do {
    enum UserDetailError: Error {
        case noValidName
        case noValidAge
    }

    // throws modifier must be added in the definition
    // throw keyword is used for throwing errors from the error type defined.
    func userTest(age: Int, name: String) throws {
        guard age > 0 else{
            throw UserDetailError.noValidAge
        }

        guard name.count > 0 else{
           throw UserDetailError.noValidName
        }
    }

    // do ... catch is similar to try ... catch block
    do {
        try userTest(age: -1, name: "")
    } catch let error {
        print("Error: \(error)")
    }

}

// try || try? || try!
do {
    enum StudentError: Error {
        case invalid(String)
        case tooShort
    }

    class Student {
        var name: String?
        init(name: String?) throws {
            guard let name = name else{
                throw StudentError.invalid("Invalid")
            }
            self.name = name 
        }

        func myName(str: String) throws -> String {
            guard str.count > 5 else {
                throw StudentError.tooShort
            }
            return "My name is \(str)"
        }
    }

    // example 1
    do {
        var s = try Student(name: nil)
    } catch let error {
        print(error) // invalid("Invalid")
    }

    // example 2
    do {
        var s = try Student(name: "tamtito")
        try s.myName(str: "tam")
    } catch let error {
        print(error)
    }

    // you can get rid of do ... catch by using try? || try!
    // try? is used to handle errors by converting the error 
    // into an optional value
    // try! is used to assert that the error won’t occur.
    var t1 = try? Student(name: nil)
    var t2 = try! Student(name: "Anupam")
}



/*
    TODO: Objects and Classes
    Organizing units of code into classes that perform a very 
    specific set of actions on a specific set of data, that 
    will help your code re-usable, easy to maintain & design.
*/

// simple example 
do {
    class Shape {
        var numberOfSides = 0
        func simpleDescription() -> String {
            return "A shape with \(numberOfSides) sides."
        }
    }

    var shape = Shape()
    shape.numberOfSides = 7
    var shapeDescription = shape.simpleDescription()
    print(shapeDescription)
}

// Getter & Setter & Override
do {
    class NamedShape {
        var numberOfSides: Int = 0
        var name: String

        init(name: String) {
            self.name = name
        }

        func simpleDescription() -> String {
            return "A shape with \(numberOfSides) sides."
        }
    }

    // Override
    class Square : NamedShape {
        var sideLength: Double

        init(sideLength: Double, name: String) {
            self.sideLength = sideLength
            super.init(name: name)
            numberOfSides = 4
        }

        func area() -> Double {
            return sideLength * sideLength
        }

        override func simpleDescription() -> String {
            return "A square with sides of length \(sideLength)"
        }
    }

    let test = Square(sideLength: 5.2, name: "my test square")
    print(test.area())
    print(test.simpleDescription())
    print(test.numberOfSides)


    // Getter & Setter 
    class EquilateralTriangle: NamedShape {
        var sideLength: Double = 0.0
        var perimeter: Double {
            get { return 3.0 * sideLength }
            set { sideLength = newValue / 3.0 }
        }

        init(sideLength: Double, name: String) {
            self.sideLength = sideLength
            super.init(name: name)
            numberOfSides = 3
        }

        override func simpleDescription() -> String {
            return "An equilateral triangle with sides of length \(sideLength)."
        }
    }

    var triangle = EquilateralTriangle(
        sideLength: 3.1, name: "a triangle")
    print(triangle.perimeter)
    // Prints "9.3"

    triangle.perimeter = 9.9
    print(type(of: triangle.sideLength))
    // Prints "3.3000000000000003"
}

/*
    TODO: Struct     
    Structures suppport many of the same behavior as classes.
    but, Structures are always copied when thay are passed 
    around in your code, but classes are passed by referrence
*/

do {
    enum Rank: Int {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king

        func simpleDescription() -> String {
            switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
            }
        }
    }

    enum Suit {
        case spades, hearts, diamonds, clubs

        func simpleDescription() -> String {
            switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
            }
        }
    }

    // struct example
    struct Card {
        var rank: Rank
        var suit: Suit
        func simpleDescription() -> String {
            return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
        }
    }

    let threeOfSpades = Card(rank: .three, suit: .spades)
    let threeOfSpadesDescription = threeOfSpades.simpleDescription()
    print(threeOfSpadesDescription)
}