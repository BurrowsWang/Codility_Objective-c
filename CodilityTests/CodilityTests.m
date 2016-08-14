//
//  CodilityTests.m
//  CodilityTests
//
//  Created by Burrows on 16/7/27.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "CountSemiprimes.h"

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

- (void)testCountSemiprimes {
    int N = 26;
    NSMutableArray *P = [@[@(1), @(4), @(16)] mutableCopy];
    NSMutableArray *Q = [@[@(26), @(10), @(20)] mutableCopy];
    NSMutableArray *expected = [@[@(10), @(4), @(0)] mutableCopy];
    
    [self measureBlock:^{
        NSMutableArray *result = [CountSemiprimes solution:N P:P Q:Q];
        XCTAssert([result isEqualToArray:expected], @"CountSemiprimes Error");
    }];
}

@end
