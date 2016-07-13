//
//  ZSSearch.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/10/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSSearch.h"
#import "ZSCompare.h"


@implementation ZSSearch


NSInteger linearSearch(NSArray *l, NSInteger count, id val)
{
    NSInteger indexOfVal = NSNotFound;
    
    for (NSInteger i = 0; i < count; i++)
    {
        if ([l[i] isEqual:val])
        {
            indexOfVal = i;
            break;
        }
    }
    
    return indexOfVal;
}


NSInteger betterLinearSearch(NSArray *l, NSInteger count, id val)
{
    for (NSInteger i = 0; i < count; i++)
        if ([l[i] isEqual:val])
            return i;
    
    return NSNotFound;
}


NSInteger sentinelLinearSearch(NSMutableArray *l, NSInteger count, id val)
{
    id last = l[count - 1];
    l[count - 1] = val;
    
    NSInteger i = 0;
    while (![l[i] isEqual:val])
    {
        i++;
    }
    
    l[count - 1] = last;
    
    if (i < (count - 1) || [l[i] isEqual:val])
        return i;
    else
        return NSNotFound;
}


NSInteger recursiveLinearSearch(NSMutableArray *l, NSUInteger count, NSUInteger i, id val)
{
    if (i >= count)
        return NSNotFound;
    
    if ([l[i] isEqual:val])
        return i;
    
    return recursiveLinearSearch(l, count, i+1, val);
}


NSInteger binarySearch(NSArray *b, NSInteger count, id val)
{
    NSInteger p = 0;
    NSInteger r = count - 1;
    NSInteger q;
    
    while (p <= r)
    {
        q = floor((r + p) / 2);
        
        ZSComparisonResult cr = compare(b[q], val);
        if (cr == ZSCR_EQUAL_TO)
            return q;
        else if (cr == ZSCR_LESS_THAN)
            r = q - 1;
        else if (cr == ZSCR_GREATER_THAN)
            p = q + 1;
    }
    
    return NSNotFound;
}


NSInteger recursiveBinarySearch(NSArray *b, NSInteger count, id val, NSUInteger p, NSUInteger r)
{
    if (p > r)
        return NSNotFound;
    
    NSUInteger q = floor((p + r) / 2);
    ZSComparisonResult cr = compare(b[q], val);
    if (cr == ZSCR_EQUAL_TO)
        return q;
    else if (cr == ZSCR_LESS_THAN)
        return recursiveBinarySearch(b, count, val, p, q - 1);
    else if (cr == ZSCR_GREATER_THAN)
        return recursiveBinarySearch(b, count, val, q + 1, r);
    else
        return NSNotFound;
}


@end
