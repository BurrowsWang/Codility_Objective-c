//
//  StoneWall.m
//  Codility
//
//  Created by Burrows on 16/7/30.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

/**
 @see https://github.com/BurrowsWang/Codility_Objective-c
 
 StoneWall:
 
 Solution to this task can be found at our blog.
 
 You are going to build a stone wall. The wall should be straight and N meters long, and its thickness should be constant; however, it should have different heights in different places. The height of the wall is specified by a zero-indexed array H of N positive integers. H[I] is the height of the wall from I to I+1 meters to the right of its left end. In particular, H[0] is the height of the wall's left end and H[N−1] is the height of the wall's right end.
 
 The wall should be built of cuboid stone blocks (that is, all sides of such blocks are rectangular). Your task is to compute the minimum number of blocks needed to build the wall.
 
 Write a function:
 
 int solution(NSMutableArray *H);
 that, given a zero-indexed array H of N positive integers specifying the height of the wall, returns the minimum number of blocks needed to build it.
 
 For example, given array H containing N = 9 integers:
 
 H[0] = 8    H[1] = 8    H[2] = 5
 H[3] = 7    H[4] = 9    H[5] = 8
 H[6] = 7    H[7] = 4    H[8] = 8
 the function should return 7. The figure shows one possible arrangement of seven blocks.
 
 ![ILLUSTRATOR](https://codility-frontend-prod.s3.amazonaws.com/media/task_img/stone_wall/media/auto/mp2e167f4181a5967a0844fbd70a3a5bfb.png)
 
 Assume that:
 
 N is an integer within the range [1..100,000];
 each element of array H is an integer within the range [1..1,000,000,000].
 Complexity:
 
 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
 Elements of input arrays can be modified.
 
 */

#import "StoneWall.h"

@implementation StoneWall

+ (int)solution:(NSMutableArray *)H {
    NSInteger count = [H count];
    int stoneCount = 0;
    NSMutableArray *stack = [NSMutableArray array];
    
    for (int i = 0; i < count; i++) {
        int currentHeight = [H[i] intValue];
        
        // expand the stone toward right
        while ([stack count] > 0 && [[stack lastObject] intValue] > currentHeight) {
            [stack removeLastObject];
        }
        
        if ([stack count] > 0 && [[stack lastObject] intValue] == currentHeight) {
            continue;
        }
        else {
            stoneCount++;
            
            // laid a stone
            [stack addObject:H[i]];
        }
    }
    
    return stoneCount;
}

@end
