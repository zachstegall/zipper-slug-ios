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
 @param gs size of each permutation group of letters
 @return An array of NSString letter permutation
 */
+(NSArray *)createLetterPermutations:(NSInteger)ul GroupSize:(NSInteger)gs;

@end
