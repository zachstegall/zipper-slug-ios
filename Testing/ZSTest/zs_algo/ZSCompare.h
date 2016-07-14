//
//  ZSCompare.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/10/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_OPTIONS (NSUInteger, ZSComparisonResult)
{
    ZSCR_INVALID        = 0,
    ZSCR_EQUAL_TO       = 1,
    ZSCR_GREATER_THAN   = 2,
    ZSCR_LESS_THAN      = 3
};


@interface ZSCompare : NSObject

/**
 
 
 @param
 @param
 @return
*/
void swap(NSMutableArray *a, NSInteger i1, NSInteger i2);

/**
 
 
 @param
 @param
 @return
*/
ZSComparisonResult compare(id i1, id i2);

@end
