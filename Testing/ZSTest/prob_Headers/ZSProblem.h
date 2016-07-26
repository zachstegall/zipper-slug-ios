//
//  ZSProblem.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/19/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZSTree.h"

@interface ZSProblem : NSObject

/**
 
 
 @param
 @param
 @return
*/
+(NSArray *)fibonacciCountdown:(NSInteger)num;

/**
 
 
 @param
 @param
 @return
*/
+(BOOL)isString:(NSString *)sub subStringOf:(NSString *)full;

/**
 
 
 @param
 @param
 @return
*/
+(NSString *)equationFromTree:(ZSTree *)t;

@end
