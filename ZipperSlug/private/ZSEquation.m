//
//  ZSEquation.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/9/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSEquation.h"

@implementation ZSEquation


NSInteger combinations(NSInteger groupSize, NSInteger arraySize)
{
    //      a!
    // -----------
    // g! * (a - g)!
    //
    return ((factorial(arraySize)) / (factorial(groupSize) * factorial(arraySize - groupSize)));
}



#pragma mark - Helpers


/**
 
 
 @param
 @param
 @return
*/
NSInteger factorial(NSInteger f)
{
    if (f == 0)
        return 1;
    
    NSInteger x = f;
    for (NSInteger i = (f - 1); i > 0; i--)
    {
        x *= i;
    }
    
    return x;
}


@end
