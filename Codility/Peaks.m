//
//  Peaks.m
//  Codility
//
//  Created by Burrows on 16/7/31.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

/**
 @see https://github.com/BurrowsWang/Codility_Objective-c
 
 Peaks:
 
 A non-empty zero-indexed array A consisting of N integers is given.
 
 A peak is an array element which is larger than its neighbors. More precisely, it is an index P such that 0 < P < N − 1,  A[P − 1] < A[P] and A[P] > A[P + 1].
 
 For example, the following array A:
 
 A[0] = 1
 A[1] = 2
 A[2] = 3
 A[3] = 4
 A[4] = 3
 A[5] = 4
 A[6] = 1
 A[7] = 2
 A[8] = 3
 A[9] = 4
 A[10] = 6
 A[11] = 2
 has exactly three peaks: 3, 5, 10.
 
 We want to divide this array into blocks containing the same number of elements. More precisely, we want to choose a number K that will yield the following blocks:
 
 A[0], A[1], ..., A[K − 1],
 A[K], A[K + 1], ..., A[2K − 1],
 ...
 A[N − K], A[N − K + 1], ..., A[N − 1].
 What's more, every block should contain at least one peak. Notice that extreme elements of the blocks (for example A[K − 1] or A[K]) can also be peaks, but only if they have both neighbors (including one in an adjacent blocks).
 
 The goal is to find the maximum number of blocks into which the array A can be divided.
 
 Array A can be divided into blocks as follows:
 
 one block (1, 2, 3, 4, 3, 4, 1, 2, 3, 4, 6, 2). This block contains three peaks.
 two blocks (1, 2, 3, 4, 3, 4) and (1, 2, 3, 4, 6, 2). Every block has a peak.
 three blocks (1, 2, 3, 4), (3, 4, 1, 2), (3, 4, 6, 2). Every block has a peak. Notice in particular that the first block (1, 2, 3, 4) has a peak at A[3], because A[2] < A[3] > A[4], even though A[4] is in the adjacent block.
 However, array A cannot be divided into four blocks, (1, 2, 3), (4, 3, 4), (1, 2, 3) and (4, 6, 2), because the (1, 2, 3) blocks do not contain a peak. Notice in particular that the (4, 3, 4) block contains two peaks: A[3] and A[5].
 
 The maximum number of blocks that array A can be divided into is three.
 
 Write a function:
 
 int solution(NSMutableArray *A);
 that, given a non-empty zero-indexed array A consisting of N integers, returns the maximum number of blocks into which A can be divided.
 
 If A cannot be divided into some number of blocks, the function should return 0.
 
 For example, given:
 
 A[0] = 1
 A[1] = 2
 A[2] = 3
 A[3] = 4
 A[4] = 3
 A[5] = 4
 A[6] = 1
 A[7] = 2
 A[8] = 3
 A[9] = 4
 A[10] = 6
 A[11] = 2
 the function should return 3, as explained above.
 
 Assume that:
 
 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [0..1,000,000,000].
 Complexity:
 
 expected worst-case time complexity is O(N*log(log(N)));
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 
 */

#import "Peaks.h"

@implementation Peaks

+ (int)solution:(NSMutableArray *)A {
    NSInteger count = [A count];
    
    if (count < 3) {
        return 0;
    }
    
    NSMutableArray *peaksHere = [NSMutableArray arrayWithObject:@(0)];
    int preValue = [A[0] intValue];
    int curValue = [A[1] intValue];
    int peaks = 0;
    [peaksHere addObject:@(peaks)];
    
    for (int i = 1; i < count - 1; i++) {
        int nextValue = [A[i + 1] intValue];
        
        if (curValue > preValue && curValue > nextValue) {
            peaks++;
        }
        
        [peaksHere addObject:@(peaks)];
        preValue = curValue;
        curValue = nextValue;
    }
    
    [peaksHere addObject:@(peaks)];
    
    int result = 0;
    for (int i = 1; i <= count / 2; i++) {
        // equally divide
        if (count % i == 0) {
            int blocks = (int)count / i;
            
            // if peak has been found in every block
            BOOL allFound = YES;
            
            for (int j = 1; j <= i; j++) {
                int blockStart = (j - 1) * blocks;
                int blockEnd = j * blocks;
                
                // check peak count in this block
                if ([peaksHere[blockEnd] intValue] - [peaksHere[blockStart] intValue] == 0) {
                    allFound = NO;
                    break;
                }
            }
            
            if (allFound) {
                result = i;
            }
        }
    }
    
    return result;
}

@end
