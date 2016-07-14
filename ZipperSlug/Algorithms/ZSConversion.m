//
//  ZSConversion.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/9/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSConversion.h"

@implementation ZSConversion


NSString *binaryStringFromCharValue(NSInteger cVal)
{
    // A-Z  |  65-90
    // a-z  |  97-122
    static NSInteger maxIndex = 7;
    NSMutableString *base = [NSMutableString stringWithString:@"00000000"];
    
    for (NSInteger i = maxIndex; i >= 0; i--)
    {
        if (cVal <= 0)
            break;
        
        NSInteger p = pow(2, i);
        if (cVal >= p)
        {
            [base replaceCharactersInRange:NSMakeRange((maxIndex - i), 1)
                                withString:@"1"];
            cVal -= p;
        }
    }
    
    return base;
}


char characterFromBinaryString(NSString *bStr)
{
    const char *token_c = [bStr cStringUsingEncoding:NSUTF8StringEncoding];
    return (char)strtol(token_c, NULL, 2);
}


@end
