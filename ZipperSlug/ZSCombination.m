//
//  ZSCombination.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/9/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSCombination.h"
#import "ZSEquation.h"
#import "ZSSort.h"


@implementation ZSCombination


#pragma mark - Search


+(NSArray *)findAllCombinations:(NSArray *)allValues
{
    NSMutableDictionary *d = [NSMutableDictionary dictionary];
    NSMutableArray *allCombinations = [NSMutableArray array];
    
    for (NSInteger i = 1; i <= [allValues count]; i++)
    {
        NSMutableArray *a = [NSMutableArray array];
        NSArray *prev = [d objectForKey:@(i-1)];
        if (prev)
        {
            for (NSArray *p in prev)
            {
                for (NSNumber *v in allValues)
                {
                    NSMutableArray *r = [NSMutableArray arrayWithArray:p];
                    if (!duplicateNumber(v, r))
                    {
                        [r addObject:v];
                        quickSort(r, 0, [r count]-1);
                        
                        if (!duplicateGroup(r, a))
                            [a addObject:r];
                    }
                }
            }
        }
        else
        {
            for (NSNumber *v in allValues)
            {
                [a addObject:@[v]];
            }
        }
        
        [d setObject:a forKey:@(i)];
        [allCombinations addObjectsFromArray:a];
    }
    
    return allCombinations;
}


+(NSInteger)totalCombinations:(NSInteger)valCount
{
    NSInteger combinationCount = 0;
    for (NSInteger i = 1; i <= valCount; i++)
    {
        combinationCount += combinations(i, valCount);
    }
    return combinationCount;
}



#pragma mark - Search Helpers


BOOL duplicateNumber(NSNumber *n, NSArray *a)
{
    return [a containsObject:n];
}

BOOL duplicateGroup(NSArray *g, NSArray *a)
{
    return [a containsObject:g];
}


@end
