//
//  ZSConversion.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/9/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSConversion : NSObject

/**
 
 
 @param
 @param
 @return
*/
NSString *binaryStringFromCharValue(NSInteger cVal);

/**
 
 
 @param
 @param
 @return
*/
char characterFromBinaryString(NSString *bStr);

@end
