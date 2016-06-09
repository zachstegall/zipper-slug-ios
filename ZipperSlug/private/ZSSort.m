//
//  ZSSort.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/9/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSSort.h"


NS_OPTIONS (NSUInteger, ZSComparisonResult)
{
    ZSCR_INVALID        = 0,
    ZSCR_EQUAL_TO       = 1,
    ZSCR_GREATER_THAN   = 2,
    ZSCR_LESS_THAN      = 3
};


@implementation ZSSort


/**
 
 
 @param
 @param
 @return
 */
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


/**
 <#description#>
 
 @param <#param 1#>
 @param <#param 2#>
 @return <#returns#>
 */
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



#pragma mark - Quick Sort


void quickSort(NSMutableArray *q, NSInteger start, NSInteger end)
{
    if (!q || [q count] == 0 ||
        start > end ||
        start < 0 || start >= [q count] ||
        end < 0 || end >= [q count])
        return;
    
    NSInteger pIndex = qs_Partition(q, start, end);
    quickSort(q, start, pIndex - 1);
    quickSort(q, pIndex + 1, end);
}


/**
 <#description#>
 
 @param <#param 1#>
 @param <#param 2#>
 @return <#returns#>
 */
NSInteger qs_Partition(NSMutableArray *q, NSInteger start, NSInteger end)
{
    // quickSort(q, s, e) has the safety checks
    //
    id pVal = q[end];
    NSInteger i = start;
    
    for (NSInteger j = start; j <= end; j++)
    {
        enum ZSComparisonResult cr = compare(pVal, q[j]);
        if (cr == ZSCR_GREATER_THAN)
        {
            swap(q, i, j);
            i++;
        }
    }
    
    swap(q, i, end);
    return i;
}



#pragma mark - Merge Sort


void mergeSort(NSMutableArray *m, NSInteger start, NSInteger end)
{
    if (!m || [m count] == 0 ||
        start >= end ||
        start < 0 || start >= [m count] ||
        end < 0 || end >= [m count])
        return;
    
    NSInteger pIndex = start + floorf((end - start) / 2);
    mergeSort(m, start, pIndex);
    mergeSort(m, pIndex + 1, end);
    ms_Merge(m, start, pIndex, end);
}


void ms_Merge(NSMutableArray *m, NSInteger start, NSInteger pivot, NSInteger end)
{
    static id sentinel = @"SENTINEL_STOP";
    
    NSMutableArray *l = [[m subarrayWithRange:NSMakeRange(start, (pivot - start)+1)] mutableCopy];
    NSMutableArray *r = [[m subarrayWithRange:NSMakeRange(pivot + 1, (end - pivot))] mutableCopy];
    
    [l addObject:sentinel];
    [r addObject:sentinel];
    
    NSInteger j = 0;
    NSInteger k = 0;
    for (NSInteger o = start; o <= end; o++)
    {
        BOOL lHitSentinel = [l[j] isEqual:sentinel];
        BOOL rHitSentinel = [r[k] isEqual:sentinel];
        
        if (lHitSentinel && rHitSentinel)
        {
            break;
        }
        else if (lHitSentinel)
        {
            m[o] = r[k];
            k++;
        }
        else if (rHitSentinel)
        {
            m[o] = l[j];
            j++;
        }
        else
        {
            enum ZSComparisonResult lr = compare(l[j], r[k]);
            if (lr == ZSCR_LESS_THAN)
            {
                m[o] = l[j];
                j++;
            }
            else
            {
                m[o] = r[k];
                k++;
            }
        }
    }
}


@end
