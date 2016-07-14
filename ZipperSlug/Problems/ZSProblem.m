//
//  ZSProblem.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/19/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSProblem.h"

@implementation ZSProblem


#pragma mark - Fibonacci


+(NSArray *)fibonacciCountdown:(NSInteger)num
{
    NSMutableArray *f = [NSMutableArray array];
    fibonacciSequence(f, num);
    return f;
}



#pragma mark - Fibonacci Helpers


NSInteger fibonacciSequence(NSMutableArray *sequenceArray, NSInteger num)
{
    NSInteger i = 0;
    if (num > 2)
    {
        i = fibonacciSequence(sequenceArray, num - 1) + fibonacciSequence(sequenceArray, num - 2);
    }
    else if (0 < num && num < 3)
    {
        i = 1;
    }
    
    NSNumber *n = [NSNumber numberWithInteger:i];
    [sequenceArray addObject:n];
    return i;
}



@end
