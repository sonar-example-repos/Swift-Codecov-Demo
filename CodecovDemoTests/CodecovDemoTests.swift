//
//  CodecovDemoTests.swift
//  CodecovDemoTests
//
//  Created by Grace on 11/02/2021.
//

import XCTest
@testable import CodecovDemo

class CodecovDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNameInitialization() {
        let nameInit = Person(firstName: "Grace", lastName: "Njoroge")
        XCTAssertNotNil(nameInit)
        XCTAssertEqual(nameInit.firstName, "Grace")
        XCTAssertEqual(nameInit.lastName, "Njoroge")
    }
    
    // MARK: - BadCode Tests
    
    func testCalculateSomething() {
        let badCode = BadCode()
        let result = badCode.calculateSomething(value: 10)
        XCTAssertEqual(result, 10 * 42 + 13 - 7 * 3 + 99)
    }
    
    func testExecuteQuery() {
        let badCode = BadCode()
        let query = badCode.executeQuery(userInput: "John")
        XCTAssertTrue(query.contains("John"))
        
        // Test SQL injection vulnerability
        let maliciousQuery = badCode.executeQuery(userInput: "'; DROP TABLE users; --")
        XCTAssertTrue(maliciousQuery.contains("DROP TABLE"))
    }
    
    func testMonsterMethod() {
        let badCode = BadCode()
        
        // Test various paths
        let result1 = badCode.monsterMethod(a: 10, b: 10, c: 10, d: 10, e: 10)
        XCTAssertEqual(result1, 50)
        
        let result2 = badCode.monsterMethod(a: 100, b: 100, c: 100, d: 100, e: 100)
        XCTAssertEqual(result2, 400)  // 500 * 2 = 1000, then / 2 = 500, then - 100 = 400
        
        let result3 = badCode.monsterMethod(a: 1, b: 1, c: 1, d: 1, e: 0)
        XCTAssertEqual(result3, 4)
    }
    
    func testDivide() {
        let badCode = BadCode()
        let result = badCode.divide(a: 10, b: 2)
        XCTAssertEqual(result, 5)
        
        // This should crash but we can't test it directly
        // let crashResult = badCode.divide(a: 10, b: 0)
    }
    
    func testProcessUserDuplication() {
        let badCode = BadCode()
        
        // Test duplicated functions
        badCode.processUserA(name: "alice", age: 25)
        badCode.processUserB(name: "bob", age: 30)
        // Both should work the same way
    }
    
    func testGetThirdElement() {
        let badCode = BadCode()
        let array = [1, 2, 3, 4, 5]
        let result = badCode.getThirdElement(array: array)
        XCTAssertEqual(result, 3)
        
        // This would crash with smaller array:
        // let smallArray = [1, 2]
        // let _ = badCode.getThirdElement(array: smallArray)
    }
    
    func testDangerousOperation() {
        let badCode = BadCode()
        // This should not crash even though it catches errors
        badCode.dangerousOperation()
    }
    
    func testGenerateRandomToken() {
        let badCode = BadCode()
        let token1 = badCode.generateRandomToken()
        let token2 = badCode.generateRandomToken()
        
        XCTAssertGreaterThanOrEqual(token1, 0)
        XCTAssertLessThan(token1, 1000)
        XCTAssertGreaterThanOrEqual(token2, 0)
        XCTAssertLessThan(token2, 1000)
    }
    
    func testWasteMemory() {
        let badCode = BadCode()
        badCode.wasteMemory()
        // Function completes without crash
    }
    
    func testCreateRetainCycle() {
        let badCode = BadCode()
        badCode.createRetainCycle()
        XCTAssertNotNil(badCode.closureProperty)
    }
    
    func testOldFunction() {
        let badCode = BadCode()
        badCode.oldFunction()
        // Should complete without issues
    }
    
    func testReadFile() {
        let badCode = BadCode()
        
        // Test normal filename
        let result1 = badCode.readFile(filename: "test.txt")
        // Will return nil because file doesn't exist
        XCTAssertNil(result1)
        
        // Test path traversal attempt
        let result2 = badCode.readFile(filename: "../../../etc/passwd")
        // Also nil because we don't have permission
        XCTAssertNil(result2)
    }
    
    func testConfusingLogic() {
        let badCode = BadCode()
        
        XCTAssertEqual(badCode.confusingLogic(value: -5), "negative")
        XCTAssertEqual(badCode.confusingLogic(value: 0), "zero")
        XCTAssertEqual(badCode.confusingLogic(value: 5), "small")
        XCTAssertEqual(badCode.confusingLogic(value: 50), "medium")
        XCTAssertEqual(badCode.confusingLogic(value: 500), "large")
        XCTAssertEqual(badCode.confusingLogic(value: 5000), "huge")
    }
    
    func testDoSomething() {
        let badCode = BadCode()
        badCode.doSomething(value: "test", flag1: true, flag2: false, flag3: true)
        // Should complete without crash
    }
    
    func testWeakEncryption() {
        let badCode = BadCode()
        let encrypted = badCode.weakEncryption(text: "Hello")
        XCTAssertNotEqual(encrypted, "Hello")
        XCTAssertGreaterThan(encrypted.count, 0)
    }
    
    func testForceCast() {
        let badCode = BadCode()
        
        // Test successful cast
        let stringObject: Any = "Test String"
        let result = badCode.forceCast(object: stringObject)
        XCTAssertEqual(result, "Test String")
        
        // This would crash:
        // let intObject: Any = 42
        // let _ = badCode.forceCast(object: intObject)
    }
    
    func testGetMagicStrings() {
        let badCode = BadCode()
        let strings = badCode.getMagicStrings()
        XCTAssertEqual(strings.count, 4)
        XCTAssertTrue(strings.contains("ERROR_CODE_001"))
    }
    
    func testStoreSensitiveData() {
        let badCode = BadCode()
        badCode.storeSensitiveData(creditCard: "1234-5678-9012-3456", ssn: "123-45-6789")
        
        // Verify data was stored (insecurely!)
        let storedCC = UserDefaults.standard.string(forKey: "creditCard")
        XCTAssertEqual(storedCC, "1234-5678-9012-3456")
        
        // Clean up
        UserDefaults.standard.removeObject(forKey: "creditCard")
        UserDefaults.standard.removeObject(forKey: "socialSecurity")
        UserDefaults.standard.removeObject(forKey: "password")
    }
    
    func testTooManyParameters() {
        let badCode = BadCode()
        badCode.tooManyParameters(
            param1: "a",
            param2: 1,
            param3: true,
            param4: 1.0,
            param5: "b",
            param6: 2,
            param7: false,
            param8: "c",
            param9: 3,
            param10: 2.0
        )
        // Should complete
    }
    
    func testIncrementCounter() {
        let badCode = BadCode()
        let initialValue = badCode.sharedCounter
        badCode.incrementCounter()
        XCTAssertEqual(badCode.sharedCounter, initialValue + 1)
    }
    
    func testSwitchWithoutDefault() {
        let badCode = BadCode()
        XCTAssertEqual(badCode.switchWithoutDefault(value: 1), "one")
        XCTAssertEqual(badCode.switchWithoutDefault(value: 2), "two")
        XCTAssertEqual(badCode.switchWithoutDefault(value: 999), "")
    }
    
    func testSilentFailure() {
        let badCode = BadCode()
        
        // Test with valid array
        badCode.silentFailure(optionalArray: [1, 2, 3])
        
        // Test with nil (should handle silently)
        badCode.silentFailure(optionalArray: nil)
    }
    
    func testGlobalCounter() {
        let initialValue = globalCounter
        globalCounter += 1
        XCTAssertEqual(globalCounter, initialValue + 1)
    }
    
    func testBadSingleton() {
        let singleton = BadSingleton.shared
        let initialState = singleton.state
        singleton.doSomething()
        XCTAssertEqual(singleton.state, initialState + 1)
    }
    
    func testHardcodedCredentials() {
        // Test that hardcoded credentials exist (vulnerability!)
        XCTAssertFalse(API_KEY.isEmpty)
        XCTAssertFalse(PASSWORD.isEmpty)
        XCTAssertFalse(SECRET_TOKEN.isEmpty)
        
        XCTAssertEqual(PASSWORD, "admin123")
    }
    
    func testGodClass() {
        let badCode = BadCode()
        
        // Test that god class has too many responsibilities
        XCTAssertNotNil(badCode.cache)
        XCTAssertNotNil(badCode.networkManager)
        XCTAssertNotNil(badCode.databaseConnection)
        
        badCode.handleNetworking()
        badCode.handleDatabase()
        badCode.handleLogging()
        badCode.handleConfiguration()
        badCode.handleCaching()
        badCode.handleAuthentication()
        badCode.handleValidation()
    }
    
    // Test performance of monster method
    func testMonsterMethodPerformance() {
        let badCode = BadCode()
        measure {
            for _ in 0..<1000 {
                let _ = badCode.monsterMethod(a: 10, b: 20, c: 30, d: 40, e: 50)
            }
        }
    }

}
