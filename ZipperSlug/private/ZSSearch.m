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


NSInteger binarySearch(NSArray *a, id val)
{
    NSInteger start = 0;
    NSInteger end = [a count] - 1;
    NSInteger mid = floor((end - start) / 2);
    
    while (true)
    {
        if (start > end)
            return -1;
        
        enum ZSComparisonResult cr = compare(val, a[mid]);
        if (cr == ZSCR_EQUAL_TO)
        {
            return mid;
        }
        else if (cr == ZSCR_GREATER_THAN)
        {
            start = mid;
        }
        else
        {
            end = mid;
        }
        
        mid = floor((end - start) / 2) + start;
    }
}


NSInteger recursiveBinarySearch(NSArray *a,
                                id val,
                                NSInteger start,
                                NSInteger end)
{
    return 0;
}


@end
