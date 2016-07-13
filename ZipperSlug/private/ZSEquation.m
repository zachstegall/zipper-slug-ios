//
//  ZSEquation.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/9/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSEquation.h"

@implementation ZSEquation


NSUInteger factorial(NSUInteger num)
{
    if (num == 0)
        return 1;
    
    return num * factorial(num - 1);
}


NSInteger combinations(NSInteger groupSize, NSInteger arraySize)
{
    //      a!
    // -----------
    // g! * (a - g)!
    //
    return ((factorial(arraySize)) / (factorial(groupSize) * factorial(arraySize - groupSize)));
}


@end
