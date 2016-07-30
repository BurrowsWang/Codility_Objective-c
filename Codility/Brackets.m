//
//  Brackets.m
//  Codility
//
//  Created by Burrows on 16/7/30.
//  Copyright © 2016年 burrowswang. All rights reserved.
//

/**
 @see https://github.com/BurrowsWang/Codility_Objective-c
 
 Brackets:
 
 A string S consisting of N characters is considered to be properly nested if any of the following conditions is true:
 
 S is empty;
 S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
 S has the form "VW" where V and W are properly nested strings.
 For example, the string "{[()()]}" is properly nested but "([)()]" is not.
 
 Write a function:
 
 int solution(NSString *S);
 that, given a string S consisting of N characters, returns 1 if S is properly nested and 0 otherwise.
 
 For example, given S = "{[()()]}", the function should return 1 and given S = "([)()]", the function should return 0, as explained above.
 
 Assume that:
 
 N is an integer within the range [0..200,000];
 string S consists only of the following characters: "(", "{", "[", "]", "}" and/or ")".
 Complexity:
 
 expected worst-case time complexity is O(N);
 expected worst-case space complexity is O(N) (not counting the storage required for input arguments).
 
 */

#import "Brackets.h"

@implementation Brackets

+ (int)solution:(NSString *)S {
    NSMutableArray *starts = [NSMutableArray array];
    
    unichar start1 = '(';
    unichar start2 = '{';
    unichar start3 = '[';
    unichar end1 = ')';
    unichar end2 = '}';
    unichar end3 = ']';
    
    NSInteger length = [S length];
    
    for (int i = 0; i < length; i++) {
        unichar c = [S characterAtIndex:i];
        
        if (c == start1 || c == start2 || c == start3) {
            [starts addObject:@(c)];
        }
        else {
            unichar lastC = [[starts lastObject] charValue];
            
            if ((lastC == start1 && c == end1)
                || (lastC == start2 && c == end2)
                || (lastC == start3 && c == end3)) {
                [starts removeLastObject];
            }
            else {
                return 0;
            }
        }
    }
    
    return [starts count] > 0 ? 0 : 1;
}

@end
