//
//  ZSStack.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/20/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSStack.h"
#import "ZSStackArray.h"
#import "ZSStackLinkedList.h"


@interface ZSStack()

@end


@implementation ZSStack


+(nonnull instancetype)initWithInternalDataStructure:(ZSStackInternalDataStructure)ds
{
    switch (ds)
    {
        case ZS_STACK_LINKED_LIST:
            return [[ZSStackLinkedList alloc] init];
            
        case ZS_STACK_ARRAY:
        default:
            return [[ZSStackArray alloc] init];
    }
}



-(void)push:(nonnull id)object
{
    // to be subclassed
}

-(nullable id)pop
{
    // to be subclassed
    return nil;
}

-(nullable id)peek
{
    // to be subclassed
    return nil;
}


@end
