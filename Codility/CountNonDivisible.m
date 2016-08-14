//
//  CountNonDivisible.m
//  Codility
//
//  Created by Burrows on 16/8/14.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

/**
 @see https://github.com/BurrowsWang/Codility_Objective-c
 
 CountNonDivisible:
 
 You are given a non-empty zero-indexed array A consisting of N integers.
 
 For each number A[i] such that 0 ≤ i < N, we want to count the number of elements of the array that are not the divisors of A[i]. We say that these elements are non-divisors.
 
 For example, consider integer N = 5 and array A such that:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 3
 A[4] = 6
 For the following elements:
 
 A[0] = 3, the non-divisors are: 2, 6,
 A[1] = 1, the non-divisors are: 3, 2, 3, 6,
 A[2] = 2, the non-divisors are: 3, 3, 6,
 A[3] = 3, the non-divisors are: 2, 6,
 A[4] = 6, there aren't any non-divisors.
 Write a function:
 
 NSMutableArray * solution(NSMutableArray *A);
 that, given a non-empty zero-indexed array A consisting of N integers, returns a sequence of integers representing the amount of non-divisors.
 
 The sequence should be returned as:
 
 a structure Results (in C), or
 a vector of integers (in C++), or
 a record Results (in Pascal), or
 an array of integers (in any other programming language).
 For example, given:
 
 A[0] = 3
 A[1] = 1
 A[2] = 2
 A[3] = 3
 A[4] = 6
 the function should return [2, 4, 3, 2, 0], as explained above.
 
 Assume that:
 
 N is an integer within the range [1..50,000];
 each element of array A is an integer within the range [1..2 * N].
 Complexity:
 
 expected worst-case time complexity is O(N*log(N));
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 
 */

#import "CountNonDivisible.h"

@implementation CountNonDivisible

+ (NSMutableArray *)solution:(NSMutableArray *)A {
    NSInteger count = [A count];
    
    // stores the count of number i, 3 for example
    NSMutableArray *factorCounts = [NSMutableArray arrayWithCapacity:2 * count];
    // stores divisor count of number i, (3,1,3) for example (all factors that can divide 3)
    NSMutableArray *divisorCounts = [NSMutableArray arrayWithCapacity:2 * count];
    
    for (int i = 0; i <= 2 * count; i++) {
        [factorCounts addObject:@(0)];
        [divisorCounts addObject:@(0)];
    }
    
    for (int i = 0; i < count; i++) {
        int factor = [A[i] intValue];
        
        // occerance count of each number
        factorCounts[factor] = @([factorCounts[factor] intValue] + 1);
    }
    
    int j = 0;
    
    for (int i = 1; i <= 2 * count; i++) {
        j = i;
        
        while (j <= 2 * count) {
            // divisor count of each number
            divisorCounts[j] = @([divisorCounts[j] intValue] + [factorCounts[i] intValue]);
            
            j += i;
        }
    }
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++) {
        int factor = [A[i] intValue];
        
        // total - divisors = non-divisors
        [result addObject:@(count - [divisorCounts[factor] intValue])];
    }
    
    return result;
}

@end
