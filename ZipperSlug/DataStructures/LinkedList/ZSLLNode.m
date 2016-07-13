//
//  ZSLLNode.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/27/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSLLNode.h"

@implementation ZSLLNode
@synthesize value;


-(instancetype)init
{
    if (self = [super init])
    {
        self.value = nil;
        self.next = nil;
    }
    
    return self;
}


-(nonnull instancetype)initWithValue:(nonnull id)v
{
    if (self = [self init])
    {
        self.value = v;
    }
    
    return self;
}


@end
