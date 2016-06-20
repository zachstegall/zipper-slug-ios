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
 
 
 @param
 @param
 @return
*/
NSInteger binarySearch(NSArray *a, id val);

/**
 
 
 @param
 @param
 @return
*/
NSInteger recursiveBinarySearch(NSArray *a, id val, NSInteger start, NSInteger end);

@end
