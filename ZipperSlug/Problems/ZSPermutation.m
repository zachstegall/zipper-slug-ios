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
    NSMutableString *lettersMutable = [letters mutableCopy];
    NSMutableArray *allPermutations = [NSMutableArray array];
    for (NSInteger i = 0; i < lettersMutable.length; i++)
    {
        if (lettersMutable.length > 3)
        {
            NSRange r = NSMakeRange(1, (lettersMutable.length - 1));
            NSArray *pLessThan = [self getAllPermutations:[lettersMutable substringWithRange:r]];
            
            NSRange r1 = NSMakeRange(0, 1);
            NSArray *pFC = fillCombos([lettersMutable substringWithRange:r1], pLessThan);
            [allPermutations addObjectsFromArray:pFC];
        }
        else
        {
            NSMutableArray *lArray = letterArrayFromString(lettersMutable);
            [allPermutations addObjectsFromArray:getCombos(lArray)];
        }
        
        rotateString(lettersMutable);
    }
    
    return allPermutations;
}



#pragma mark - Get Helpers


NSArray *getCombos(NSMutableArray *letters)
{
    NSMutableArray *c = [NSMutableArray array];
    
    if ([letters count] < 2)
    {
        return letters;
    }
    else if ([letters count] == 2)
    {
        [c addObject:letters];
        NSMutableArray *lettersCopy = [letters mutableCopy];
        swap(lettersCopy, 0, 1);
        [c addObject:lettersCopy];
    }
    else // [letters count] > 2
    {
        NSRange r = NSMakeRange(1, ([letters count] - 1));
        NSArray *mc = getCombos([[letters subarrayWithRange:r] mutableCopy]);
        NSArray *fc = fillCombos(letters[0], mc);
        [c addObjectsFromArray:fc];
    }
    
    return c;
}


NSArray *fillCombos(id value1, NSArray *subArray)
{
    NSMutableArray *f = [NSMutableArray array];
    
    for (NSArray *a in subArray)
    {
        NSMutableArray *m = [NSMutableArray array];
        [m addObject:value1];
        [m addObjectsFromArray:a];
        
        [f addObject:m];
    }
    
    return f;
}


void rotate(NSMutableArray *letters)
{
    id t = letters[0];
    [letters removeObjectAtIndex:0];
    [letters addObject:t];
}


void rotateString(NSMutableString *letters)
{
    NSString *a = [letters substringWithRange:NSMakeRange(0, 1)];
    [letters replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];
    [letters appendString:a];
}


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
