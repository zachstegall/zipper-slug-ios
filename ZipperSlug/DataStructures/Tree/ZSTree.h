//
//  ZSTree.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/27/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZSTreeNode.h"
#import "ZSPairTreeNode.h"


typedef NS_OPTIONS (NSUInteger, ZSTreeNodeType)
{
    ZSTNT_INVALID = 0,
    ZSTNT_PAIR = 1
};


typedef NS_OPTIONS (NSUInteger, ZSTraverseOrder)
{
    ZSTO_IN     = 1,
    ZSTO_PRE    = 2,
    ZSTO_POST   = 3
};


@interface ZSTree : NSObject

@property (nullable, readonly) ZSTreeNode *root;
@property (readonly) ZSTreeNodeType type;

-(void)balancedIntegerTree:(NSUInteger)numOfNodes;

-(nullable NSArray *)traverseTree:(ZSTraverseOrder)order;

@end
