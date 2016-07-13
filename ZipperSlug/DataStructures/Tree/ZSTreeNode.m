//
//  ZSTreeNode.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/27/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSTreeNode.h"

@implementation ZSTreeNode
@synthesize value;


-(instancetype)init
{
    if (self = [super init])
    {
        self.value = nil;
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
