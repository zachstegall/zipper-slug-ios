//
//  ZSPermutation.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/10/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSPermutation.h"
#import "ZSConversion.h"
#import "ZSCompare.h"


@implementation ZSPermutation


#pragma mark - Create


+(NSArray *)createLetterPermutations:(NSInteger)ul GroupSize:(NSInteger)gs
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



#pragma mark - Get


+(NSArray *)getAllPermutations:(NSString *)letters
{
    return nil;
    /*
    NSMutableArray *lArray = letterArrayFromString(letters);
    for (NSInteger i = 0; i < [lArray count]; i++)
    {
        swap(lArray, i, [lArray count]-1);
        id pivot = lArray[i];
        
        
    }
    */
}



#pragma mark - Get Helpers


NSMutableArray *letterArrayFromString(NSString *letters)
{
    NSMutableArray *lArray = [NSMutableArray array];
    for (NSInteger i = 0; i < letters.length; i++)
    {
        [lArray addObject:[letters substringWithRange:NSMakeRange(i, 1)]];
    }
    
    return lArray;
}



@end
