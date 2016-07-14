//
//  ZSSearch.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/10/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSSearch : NSObject

/**
 <#description#>
 
 @param <#param 1#>
 @param <#param 2#>
 @return <#returns#>
*/
NSInteger linearSearch(NSArray *l, NSInteger count, id val);

/**
 <#description#>
 
 @param <#param 1#>
 @param <#param 2#>
 @return <#returns#>
*/
NSInteger betterLinearSearch(NSArray *l, NSInteger count, id val);

/**
 <#description#>
 
 @param <#param 1#>
 @param <#param 2#>
 @return <#returns#>
*/
NSInteger sentinelLinearSearch(NSMutableArray *l, NSInteger count, id val);

/**
 <#description#>
 
 @param <#param 1#>
 @param <#param 2#>
 @return <#returns#>
*/
NSInteger recursiveLinearSearch(NSMutableArray *l, NSUInteger count, NSUInteger i, id val);

/**
 
 
 @param
 @param
 @return
*/
NSInteger binarySearch(NSArray *b, NSInteger count, id val);

/**
 
 
 @param
 @param
 @return
*/
NSInteger recursiveBinarySearch(NSArray *b, NSInteger count, id val, NSUInteger p, NSUInteger r);

@end
