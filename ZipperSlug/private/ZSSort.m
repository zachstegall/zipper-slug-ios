//
//  ZSSort.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/9/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSSort.h"
#import "ZSCompare.h"


@implementation ZSSort


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
    NSInteger p = start;
    for (NSInteger i = start; i < end; i++)
    {
        ZSComparisonResult cr = compare(q[i], q[end]);
        if (cr == ZSCR_LESS_THAN ||
            cr == ZSCR_EQUAL_TO)
        {
            swap(q, p, i);
            p++;
        }
    }
    
    swap(q, p, end);
    return p;
    
    
    
    /*
    id pVal = q[end];
    NSInteger i = start;
    
    for (NSInteger j = start; j <= end; j++)
    {
        ZSComparisonResult cr = compare(pVal, q[j]);
        if (cr == ZSCR_GREATER_THAN)
        {
            swap(q, i, j);
            i++;
        }
    }
    
    swap(q, i, end);
    return i;
    */
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
            ZSComparisonResult lr = compare(l[j], r[k]);
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
