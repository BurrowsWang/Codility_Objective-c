//
//  CodilityTests.m
//  CodilityTests
//
//  Created by Burrows on 16/7/27.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Dominator.h"

@interface CodilityTests : XCTestCase

@end

@implementation CodilityTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMaxCounters {
    NSMutableArray *A = [@[@(3), @(4), @(3), @(2), @(3), @(-1), @(3), @(3)] mutableCopy];
    int expected = 7;
    
    [self measureBlock:^{
        int result = [Dominator solution:A];
        XCTAssert(result == expected, @"Dominator error");
    }];
}

@end
