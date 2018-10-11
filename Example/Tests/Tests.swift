import XCTest
import Strongroom

class Tests: XCTestCase {
    
    let count = 100
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //    func testExample() {
    //        // This is an example of a functional test case.
    //        XCTAssert(true, "Pass")
    //    }
    //
    //    func testPerformanceExample() {
    //        // This is an example of a performance test case.
    //        self.measure() {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
    func runTests(safe: StrongroomSafe) {
        for i in 0..<count {
            let key = "testNSCoding: \(i)"
            let value = NSString(string: key)
            Strongroom.setValue(value, forKey: key, safe: safe)
            let result: NSString? = Strongroom.getValue(forKey: key, safe: safe)
            XCTAssert(result == value)
        }
        
        for i in 0..<count {
            let key = "testBool: \(i)"
            let value = (i % 2) == 0
            Strongroom.setValue(value, forKey: key, safe: safe)
            let result: Bool? = Strongroom.getValue(forKey: key, safe: safe)
            XCTAssert(result == value)
        }
        
        for i in 0..<count {
            let key = "testString: \(i)"
            let value = key
            Strongroom.setValue(value, forKey: key, safe: safe)
            let result: String? = Strongroom.getValue(forKey: key, safe: safe)
            XCTAssert(result == value)
        }
        
        for i in 0..<count {
            let key = "testInt: \(i)"
            let value = i
            Strongroom.setValue(value, forKey: key, safe: safe)
            let result: Int? = Strongroom.getValue(forKey: key, safe: safe)
            XCTAssert(result == value)
        }
        
        for i in 0..<count {
            let key = "testFloat: \(i)"
            let value = Float(i)
            Strongroom.setValue(value, forKey: key, safe: safe)
            let result: Float? = Strongroom.getValue(forKey: key, safe: safe)
            XCTAssert(result == value)
        }
        
        for i in 0..<count {
            let key = "testDouble: \(i)"
            let value = Double(i)
            Strongroom.setValue(value, forKey: key, safe: safe)
            let result: Double? = Strongroom.getValue(forKey: key, safe: safe)
            XCTAssert(result == value)
        }
    }
    
    func testUserDefaultsSafe() {
        self.measure {
            let safe = UserDefaultsSafe()
            runTests(safe: safe)
        }
    }
    
    func testNSCacheSafe() {
        self.measure {
            let safe = NSCacheSafe()
            runTests(safe: safe)
        }
    }
}
