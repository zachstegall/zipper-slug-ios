//
//  ZSLinkedList.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/19/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSLinkedList.h"


@interface ZSLinkedList()
@property (readwrite) NSUInteger count;
@end


@implementation ZSLinkedList


-(instancetype)init
{
    if (self = [super init])
    {
        self.head = nil;
        self.tail = nil;
        self.count = 0;
    }
    
    return self;
}



#pragma mark - Setup


-(void)initNodes:(nonnull ZSLLNode *)n
{
    if (n == nil)
        return;
    
    self.head = n;
    self.tail = n;
    self.count = 1;
}



#pragma mark - Operations (public)


-(void)addElement:(nonnull id)value
{
    if (value == nil)
        return;
    
    ZSLLNode *n = [[ZSLLNode alloc] initWithValue:value];
    if (self.head == nil)
    {
        [self initNodes:n];
    }
    else
    {
        [self updateTail:n];
        [self incrementCount];
    }
}


-(void)insertElementAtHead:(nonnull id)value
{
    if (value == nil)
        return;
    
    ZSLLNode *n = [[ZSLLNode alloc] initWithValue:value];
    if (self.head == nil)
    {
        [self initNodes:n];
    }
    else
    {
        [self updateHead:n];
        [self incrementCount];
    }
}


-(void)insertElement:(nonnull id)value afterValue:(nonnull id)aValue
{
    if (value == nil || aValue == nil || self.head == nil)
        return;
    
    ZSLLNode *c = [self nodeForElement:aValue];
    if (c != nil)
    {
        [self insertElement:value afterNode:c];
        [self incrementCount];
    }
}


-(void)insertElement:(nonnull id)value beforeValue:(nonnull id)bValue
{
    if (value == nil || bValue == nil || self.head == nil)
        return;
    
    ZSLLNode *p = nil;
    ZSLLNode *c = [self nodeForElement:bValue previousNode:&p];
    if (c != nil)
    {
        [self insertElement:value beforeNode:c afterNode:p];
        [self incrementCount];
    }
}


-(void)removeHead
{
    if (self.head == nil)
        return;
    
    if (self.count == 1)
    {
        self.head = nil;
        self.tail = nil;
    }
    else
    {
        id t = self.head.next;
        self.head = nil;
        self.head = t;
    }
    
    [self decrementCount];
}


-(void)removeTail
{
    if (self.head == nil || self.tail == nil)
        return;
    
    if (self.count == 1)
    {
        self.head = nil;
        self.tail = nil;
    }
    else
    {
        ZSLLNode *p = nil;
        ZSLLNode *n = [self nodeForElement:self.tail.value previousNode:&p];
        if (p != nil && n != nil)
        {
            p.next = nil;
            n = nil;
        }
        
        self.tail = nil;
        [self setEndAsTail];
    }
    
    [self decrementCount];
}


-(void)reverse
{
    if (self.head == nil || [self.head isEqual:self.tail])
        return;
    
    ZSLLNode *t1 = self.head;
    ZSLLNode *t2 = t1.next;
    self.head.next = nil;
    self.tail = self.head;
    
    while (t2 != nil)
    {
        ZSLLNode *t3 = t2.next;
        t2.next = t1;
        
        t1 = t2;
        t2 = t3;
    }
    
    self.head = t1;
}



#pragma mark - Operations (private)


-(void)updateTail:(ZSLLNode *)n
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


-(void)updateHead:(ZSLLNode *)n
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


-(void)insertElement:(nonnull id)value afterNode:(nonnull ZSLLNode *)aNode
{
    if (value == nil || aNode == nil)
        return;
    
    ZSLLNode *n = [[ZSLLNode alloc] initWithValue:value];
    n.next = aNode.next;
    aNode.next = n;
    
    if (aNode == self.tail)
    {
        [self updateTail:n];
    }
}


-(void)insertElement:(nonnull id)value beforeNode:(nonnull ZSLLNode *)bNode afterNode:(nullable ZSLLNode *)aNode
{
    if (value == nil || bNode == nil)
        return;
    
    ZSLLNode *n = [[ZSLLNode alloc] initWithValue:value];
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


-(void)setEndAsTail
{
    if (self.head == nil)
        return;
    
    ZSLLNode *c = self.head;
    while (c.next != nil)
    {
        c = c.next;
    }
    
    self.tail = c;
}



#pragma mark - Counter


-(void)incrementCount
{
    self.count++;
}


-(void)decrementCount
{
    if (self.count > 0)
        self.count--;
}



#pragma mark - Operation Helpers


-(nullable ZSLLNode *)nodeForElement:(nonnull id)value
{
    return [self nodeForElement:value previousNode:nil];
}


-(nullable ZSLLNode *)nodeForElement:(nonnull id)value previousNode:(ZSLLNode **)p
{
    if (value == nil)
        return nil;
    
    ZSLLNode *c = self.head;
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
