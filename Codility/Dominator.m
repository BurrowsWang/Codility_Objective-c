//
//  Dominator.m
//  Codility
//
//  Created by Burrows on 16/7/30.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

/**
 @see https://github.com/BurrowsWang/Codility_Objective-c
 
 Dominator:
 
 A zero-indexed array A consisting of N integers is given. The dominator of array A is the value that occurs in more than half of the elements of A.
 
 For example, consider array A such that
 
 A[0] = 3    A[1] = 4    A[2] =  3
 A[3] = 2    A[4] = 3    A[5] = -1
 A[6] = 3    A[7] = 3
 The dominator of A is 3 because it occurs in 5 out of 8 elements of A (namely in those with indices 0, 2, 4, 6 and 7) and 5 is more than a half of 8.
 
 Write a function
 
 int solution(NSMutableArray *A);
 that, given a zero-indexed array A consisting of N integers, returns index of any element of array A in which the dominator of A occurs. The function should return −1 if array A does not have a dominator.
 
 Assume that:
 
 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
 For example, given array A such that
 
 A[0] = 3    A[1] = 4    A[2] =  3
 A[3] = 2    A[4] = 3    A[5] = -1
 A[6] = 3    A[7] = 3
 the function may return 0, 2, 4, 6 or 7, as explained above.
 
 Complexity:
 
 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(1), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 
 */

#import "Dominator.h"

@implementation Dominator

+ (int)solution:(NSMutableArray *)A {
    NSInteger count = [A count];
    
    if (count == 0) {
        return -1;
    }
    
    int dominatorCount = 1;
    int dominatorValue = [A[0] intValue];
    
    for (int i = 1; i < count; i++) {
        int currentValue = [A[i] intValue];
        
        if (dominatorCount == 0) {
            dominatorCount = 1;
            dominatorValue = currentValue;
        }
        else if (dominatorValue == currentValue) {
            dominatorCount++;
        }
        else {
            dominatorCount--;
        }
    }
    
    int totalDominators = 0;
    int dominatorIndex = -1;
    
    for (int i = 0; i < count; i++) {
        int currentValue = [A[i] intValue];
        
        if (currentValue == dominatorValue) {
            if (dominatorIndex < 0) {
                dominatorIndex = i;
            }
            
            totalDominators++;
        }
    }
    
    if (totalDominators <= count / 2) {
        return -1;
    }
    else {
        return dominatorIndex;
    }
}

@end
