//
//  FibFrog.m
//  Codility
//
//  Created by wangruicheng on 9/3/16.
//  Copyright © 2016 burrowswang. All rights reserved.
//

/**
 @see https://github.com/BurrowsWang/Codility_Objective-c
 
 FibFrog:
 
 The Fibonacci sequence is defined using the following recursive formula:
 
 F(0) = 0
 F(1) = 1
 F(M) = F(M - 1) + F(M - 2) if M >= 2
 A small frog wants to get to the other side of a river. The frog is initially located at one bank of the river (position −1) and wants to get to the other bank (position N). The frog can jump over any distance F(K), where F(K) is the K-th Fibonacci number. Luckily, there are many leaves on the river, and the frog can jump between the leaves, but only in the direction of the bank at position N.
 
 The leaves on the river are represented in a zero-indexed array A consisting of N integers. Consecutive elements of array A represent consecutive positions from 0 to N − 1 on the river. Array A contains only 0s and/or 1s:
 
 0 represents a position without a leaf;
 1 represents a position containing a leaf.
 The goal is to count the minimum number of jumps in which the frog can get to the other side of the river (from position −1 to position N). The frog can jump between positions −1 and N (the banks of the river) and every position containing a leaf.
 
 For example, consider array A such that:
 
 A[0] = 0
 A[1] = 0
 A[2] = 0
 A[3] = 1
 A[4] = 1
 A[5] = 0
 A[6] = 1
 A[7] = 0
 A[8] = 0
 A[9] = 0
 A[10] = 0
 The frog can make three jumps of length F(5) = 5, F(3) = 2 and F(5) = 5.
 
 Write a function:
 
 int solution(NSMutableArray *A);
 that, given a zero-indexed array A consisting of N integers, returns the minimum number of jumps by which the frog can get to the other side of the river. If the frog cannot reach the other side of the river, the function should return −1.
 
 For example, given:
 
 A[0] = 0
 A[1] = 0
 A[2] = 0
 A[3] = 1
 A[4] = 1
 A[5] = 0
 A[6] = 1
 A[7] = 0
 A[8] = 0
 A[9] = 0
 A[10] = 0
 the function should return 3, as explained above.
 
 Assume that:
 
 N is an integer within the range [0..100,000];
 each element of array A is an integer that can have one of the following values: 0, 1.
 Complexity:
 
 expected worst-case time complexity is O(N*log(N));
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 
 */

#import "FibFrog.h"

@implementation FibFrog

+ (int)solution:(NSMutableArray *)A {
    NSInteger N = [A count];
    // all possible steps the frog can jump
    NSMutableArray *fibonaccis = [NSMutableArray array];
    
    int previous = 0;
    int next = 1;
    
    while (next <= N + 1) {
        [fibonaccis addObject:@(next)];
        
        int temp = previous;
        previous = next;
        next = temp + previous;
    }
    
    // check if the frog can reach the other side within one jump
    if ([[fibonaccis lastObject] intValue] == N + 1) {
        return 1;
    }
    
    NSInteger fCount = [fibonaccis count];
    int result = -1;
    
    // treat each leaf as the bank of this river
    for (int i = 0; i <= N; i++) {
        if (i == N || [A[i] intValue] == 1) {
            int min = INT_MAX;
            
            for (int j = 0; j < fCount && [fibonaccis[j] intValue] <= i + 1; j++) {
                int from = i - [fibonaccis[j] intValue];
                
                if (from == -1) {
                    min = 1;
                }
                else if ([A[from] intValue] > 0) {
                    if ([A[from] intValue] + 1 < min) {
                        // this leaf is better than the previous one
                        min = [A[from] intValue] + 1;
                    }
                }
            }
            
            if (i < N) {
                if (min == INT_MAX) {
                    // jump back from this leaf is vain, not possible
                    A[i] = @(0);
                }
                else {
                    // the minimum jumps needed backwardly
                    A[i] = @(min);
                }
            }
            else {
                if (min != INT_MAX) {
                    result = min;
                }
            }
        }
    }
    
    return result;
}

@end
