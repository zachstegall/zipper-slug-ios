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
#import "ZSConversion.h"


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



#pragma mark - Create


+(NSArray *)createLetterCombinations:(NSInteger)ul GroupSize:(NSInteger)gs
{
    static NSUInteger first = 97;   // lowercase a
    static NSUInteger max = 25;     // a - z
    
    NSMutableArray *groupArray = [NSMutableArray array];
    NSInteger letterCount = MIN(max, ul);
    
    NSMutableArray *letters = [NSMutableArray array];
    for (NSInteger i = 0; i < letterCount; i++)
    {
        NSString *bs = binaryStringFromCharValue(first + i);
        char c = characterFromBinaryString(bs);
        NSString *l = [NSString stringWithFormat:@"%c", c];
        [letters addObject:l];
    }
    
    NSMutableArray *pointers = [NSMutableArray array];
    for (NSInteger i = 0; i < gs; i++)
    {
        [pointers addObject:[NSNumber numberWithInteger:0]];
    }
    
    while (!isCreationComplete(pointers, [letters count]))
    {
        [groupArray addObject:stringFromPointers(pointers, letters)];
        updatePointers(pointers, [letters count]);
    }
    
    [groupArray addObject:stringFromPointers(pointers, letters)];
    return groupArray;
}



#pragma mark - Create Helpers


/**
 
 
 @param
 @param
 @return
*/
BOOL isCreationComplete(NSArray *pointers, NSInteger highestIndex)
{
    for (NSNumber *n in pointers)
    {
        if ([n integerValue] < (highestIndex - 1))
            return false;
    }
    
    return true;
}

/**
 
 
 @param
 @param
 @return
*/
NSString *stringFromPointers(NSMutableArray *pointers, NSArray *allLetters)
{
    NSMutableString *s = [NSMutableString string];
    for (NSNumber *n in pointers)
    {
        [s appendString:[allLetters objectAtIndex:[n integerValue]]];
    }
    
    return s;
}

/**
 
 
 @param
 @param
 @return
*/
void updatePointers(NSMutableArray *pointers, NSInteger highestIndex)
{
    BOOL incrementNext = true;
    NSInteger i = [pointers count] - 1;
    while (i >= 0 && incrementNext)
    {
        NSInteger v = [[pointers objectAtIndex:i] integerValue];
        v++;
        
        if (v < highestIndex)
        {
            incrementNext = false;
        }
        else
        {
            v = 0;
        }
        
        [pointers setObject:[NSNumber numberWithInteger:v] atIndexedSubscript:i];
        i--;
    }
}


@end
