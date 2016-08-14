//
//  MaxDoubleSliceSum.m
//  Codility
//
//  Created by Burrows on 16/7/31.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

/**
 @see https://github.com/BurrowsWang/Codility_Objective-c
 
 MaxDoubleSliceSum:
 
 A non-empty zero-indexed array A consisting of N integers is given.
 
 A triplet (X, Y, Z), such that 0 ≤ X < Y < Z < N, is called a double slice.
 
 The sum of double slice (X, Y, Z) is the total of A[X + 1] + A[X + 2] + ... + A[Y − 1] + A[Y + 1] + A[Y + 2] + ... + A[Z − 1].
 
 For example, array A such that:
 
 A[0] = 3
 A[1] = 2
 A[2] = 6
 A[3] = -1
 A[4] = 4
 A[5] = 5
 A[6] = -1
 A[7] = 2
 contains the following example double slices:
 
 double slice (0, 3, 6), sum is 2 + 6 + 4 + 5 = 17,
 double slice (0, 3, 7), sum is 2 + 6 + 4 + 5 − 1 = 16,
 double slice (3, 4, 5), sum is 0.
 The goal is to find the maximal sum of any double slice.
 
 Write a function:
 
 int solution(NSMutableArray *A);
 that, given a non-empty zero-indexed array A consisting of N integers, returns the maximal sum of any double slice.
 
 For example, given:
 
 A[0] = 3
 A[1] = 2
 A[2] = 6
 A[3] = -1
 A[4] = 4
 A[5] = 5
 A[6] = -1
 A[7] = 2
 the function should return 17, because no double slice of array A has a sum of greater than 17.
 
 Assume that:
 
 N is an integer within the range [3..100,000];
 each element of array A is an integer within the range [−10,000..10,000].
 Complexity:
 
 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 
 */

#import "MaxDoubleSliceSum.h"

@implementation MaxDoubleSliceSum

+ (int)solution:(NSMutableArray *)A {
    NSInteger count = [A count];
    NSMutableArray *maxStartHere = [NSMutableArray arrayWithCapacity:count];
    NSMutableArray *maxEndHere = [NSMutableArray arrayWithCapacity:count];
    
    NSNumber *zero = @(0);
    for (int i = 0; i < count; i++) {
        [maxStartHere addObject:zero];
        [maxEndHere addObject:zero];
    }
    
    int maxEnd = 0;
    for (int i = 1; i < count; i++) {
        maxEnd = MAX(0, maxEnd + [A[i] intValue]);
        maxEndHere[i] = @(maxEnd);
    }
    
    int maxStart = 0;
    for (int i = (int)count - 2; i >= 0; i--) {
        maxStart = MAX(0, maxStart + [A[i] intValue]);
        maxStartHere[i] = @(maxStart);
    }
    
    int result = 0;
    for (int i = 1; i < count - 1; i++) {
        result = MAX(result, [maxEndHere[i - 1] intValue] + [maxStartHere[i + 1] intValue]);
    }
    
    return result;
}

@end
