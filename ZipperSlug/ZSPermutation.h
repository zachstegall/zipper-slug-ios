//
//  ZSPermutation.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/10/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSPermutation : NSObject

/**
 
 
 @param ul number of unique letters
 @param gs size of each combination group of letters
 @return An array of NSString letter combinations
 */
+(NSArray *)createLetterCombinations:(NSInteger)ul GroupSize:(NSInteger)gs;

@end
