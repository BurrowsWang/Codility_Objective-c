//
//  CyclicRotation.m
//  Codility
//
//  Created by Burrows on 16/7/27.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

/**
 @see https://github.com/BurrowsWang/Codility_Objective-c
 
 CyclicRotation:
 
 A zero-indexed array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is also moved to the first place.
 
 For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7]. The goal is to rotate array A K times; that is, each element of A will be shifted to the right by K indexes.
 
 Write a function:
 
 NSMutableArray * solution(NSMutableArray *A, int K);
 that, given a zero-indexed array A consisting of N integers and an integer K, returns the array A rotated K times.
 
 For example, given array A = [3, 8, 9, 7, 6] and K = 3, the function should return [9, 7, 6, 3, 8].
 
 Assume that:
 
 N and K are integers within the range [0..100];
 each element of array A is an integer within the range [−1,000..1,000].
 In your solution, focus on correctness. The performance of your solution will not be the focus of the assessment.
 
 */

#import "CyclicRotation.h"

@implementation CyclicRotation

+ (NSMutableArray *)solution:(NSMutableArray *)A K:(int)K {
    NSInteger count = [A count];
    NSMutableArray *result = [A mutableCopy];
    
    for (int i = 0; i < count; i++) {
        int index = (i + K) % count;
        result[index] = A[i];
    }
    
    return result;
}

@end
