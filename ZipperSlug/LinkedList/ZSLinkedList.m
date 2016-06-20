//
//  ZSLinkedList.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/19/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSLinkedList.h"

@implementation ZSLinkedList


-(instancetype)init
{
    if (self = [super init])
    {
        self.head = nil;
        self.tail = nil;
    }
    
    return self;
}



#pragma mark - Setup


-(void)initNodes:(nonnull ZSNode *)n
{
    if (n == nil)
        return;
    
    self.head = n;
    self.tail = n;
}



#pragma mark - Operations (public)


-(void)addElement:(nonnull id)value
{
    if (value == nil)
        return;
    
    ZSNode *n = [[ZSNode alloc] initWithValue:value];
    if (self.head == nil)
    {
        [self initNodes:n];
    }
    else
    {
        [self updateTail:n];
    }
}


-(void)insertElementAtHead:(nonnull id)value
{
    if (value == nil)
        return;
    
    ZSNode *n = [[ZSNode alloc] initWithValue:value];
    if (self.head == nil)
    {
        [self initNodes:n];
    }
    else
    {
        [self updateHead:n];
    }
}


-(void)insertElement:(nonnull id)value afterValue:(nonnull id)aValue
{
    if (value == nil || aValue == nil || self.head == nil)
        return;
    
    ZSNode *c = [self nodeForElement:aValue];
    if (c != nil)
        [self insertElement:value afterNode:c];
}


-(void)insertElement:(nonnull id)value beforeValue:(nonnull id)bValue
{
    if (value == nil || bValue == nil || self.head == nil)
        return;
    
    ZSNode *p = nil;
    ZSNode *c = [self nodeForElement:bValue previousNode:&p];
    if (c != nil)
        [self insertElement:value beforeNode:c afterNode:p];
}


-(void)reverse
{
    if (self.head == nil || [self.head isEqual:self.tail])
        return;
    
    ZSNode *t1 = self.head;
    ZSNode *t2 = t1.next;
    self.head.next = nil;
    self.tail = self.head;
    
    while (t2 != nil)
    {
        ZSNode *t3 = t2.next;
        t2.next = t1;
        
        t1 = t2;
        t2 = t3;
    }
    
    self.head = t1;
}



#pragma mark - Operations (private)


-(void)updateTail:(ZSNode *)n
{
    if (n == nil)
        return;
    
    if (self.head == nil)
    {
        [self initNodes:n];
    }
    else
    {
        self.tail.next = n;
        self.tail = n;
    }
}


-(void)updateHead:(ZSNode *)n
{
    if (n == nil)
        return;
    
    if (self.head == nil)
    {
        [self initNodes:n];
    }
    else
    {
        n.next = self.head;
        self.head = n;
    }
}


-(void)insertElement:(nonnull id)value afterNode:(nonnull ZSNode *)aNode
{
    if (value == nil || aNode == nil)
        return;
    
    ZSNode *n = [[ZSNode alloc] initWithValue:value];
    n.next = aNode.next;
    aNode.next = n;
    
    if (aNode == self.tail)
    {
        [self updateTail:n];
    }
}


-(void)insertElement:(nonnull id)value beforeNode:(nonnull ZSNode *)bNode afterNode:(nullable ZSNode *)aNode
{
    if (value == nil || bNode == nil)
        return;
    
    ZSNode *n = [[ZSNode alloc] initWithValue:value];
    n.next = bNode;
    
    if (bNode == self.head)
    {
        [self updateHead:n];
    }
    else if (aNode != nil)
    {
        aNode.next = n;
    }
}



#pragma mark - Operation Helpers


-(nullable ZSNode *)nodeForElement:(nonnull id)value
{
    return [self nodeForElement:value previousNode:nil];
}


-(nullable ZSNode *)nodeForElement:(nonnull id)value previousNode:(ZSNode **)p
{
    if (value == nil)
        return nil;
    
    ZSNode *c = self.head;
    while (![c.value isEqual:value])
    {
        if (c.next == nil)
            return nil;
        
        if (p)
            *p = c;
        
        c = c.next;
    }
    
    return c;
}



@end
