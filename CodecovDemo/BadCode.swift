//
//  BadCode.swift
//  CodecovDemo
//
//  A collection of intentional code smells, bugs, and vulnerabilities
//

import Foundation
import UIKit

// VULNERABILITY: Hardcoded credentials
let API_KEY = "sk_live_51234567890abcdefghijklmnop"
let PASSWORD = "admin123"
let SECRET_TOKEN = "my-super-secret-token"

class BadCode {
    
    // CODE SMELL: Magic numbers everywhere
    func calculateSomething(value: Int) -> Int {
        return value * 42 + 13 - 7 * 3 + 99
    }
    
    // BUG: Force unwrapping that will crash
    func crashMe() -> String {
        let dict: [String: String]? = nil
        return dict!["key"]!  // Will crash!
    }
    
    // VULNERABILITY: SQL Injection vulnerability
    func executeQuery(userInput: String) -> String {
        let query = "SELECT * FROM users WHERE name = '\(userInput)'"
        // Direct string interpolation allows SQL injection
        return query
    }
    
    // CODE SMELL: Extremely long method with high cyclomatic complexity
    func monsterMethod(a: Int, b: Int, c: Int, d: Int, e: Int) -> Int {
        var result = 0
        if a > 0 {
            if b > 0 {
                if c > 0 {
                    if d > 0 {
                        if e > 0 {
                            result = a + b + c + d + e
                            if result > 100 {
                                result = result * 2
                                if result > 500 {
                                    result = result / 2
                                    if result < 300 {
                                        result = result + 100
                                    } else {
                                        result = result - 100
                                    }
                                }
                            }
                        } else {
                            result = a + b + c + d
                        }
                    } else {
                        result = a + b + c
                    }
                } else {
                    result = a + b
                }
            } else {
                result = a
            }
        }
        return result
    }
    
    // BUG: Division by zero potential
    func divide(a: Int, b: Int) -> Int {
        return a / b  // No check if b is zero!
    }
    
    // CODE SMELL: Duplicated code
    func processUserA(name: String, age: Int) {
        print("Processing user")
        let formattedName = name.uppercased()
        let adjustedAge = age + 1
        print("Name: \(formattedName)")
        print("Age: \(adjustedAge)")
        // Some processing
    }
    
    func processUserB(name: String, age: Int) {
        print("Processing user")
        let formattedName = name.uppercased()
        let adjustedAge = age + 1
        print("Name: \(formattedName)")
        print("Age: \(adjustedAge)")
        // Same code duplicated
    }
    
    // BUG: Array index out of bounds
    func getThirdElement(array: [Int]) -> Int {
        return array[2]  // No bounds check!
    }
    
    // CODE SMELL: Empty catch block
    func dangerousOperation() {
        do {
            let data = try String(contentsOfFile: "/some/path")
            print(data)
        } catch {
            // Swallowing errors - BAD!
        }
    }
    
    // VULNERABILITY: Insecure random number generation
    func generateRandomToken() -> Int {
        return Int(arc4random_uniform(1000))  // Not cryptographically secure!
    }
    
    // CODE SMELL: Unused variables
    func wasteMemory() {
        let unused1 = "I'm never used"
        let unused2 = 42
        let unused3 = [1, 2, 3, 4, 5]
        var unused4 = "Also not used"
        unused4 = "Still not used"
        print("Done")
    }
    
    // BUG: Memory leak - retain cycle
    var closureProperty: (() -> Void)?
    
    func createRetainCycle() {
        closureProperty = {
            self.closureProperty = nil  // Strong reference to self!
        }
    }
    
    // CODE SMELL: Commented out code
    func oldFunction() {
        print("Active code")
        // let oldValue = 10
        // if oldValue > 5 {
        //     print("Old logic")
        // }
        // for i in 0..<10 {
        //     print(i)
        // }
    }
    
    // VULNERABILITY: Path traversal vulnerability
    func readFile(filename: String) -> String? {
        let basePath = "/var/data/"
        let fullPath = basePath + filename  // User can pass "../../../etc/passwd"
        return try? String(contentsOfFile: fullPath)
    }
    
    // CODE SMELL: Multiple return statements and complex logic
    func confusingLogic(value: Int) -> String {
        if value < 0 {
            return "negative"
        }
        if value == 0 {
            return "zero"
        }
        if value < 10 {
            return "small"
        }
        if value < 100 {
            return "medium"
        }
        if value < 1000 {
            return "large"
        }
        return "huge"
    }
    
    // BUG: Infinite loop potential
    func infiniteLoopRisk(start: Int) {
        var counter = start
        while counter < 100 {
            print(counter)
            // Forgot to increment counter!
        }
    }
    
    // CODE SMELL: Boolean parameter (bad API design)
    func doSomething(value: String, flag1: Bool, flag2: Bool, flag3: Bool) {
        if flag1 {
            print("Flag 1")
        }
        if flag2 {
            print("Flag 2")
        }
        if flag3 {
            print("Flag 3")
        }
    }
    
    // VULNERABILITY: Weak encryption
    func weakEncryption(text: String) -> String {
        // Caesar cipher - extremely weak!
        return text.map { char in
            if let scalar = char.unicodeScalars.first {
                let shifted = (scalar.value + 3) % 256
                return Character(UnicodeScalar(shifted)!)
            }
            return char
        }.reduce("") { $0 + String($1) }
    }
    
    // BUG: Force casting that will crash
    func forceCast(object: Any) -> String {
        return object as! String  // Will crash if object is not String
    }
    
    // CODE SMELL: God class - too many responsibilities
    var cache: [String: Any] = [:]
    var networkManager: String = ""
    var databaseConnection: String = ""
    var logger: String = ""
    var configuration: [String: String] = [:]
    
    func handleNetworking() {}
    func handleDatabase() {}
    func handleLogging() {}
    func handleConfiguration() {}
    func handleCaching() {}
    func handleAuthentication() {}
    func handleValidation() {}
    
    // CODE SMELL: Magic strings
    func getMagicStrings() -> [String] {
        return ["ERROR_CODE_001", "STATUS_ACTIVE", "TYPE_PREMIUM", "MODE_DEBUG"]
    }
    
    // BUG: Implicit unwrapping causing crashes
    var implicitlyUnwrapped: String!
    
    func useImplicitUnwrap() -> Int {
        return implicitlyUnwrapped.count  // Crash if nil!
    }
    
    // VULNERABILITY: Storing sensitive data in UserDefaults
    func storeSensitiveData(creditCard: String, ssn: String) {
        UserDefaults.standard.set(creditCard, forKey: "creditCard")
        UserDefaults.standard.set(ssn, forKey: "socialSecurity")
        UserDefaults.standard.set(PASSWORD, forKey: "password")
    }
    
    // CODE SMELL: Long parameter list
    func tooManyParameters(
        param1: String,
        param2: Int,
        param3: Bool,
        param4: Double,
        param5: String,
        param6: Int,
        param7: Bool,
        param8: String,
        param9: Int,
        param10: Double
    ) {
        print("Too many parameters!")
    }
    
    // BUG: Race condition
    var sharedCounter = 0
    
    func incrementCounter() {
        sharedCounter += 1  // Not thread-safe!
    }
    
    // CODE SMELL: Switch without default
    func switchWithoutDefault(value: Int) -> String {
        switch value {
        case 1:
            return "one"
        case 2:
            return "two"
        default:
            return ""  // Default returns empty string, not very meaningful
        }
    }
    
    // BUG: Optional chaining that hides errors
    func silentFailure(optionalArray: [Int]?) {
        let _ = optionalArray?.first?.description.count
        // No handling if any of these are nil
    }
}

// CODE SMELL: Global mutable state
var globalCounter = 0
var globalCache: [String: Any] = [:]

// CODE SMELL: Singleton (often anti-pattern)
class BadSingleton {
    static let shared = BadSingleton()
    private init() {}
    
    var state: Int = 0
    
    func doSomething() {
        state += 1
    }
}

