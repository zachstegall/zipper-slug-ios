//
//  NSString+ZSString.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 7/20/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZSString)

-(NSArray<NSString *> *)componentsSeparatedByString:(NSString *)separator keepSeparator:(BOOL)include;
-(NSArray<NSString *> *)componentsSeparatedByString_v2:(NSString *)separator keepSeparator:(BOOL)include;

@end
