//
//  CountSemiprimes.m
//  Codility
//
//  Created by Burrows on 16/8/2.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

/**
 @see https://github.com/BurrowsWang/Codility_Objective-c
 
 CountSemiprimes:
 
 A prime is a positive integer X that has exactly two distinct divisors: 1 and X. The first few prime integers are 2, 3, 5, 7, 11 and 13.
 
 A semiprime is a natural number that is the product of two (not necessarily distinct) prime numbers. The first few semiprimes are 4, 6, 9, 10, 14, 15, 21, 22, 25, 26.
 
 You are given two non-empty zero-indexed arrays P and Q, each consisting of M integers. These arrays represent queries about the number of semiprimes within specified ranges.
 
 Query K requires you to find the number of semiprimes within the range (P[K], Q[K]), where 1 ≤ P[K] ≤ Q[K] ≤ N.
 
 For example, consider an integer N = 26 and arrays P, Q such that:
 
 P[0] = 1    Q[0] = 26
 P[1] = 4    Q[1] = 10
 P[2] = 16   Q[2] = 20
 The number of semiprimes within each of these ranges is as follows:
 
 (1, 26) is 10,
 (4, 10) is 4,
 (16, 20) is 0.
 Write a function:
 
 NSMutableArray * solution(int N, NSMutableArray *P, NSMutableArray *Q);
 that, given an integer N and two non-empty zero-indexed arrays P and Q consisting of M integers, returns an array consisting of M elements specifying the consecutive answers to all the queries.
 
 For example, given an integer N = 26 and arrays P, Q such that:
 
 P[0] = 1    Q[0] = 26
 P[1] = 4    Q[1] = 10
 P[2] = 16   Q[2] = 20
 the function should return the values [10, 4, 0], as explained above.
 
 Assume that:
 
 N is an integer within the range [1..50,000];
 M is an integer within the range [1..30,000];
 each element of arrays P, Q is an integer within the range [1..N];
 P[i] ≤ Q[i].
 Complexity:
 
 expected worst-case time complexity is O(N*log(log(N))+M);
 expected worst-case space complexity is O(N+M), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 
 */

#import "CountSemiprimes.h"

@implementation CountSemiprimes

+ (NSMutableArray *)solution:(int)N P:(NSMutableArray *)P Q:(NSMutableArray *)Q {
    // stores the minimum factor of 1...N
    NSMutableArray *factors = [NSMutableArray arrayWithCapacity:N];
    
    for (int i = 0; i <= N; i++) {
        [factors addObject:@(0)];
    }
    
    int i = 2;
    
    while (i * i <= N) {
        int factor = [factors[i] intValue];
        
        if (factor == 0) {
            int k = i * i;
            
            while (k <= N) {
                if ([factors[k] intValue] == 0) {
                    factors[k] = @(i);
                }
                
                k += i;
            }
        }
        
        i += 1;
    }
    
    int semiprimeCount = 0;
    // stores the semiprimes count until 1...N
    NSMutableArray *semiprimesHere = [NSMutableArray arrayWithCapacity:N];
    
    for (int j = 0; j < N + 1; j++) {
        if (j >= 4) {
            int minimumFactor = [factors[j] intValue];
            
            // semiprime = minfactor * another prime
            if (minimumFactor != 0 && [factors[j / minimumFactor] intValue] == 0) {
                semiprimeCount++;
            }
        }
        
        [semiprimesHere addObject:@(semiprimeCount)];
    }
    
    NSInteger M = [P count];
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:M];
    
    for (int j = 0; j < M; j++) {
        int queryStart = [P[j] intValue] - 1;
        int queryEnd = [Q[j] intValue];
        int countInRange = [semiprimesHere[queryEnd] intValue] - [semiprimesHere[queryStart] intValue];
        
        [result addObject:@(countInRange)];
    }
    
    return result;
}

@end
