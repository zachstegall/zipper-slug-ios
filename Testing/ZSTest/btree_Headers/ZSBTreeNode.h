//
//  ZSBTreeNode.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 7/23/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSTreeNode.h"
#import "ZSNode.h"


/// Used by ZSBTree
@protocol ZSBTreeNodeDelegate <NSObject>
/// new root has been created and needs to be set
-(void)newRoot:(nonnull id)n;
@end


@interface ZSBTreeNode : ZSTreeNode<ZSNode>

/**
 @param v value to be added to the keys
 @param order order the number of children to use.
              keys possible will be (children - 1)
*/
-(nonnull instancetype)initWithValue:(nonnull id)v order:(int)order;

@property (nullable, weak, nonatomic) id<ZSBTreeNodeDelegate> delegate;

/**
 Add a value to the keys.
 B-Tree might be restructured depending on the number of keys available
*/
-(void)add:(nonnull id)val;

@end
