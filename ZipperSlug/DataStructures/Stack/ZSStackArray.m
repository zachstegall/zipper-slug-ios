//
//  ZSStackArray.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/20/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSStackArray.h"


@interface ZSStackArray()
@property NSMutableArray *stack;
@end


@implementation ZSStackArray


-(instancetype)init
{
    if (self = [super init])
    {
        self.stack = [NSMutableArray array];
    }
    
    return self;
}


#pragma mark - Operations


-(void)push:(nonnull id)object
{
    if (object == nil)
        return;
    
    [self.stack addObject:object];
}


-(nullable id)pop
{
    NSInteger index = ([self.stack count] - 1);
    if (index < 0)
        return nil;
    
    id lastObject = [self.stack objectAtIndex:index];
    [self.stack removeObjectAtIndex:index];
    return lastObject;
}


-(nullable id)peek
{
    if ([self.stack count] == 0)
        return nil;
    
    return [self.stack objectAtIndex:([self.stack count] - 1)];
}


@end
