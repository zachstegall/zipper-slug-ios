//
//  ZSBTree.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 7/23/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSBTree.h"
#import "ZSBTreeNode.h"


@interface ZSBTree()<ZSBTreeNodeDelegate>
@property int height;
@property int order;
@end


@implementation ZSBTree


-(nonnull instancetype)initWithOrder:(int)order
{
    if (self = [super init])
    {
        self.height = 0;
        self.order = order;
    }
    
    return self;
}


-(void)add:(nonnull id)val
{
    if (self.root == nil)
    {
        self.root = [[ZSBTreeNode alloc] initWithValue:val order:self.order];
        [(ZSBTreeNode *)self.root setDelegate:self];
        self.height = 1;
    }
    else
    {
        [(ZSBTree *)self.root add:val];
    }
}



#pragma mark - Node Delegate


-(void)newRoot:(id)n
{
    self.root = n;
}



@end
