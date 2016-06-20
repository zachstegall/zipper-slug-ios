//
//  ZSCompare.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/10/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSCompare.h"


@implementation ZSCompare


void swap(NSMutableArray *a, NSInteger i1, NSInteger i2)
{
    if (!a || [a count] == 0 ||
        i1 == i2 ||
        i1 < 0 || i1 >= [a count] ||
        i2 < 0 || i2 >= [a count])
        return;
    
    id temp1 = a[i1];
    id temp2 = a[i2];
    
    [a removeObjectAtIndex:i1];
    [a insertObject:temp2 atIndex:i1];
    
    [a removeObjectAtIndex:i2];
    [a insertObject:temp1 atIndex:i2];
}


enum ZSComparisonResult compare(id i1, id i2)
{
    if ([i1 isKindOfClass:[NSNumber class]])
    {
        if (strcmp([i1 objCType], @encode(NSInteger)) == 0)
        {
            if ([i1 integerValue] > [i2 integerValue])
                return ZSCR_GREATER_THAN;
            else if ([i1 integerValue] < [i2 integerValue])
                return ZSCR_LESS_THAN;
            else
                return ZSCR_EQUAL_TO;
        }
        else if (strcmp([i1 objCType], @encode(NSUInteger)))
        {
            if ([i1 unsignedIntegerValue] > [i2 unsignedIntegerValue])
                return ZSCR_GREATER_THAN;
            else if ([i1 unsignedIntegerValue] < [i2 unsignedIntegerValue])
                return ZSCR_LESS_THAN;
            else
                return ZSCR_EQUAL_TO;
        }
        else if (strcmp([i1 objCType], @encode(double)) == 0)
        {
            if ([i1 doubleValue] > [i2 doubleValue])
                return ZSCR_GREATER_THAN;
            else if ([i1 doubleValue] < [i2 doubleValue])
                return ZSCR_LESS_THAN;
            else
                return ZSCR_EQUAL_TO;
        }
        else if (strcmp([i1 objCType], @encode(float)) == 0)
        {
            if ([i1 floatValue] > [i2 floatValue])
                return ZSCR_GREATER_THAN;
            else if ([i1 floatValue] < [i2 floatValue])
                return ZSCR_LESS_THAN;
            else
                return ZSCR_EQUAL_TO;
        }
        
        return ZSCR_INVALID;
    }
    else if ([i1 isKindOfClass:[NSString class]])
    {
        return convertComparison([i1 compare:i2]);
    }
    
    return ZSCR_INVALID;
}


enum ZSComparisonResult convertComparison(NSComparisonResult r)
{
    switch (r)
    {
        case NSOrderedSame:
            return ZSCR_EQUAL_TO;
        case NSOrderedDescending:
            return ZSCR_GREATER_THAN;
        case NSOrderedAscending:
            return ZSCR_LESS_THAN;
        default:
            return ZSCR_INVALID;
    }
}


@end
