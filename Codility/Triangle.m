//
//  Triangle.m
//  Codility
//
//  Created by Burrows on 16/7/30.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

/**
 @see https://github.com/BurrowsWang/Codility_Objective-c
 
 Triangle:
 
 A zero-indexed array A consisting of N integers is given. A triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:
 
 A[P] + A[Q] > A[R],
 A[Q] + A[R] > A[P],
 A[R] + A[P] > A[Q].
 For example, consider array A such that:
 
 A[0] = 10    A[1] = 2    A[2] = 5
 A[3] = 1     A[4] = 8    A[5] = 20
 Triplet (0, 2, 4) is triangular.
 
 Write a function:
 
 int solution(NSMutableArray *A);
 that, given a zero-indexed array A consisting of N integers, returns 1 if there exists a triangular triplet for this array and returns 0 otherwise.
 
 For example, given array A such that:
 
 A[0] = 10    A[1] = 2    A[2] = 5
 A[3] = 1     A[4] = 8    A[5] = 20
 the function should return 1, as explained above. Given array A such that:
 
 A[0] = 10    A[1] = 50    A[2] = 5
 A[3] = 1
 the function should return 0.
 
 Assume that:
 
 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
 Complexity:
 
 expected worst-case time complexity is O(N*log(N));
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 
 */

#import "Triangle.h"

@implementation Triangle

+ (int)solution:(NSMutableArray *)A {
    [A sortUsingSelector:@selector(compare:)];
    
    NSInteger count = [A count];
    
    for (int i = 0; i < count - 2; i++) {
        // min,medium,max
        // medium + max > min always true
        // min + max > medium always true
        // so we just need to check if min + medium > max
        if ([A[i] intValue] + [A[i + 1] intValue] > [A[i + 2] intValue]) {
            return 1;
        }
    }
    
    return 0;
}

@end
