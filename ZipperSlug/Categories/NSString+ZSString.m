//
//  NSString+ZSString.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 7/20/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "NSString+ZSString.h"

@implementation NSString (ZSString)

-(NSArray<NSString *> *)componentsSeparatedByString:(NSString *)separator keepSeparator:(BOOL)include
{
    if (!include)
        return [self componentsSeparatedByString:separator];
    
    if (separator == nil)
        return [[NSArray alloc] init];
    
    
    NSUInteger pos = 0;
    NSMutableArray *a = [[NSMutableArray alloc] init];
    NSString *sub = nil;
    NSRange r;
    
    void (^updateSub)(NSString*, NSRange) = ^(NSString *sub, NSRange r)
    {
        sub = [self substringWithRange:NSMakeRange(pos, self.length - pos)];
        r = [sub rangeOfString:@"*"];
    };
    
    updateSub(sub, r);
    while (r.length > 0)
    {
        [a addObject:[self substringWithRange:NSMakeRange(pos, pos + r.location)]];
        // [a addObject:[sub substringWithRange:NSMakeRange(0, sub.length - 1)];
        [a addObject:@"*"];
        
        pos += r.location + 1;
        updateSub(sub, r);
    }
    
    if (sub.length > 0)
    {
        [a addObject:sub];
    }
    
    return a;
}

-(NSArray<NSString *> *)componentsSeparatedByString_v2:(NSString *)separator keepSeparator:(BOOL)include
{
    if (!include)
        return [self componentsSeparatedByString:separator];
    
    if (separator == nil)
        return [[NSArray alloc] init];
    
    const char *characters = [self cStringUsingEncoding:self.fastestEncoding];
    char sep[self.length][self.length];
    
    int i = 0;
    int s = 0;
    int t = 0;
    while (i < self.length)
    {
        if (characters[i] == '*')
        {
            s++;
            t = 0;
            sep[s][t] = characters[i];
        }
        else if (i > 0 && characters[i-1] == '*')
        {
            s++;
            t = 0;
            sep[s][t] = characters[i];
            t++;
        }
        else
        {
            sep[s][t] = characters[i];
            t++;
        }
    }
    
    
    NSMutableArray *a = [[NSMutableArray alloc] init];
    i = 0;
    while (sep[i] != '\0')
    {
        [a addObject:[[NSString alloc] initWithCString:sep[i] encoding:NSUTF8StringEncoding]];
        i++;
    }
    
    return a;
}

@end
