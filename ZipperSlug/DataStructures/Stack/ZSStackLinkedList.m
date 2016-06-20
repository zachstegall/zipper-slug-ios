//
//  ZSStackLinkedList.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/20/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSStackLinkedList.h"
#import "ZSLinkedList.h"


@interface ZSStackLinkedList()
@property ZSLinkedList *linkedList;
@end


@implementation ZSStackLinkedList


-(instancetype)init
{
    if (self = [super init])
    {
        self.linkedList = [[ZSLinkedList alloc] init];
    }
    
    return self;
}


#pragma mark - Operations


-(void)push:(nonnull id)object
{
    if (object == nil)
        return;
    
    [self.linkedList addElement:object];
}


-(nullable id)pop
{
    if (self.linkedList.count == 0)
        return nil;
    
    ZSNode *tailNode = self.linkedList.tail;
    [self.linkedList removeTail];
    return tailNode.value;
}


-(nullable id)peek
{
    if (self.linkedList.count == 0)
        return nil;
    
    return self.linkedList.tail.value;
}


@end
