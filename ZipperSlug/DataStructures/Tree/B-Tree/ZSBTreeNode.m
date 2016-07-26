//
//  ZSBTreeNode.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 7/23/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSBTreeNode.h"
#import "ZSCompare.h"


@interface ZSBTreeNode ()
-(nonnull instancetype)initWithOrder:(int)order;
-(nonnull instancetype)initWithOrder:(int)order parent:(nullable ZSBTreeNode *)p;

@property (weak, nullable) ZSBTreeNode *parent;
@property (nullable) NSMutableArray *keys;
@property (nullable) NSMutableArray *children;
@property int order;
@end


@implementation ZSBTreeNode
@synthesize value;


-(instancetype)init
{
    if (self = [super init])
    {
        self.keys = [[NSMutableArray alloc] init];
        self.children = nil;
    }
    
    return self;
}


-(nonnull instancetype)initWithValue:(nonnull id)v
{
    if (self = [self init])
    {
        [self add:v];
    }
    
    return self;
}


-(nonnull instancetype)initWithOrder:(int)order
{
    if (self = [self init])
    {
        self.order = order;
    }
    
    return self;
}


-(nonnull instancetype)initWithOrder:(int)order parent:(nullable ZSBTreeNode *)p
{
    if (self = [self init])
    {
        self.order = order;
        self.parent = p;
    }
    
    return self;
}


-(nonnull instancetype)initWithValue:(nonnull id)v order:(int)order
{
    if (self = [self initWithValue:v])
    {
        self.order = order;
    }
    
    return self;
}



#pragma mark - ** PUBLIC **


-(void)add:(nonnull id)val
{
    [self add:val availableSpace:nil];
}



#pragma mark - ** PRIVATE **
#pragma mark - Addition


/**
 @param availableNode Only used recursively.
        This value is set if self has available keys before passing value to child.
*/
-(void)add:(nonnull id)val availableSpace:(nullable ZSBTreeNode *)availableNode
{
    // No children
    if (self.children == nil)
    {
        if (self.keys.count == (self.order - 1))
        {
            if (availableNode != nil)
            {
                [self insert:val into:availableNode.keys];
            }
            else
            {
                [self insert:val into:self.keys];
                [self split];
            }
        }
        else
        {
            [self insert:val into:self.keys];
        }
    }
    // Has children, pass value to appropriate child
    else
    {
        ZSBTreeNode *child = [self getChildToPassTo:val];
        if ([self keysAreFull])
        {
            [child add:val availableSpace:availableNode];
        }
        else
        {
            [child add:val availableSpace:self];
        }
    }
}


/**
 Assumes the passing array is sorted. Inserts into a sorted position.
 @return index the value was inserted into the array
*/
-(NSUInteger)insert:(nonnull id)val into:(NSMutableArray *)a
{
    BOOL inserted = false;
    NSUInteger i;
    for (i = 0; i < a.count; i++)
    {
        if (compare(val, a[i]) == ZSCR_LESS_THAN)
        {
            [a insertObject:val atIndex:i];
            inserted = true;
            break;
        }
    }
    
    if (!inserted)
    {
        [a addObject:val];
    }
    
    
    return i;
}


-(NSInteger)adoptValue:(nonnull id)val
{
    return [self insert:val into:self.keys];
}



#pragma mark - Keys


-(BOOL)keysAreFull
{
    return (self.keys.count >= (self.order - 1));
}



#pragma mark - Children


/**
 @return Child node based on key comparison
*/
-(ZSBTreeNode *)getChildToPassTo:(nonnull id)val
{
    NSUInteger childIndex = 0;
    for (id v in self.keys)
    {
        if (compare(val, v) == ZSCR_LESS_THAN)
        {
            break;
        }
        
        childIndex++;
    }
    
    return self.children[childIndex];
}


-(void)pass:(nonnull id)val toChild:(ZSBTreeNode *)child
{
    [child add:val];
}


-(void)adoptChild:(nonnull ZSBTreeNode *)child index:(NSUInteger)i
{
    [self.children insertObject:child atIndex:i];
    child.parent = self;
}


/**
 Adds more children to the node if child order is not met.
*/
-(void)fillChildOrder:(ZSBTreeNode *)node
{
    if (node.children.count < node.order)
    {
        while (node.children.count < node.order)
            [node.children addObject:[[ZSBTreeNode alloc] initWithOrder:self.order parent:node]];
    }
}



#pragma mark - Split


/**
 
*/
-(void)split
{
    // Copy of keys so we can go ahead and modify self.keys
    NSMutableArray *a = [self.keys mutableCopy];
    NSUInteger m = floor(a.count / 2);  // index for the split
    
    // self.keys will become the first child in the split
    [self.keys removeAllObjects];
    
    // n1 will become the second child
    ZSBTreeNode *n1 = [[ZSBTreeNode alloc] initWithOrder:self.order];
    
    
    for (NSUInteger i = 0; i < a.count; i++)
    {
        if (i < m)
        {
            // add values less than the split value to self.keys
            [self.keys addObject:a[i]];
        }
        else if (i > m)
        {
            // add values greater than the split value to n1
            [n1.keys addObject:a[i]];
        }
    }
    
    
    // up to this point, self.keys still has all of the children.
    // part of the children will be kept with self.keys will the rest
    // will go to n1
    if (self.children != nil)
        [self afterSplitUpdateChildren:n1 startIndex:m+1];
    
    
    if (self.parent != nil)
    {
        // Send the split value to the self.parent
        // Let self.parent also adopt n1
        // The keys and children may go over the order here
        // The order will be corrected in the split.
        NSUInteger keyIndex = [self.parent adoptValue:a[m]];
        [self.parent adoptChild:n1 index:keyIndex+1];
        
        if (self.parent.keys.count > (self.order - 1))
        {
            [self.parent split];
        }
    }
    else
    {
        // Need to create a new root with the split value
        [self setupNewRoot:a[m] withSecondChild:n1];
    }
}


/**
 Around half of the children will be given to the new node
 If not already, child orders will be met with self and newNode
*/
-(void)afterSplitUpdateChildren:(ZSBTreeNode *)newNode startIndex:(NSUInteger)s
{
    newNode.children = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = (self.children.count - 1); i >= s; i--)
    {
        [newNode.children insertObject:self.children[i] atIndex:0];
        [self.children removeObjectAtIndex:i];
    }
    
    
    [self fillChildOrder:newNode];
    [self fillChildOrder:self];
}



#pragma mark - Root


/**
 Because of a split with a root, a new root is created.
 Self and sChild will become children of the new root.
*/
-(void)setupNewRoot:(nonnull id)val withSecondChild:(ZSBTreeNode *)sChild
{
    ZSBTreeNode *newRoot = [[ZSBTreeNode alloc] initWithValue:val order:self.order];
    self.parent = newRoot;
    sChild.parent = newRoot;
    
    [self.delegate newRoot:newRoot];
    newRoot.delegate = self.delegate;
    self.delegate = nil;
    
    [self setupNode:newRoot withChild:self and:sChild];
}


/**
 aChild and bChild will be added to the n children array.
 If not already, n.children order will be met
*/
-(void)setupNode:(ZSBTreeNode *)n withChild:(ZSBTreeNode *)aChild and:(ZSBTreeNode *)bChild
{
    n.children = [[NSMutableArray alloc] init];
    [n.children addObject:aChild];
    [n.children addObject:bChild];
    
    for (NSUInteger i = 2; i < self.order; i++)
    {
        [n.children addObject:[[ZSBTreeNode alloc] initWithOrder:self.order parent:n]];
    }
}


@end
