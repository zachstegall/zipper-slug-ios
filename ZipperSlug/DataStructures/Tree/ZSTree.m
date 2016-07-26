//
//  ZSTree.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/27/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSTree.h"


@interface ZSTree()
@property (readwrite) ZSTreeNodeType type;
@end


@implementation ZSTree


-(instancetype)init
{
    if (self = [super init])
    {
        
    }
    
    return self;
}


-(void)initRoot:(ZSTreeNodeType)type
{
    self.type = type;
    
    switch (type)
    {
        case ZSTNT_PAIR:
            self.root = [[ZSPairTreeNode alloc] init];
            break;
            
        case ZSTNT_INVALID:
        default:
            break;
    }
}



#pragma mark - Tree Creation


-(void)balancedIntegerTree:(NSUInteger)numOfNodes
{
    [self initRoot:ZSTNT_PAIR];
    setNodeWithArray((ZSPairTreeNode *)self.root, arrayOfIntegers(numOfNodes), 0, numOfNodes - 1);
}


NSArray *arrayOfIntegers(NSUInteger numOfNodes)
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSUInteger i = 1;
    while (i <= numOfNodes)
    {
        [array addObject:@(i)];
        i++;
    }
    
    return array;
}


void setNodeWithArray(ZSPairTreeNode *node, NSArray *array, NSUInteger start, NSUInteger end)
{
    if (start >= end)
        return;
    
    int mid = (int)floor((start + end) / 2);
    node.value = array[mid];
    
    node.left = [[ZSPairTreeNode alloc] init];
    setNodeWithArray((ZSPairTreeNode *)node.left, array, start, mid);
    
    node.right = [[ZSPairTreeNode alloc] init];
    setNodeWithArray((ZSPairTreeNode *)node.right, array, mid + 1, end);
}



#pragma mark - Traverse


-(nullable NSArray *)traverseTree:(ZSTraverseOrder)order
{
    NSMutableArray *traversed = [[NSMutableArray alloc] init];
    switch (order)
    {
        case ZSTO_IN:
            inOrderTraverse((ZSPairTreeNode *)self.root, traversed);
            break;
            
        case ZSTO_PRE:
            preOrderTraverse((ZSPairTreeNode *)self.root, traversed);
            break;
            
        case ZSTO_POST:
            postOrderTraverse((ZSPairTreeNode *)self.root, traversed);
            break;
            
        default:
            break;
    }
    
    return traversed;
}


void inOrderTraverse(ZSPairTreeNode *node, NSMutableArray *traversed)
{
    if (node == nil || node.value == nil)
        return;
    
    inOrderTraverse((ZSPairTreeNode *)node.left, traversed);
    [traversed addObject:node.value];
    inOrderTraverse((ZSPairTreeNode *)node.right, traversed);
    
}


void preOrderTraverse(ZSPairTreeNode *node, NSMutableArray *traversed)
{
    if (node == nil || node.value == nil)
        return;
    
    [traversed addObject:node.value];
    preOrderTraverse((ZSPairTreeNode *)node.left, traversed);
    preOrderTraverse((ZSPairTreeNode *)node.right, traversed);
}


void postOrderTraverse(ZSPairTreeNode *node, NSMutableArray *traversed)
{
    if (node == nil || node.value == nil)
        return;
    
    postOrderTraverse((ZSPairTreeNode *)node.left, traversed);
    postOrderTraverse((ZSPairTreeNode *)node.right, traversed);
    [traversed addObject:node.value];
}


@end
