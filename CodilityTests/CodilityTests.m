//
//  CodilityTests.m
//  CodilityTests
//
//  Created by Burrows on 16/7/27.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "MaxCounters.h"

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
    NSMutableArray *A = [@[@(3), @(4), @(4), @(6), @(1), @(4), @(4)] mutableCopy];
    int N = 5;
    
    NSMutableArray *expected = [@[@(3), @(2), @(2), @(4), @(2)] mutableCopy];
    
    [self measureBlock:^{
        NSMutableArray *result = [MaxCounters solution:N A:A];
        XCTAssertEqualObjects(result, expected, @"MAXCounters error");
    }];
}

@end
