// This file is autogenerated.
// Take a look at `Preprocessor` target in RxSwift project 
//
//  Observable+MultipleTest+CombineLatest.tt
//  RxSwift
//
//  Created by Krunoslav Zaher on 4/25/15.
//  Copyright (c) 2015 Krunoslav Zaher. All rights reserved.
//

import Foundation
import XCTest
import RxSwift

// combine latest
extension ObservableMultipleTest {
    func testCombineLatest_Never2() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1)
        ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1)
        ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (_, _) -> Int in
                return (42)
            }
        }
        
        XCTAssertEqual(res.messages, [])
        
        let subscriptions = [Subscription(200, 1000)]
        
        for e in [e0, e1] {
            XCTAssertEqual(e.subscriptions, subscriptions)
        }
    }
    
    func testCombineLatest_NeverEmpty() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1)
        ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            completed(210)
        ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 1000)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 210)])
    }
    
    func testCombineLatest_EmptyNever() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            completed(210)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 210)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 1000)])
    }
    
    func testCombineLatest_Empty2() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            completed(210)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            completed(220)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (_, _) -> Int in
                return (42)
            }
        }
        
        XCTAssertEqual(res.messages, [completed(220)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 210)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_EmptyReturn() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            completed(210)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            completed(220)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [completed(215)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 210)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 215)])
    }
    
    func testCombineLatest_ReturnEmpty() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            completed(220)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            completed(210)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [completed(215)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 215)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 210)])
    }
    
    func testCombineLatest_NeverReturn() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            completed(220)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 1000)])
    }

    func testCombineLatest_ReturnNever() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            completed(220)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 1000)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_ReturnReturn1() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            completed(230)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(220, 3),
            completed(240)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [next(220, (2 + 3)), completed(240)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 230)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 240)])
    }

    func testCombineLatest_ReturnReturn2() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(220, 3),
            completed(240)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            completed(230)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [next(220, (2 + 3)), completed(240)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 240)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 230)])
    }
    
    func testCombineLatest_EmptyError() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            completed(230)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            error(220, testError)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(220, testError)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_ErrorEmpty() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            error(220, testError)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            completed(230)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(220, testError)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_ReturnThrow() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(210, 2),
            completed(230)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            error(220, testError)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(220, testError)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_ThrowReturn() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            error(220, testError)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(210, 2),
            completed(230)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(220, testError)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_ThrowThrow1() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            error(220, testError1),
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            error(230, testError2),
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(220, testError1)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_ThrowThrow2() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            error(230, testError1),
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            error(220, testError2),
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(220, testError2)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_ErrorThrow() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(210, 2),
            error(220, testError1),
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            error(230, testError2),
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(220, testError1)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_ThrowError() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            error(230, testError2),
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(210, 2),
            error(220, testError1),
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(220, testError1)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_SomeThrow() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            completed(230)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            error(220, testError),
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(220, testError)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_ThrowSome() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            error(220, testError),
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            completed(230)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(220, testError)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_ThrowAfterCompleteLeft() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            completed(220)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            error(230, testError),
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(230, testError)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 230)])
    }
    
    func testCombineLatest_ThrowAfterCompleteRight() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            error(230, testError),
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            completed(220)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(230, testError)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 230)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_TestInterleavedWithTail() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            next(225, 4),
            completed(230)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(220, 3),
            next(230, 5),
            next(235, 6),
            next(240, 7),
            completed(250)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        let messages = [
            next(220, 2 + 3),
            next(225, 3 + 4),
            next(230, 4 + 5),
            next(235, 4 + 6),
            next(240, 4 + 7),
            completed(250)
        ]
        
        XCTAssertEqual(res.messages, messages)
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 230)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 250)])
    }
    
    func testCombineLatest_Consecutive() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            next(225, 4),
            completed(230)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(235, 6),
            next(240, 7),
            completed(250)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        let messages = [
            next(235, 4 + 6),
            next(240, 4 + 7),
            completed(250)
        ]
        
        XCTAssertEqual(res.messages, messages)
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 230)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 250)])
    }
    
    func testCombineLatest_ConsecutiveEndWithErrorLeft() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            next(225, 4),
            error(230, testError)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(235, 6),
            next(240, 7),
            completed(250)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [error(230, testError)])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 230)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 230)])
    }
    
    func testCombineLatest_ConsecutiveEndWithErrorRight() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            next(225, 4),
            completed(250)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(235, 6),
            next(240, 7),
            error(245, testError)
            ])
        
        let res = scheduler.start {
            combineLatest(e0, e1) { (x1, x2) -> Int in
                return (x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [
            next(235, 4 + 6),
            next(240, 4 + 7),
            error(245, testError)
            ])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 245)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 245)])
    }
    
    func testCombineLatest_SelectorThrows() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(215, 2),
            completed(230)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(220, 3),
            completed(240)
            ])
        
        let res = scheduler.start {
            combineLatestOrDie(e0, e1) { (x1, x2) -> Result<Int> in
                return .Error(testError)
            }
        }
        
        XCTAssertEqual(res.messages, [
            error(220, testError)
            ])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 220)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 220)])
    }
    
    func testCombineLatest_WillNeverBeAbleToCombine2() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            completed(250)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(500, 3),
            completed(800)
            ])
        
        let res = scheduler.start {
            combineLatestOrDie(e0, e1) { (x1, x2) -> Result<Int> in
                return .Error(testError)
            }
        }
        
        XCTAssertEqual(res.messages, [
            completed(500)
            ])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 250)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 500)])
    }
    
    func testCombineLatest_Typical2() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let e0 = scheduler.createHotObservable([
            next(150, 1),
            next(210, 1),
            next(410, 3),
            completed(800)
            ])
        
        let e1 = scheduler.createHotObservable([
            next(150, 1),
            next(220, 2),
            next(420, 4),
            completed(800)
            ])
        
        let res = scheduler.start {
            combineLatestOrDie(e0, e1) { (x1, x2) -> Result<Int> in
                return success(x1 + x2)
            }
        }
        
        XCTAssertEqual(res.messages, [
            next(220, 3),
            next(410, 5),
            next(420, 7),
            completed(800)
            ])
        
        XCTAssertEqual(e0.subscriptions, [Subscription(200, 800)])
        XCTAssertEqual(e1.subscriptions, [Subscription(200, 800)])
    }
}