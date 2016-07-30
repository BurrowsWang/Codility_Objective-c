//
//  NumberOfDiscIntersections.m
//  Codility
//
//  Created by Burrows on 16/7/30.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

/**
 @see https://github.com/BurrowsWang/Codility_Objective-c
 
 NumberOfDiscIntersections:
 
 We draw N discs on a plane. The discs are numbered from 0 to N − 1. A zero-indexed array A of N non-negative integers, specifying the radiuses of the discs, is given. The J-th disc is drawn with its center at (J, 0) and radius A[J].
 
 We say that the J-th disc and K-th disc intersect if J ≠ K and the J-th and K-th discs have at least one common point (assuming that the discs contain their borders).
 
 The figure below shows discs drawn for N = 6 and A as follows:
 
 A[0] = 1
 A[1] = 5
 A[2] = 2
 A[3] = 1
 A[4] = 4
 A[5] = 0
 
 ![ILLUSTRATOR](https://codility-frontend-prod.s3.amazonaws.com/media/task_img/number_of_disc_intersections/media/auto/mpaecfada7c1e52a7b01b04916c859b15d.png)
 
 There are eleven (unordered) pairs of discs that intersect, namely:
 
 discs 1 and 4 intersect, and both intersect with all the other discs;
 disc 2 also intersects with discs 0 and 3.
 Write a function:
 
 int solution(NSMutableArray *A);
 that, given an array A describing N discs as explained above, returns the number of (unordered) pairs of intersecting discs. The function should return −1 if the number of intersecting pairs exceeds 10,000,000.
 
 Given array A shown above, the function should return 11, as explained above.
 
 Assume that:
 
 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [0..2,147,483,647].
 Complexity:
 
 expected worst-case time complexity is O(N*log(N));
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 
 */

#import "NumberOfDiscIntersections.h"

@implementation NumberOfDiscIntersections

+ (int)solution:(NSMutableArray *)A {
    // left edge points count at this moment
    NSMutableDictionary *startPoints = [NSMutableDictionary dictionary];
    // right edge points count at this moment
    NSMutableDictionary *endPoints = [NSMutableDictionary dictionary];
    NSInteger count = [A count];
    
    for (int i = 0; i < count; i++) {
        int radius = [A[i] intValue];
        NSNumber *startPoint = @(MAX(i - radius, 0));
        
        if (startPoints[startPoint]) {
            int pointCount = [startPoints[startPoint] intValue] + 1;
            startPoints[startPoint] = @(pointCount);
        }
        else {
            startPoints[startPoint] = @(1);
        }
        
        NSNumber *endPoint = @(MIN(i + radius, count - 1));
        
        if (endPoints[endPoint]) {
            int pointCount = [endPoints[endPoint] intValue] + 1;
            endPoints[endPoint] = @(pointCount);
        }
        else {
            endPoints[endPoint] = @(1);
        }
    }
    
    int result = 0;
    int intersectingDiscs = 0;
    
    for (int i = 0; i < count; i++) {
        intersectingDiscs += [startPoints[@(i)] intValue];
        
        int endCount = [endPoints[@(i)] intValue];
        
        for (int j = 0; j < endCount; j++) {
            // intersect every left edge with each right edge
            result += (intersectingDiscs - 1);
            
            if (result > 10000000) {
                return -1;
            }
            
            intersectingDiscs--;
        }
    }
    
    return result;
}

@end
