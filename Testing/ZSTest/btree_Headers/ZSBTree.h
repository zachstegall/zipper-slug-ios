//
//  ZSBTree.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 7/23/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSTree.h"

@interface ZSBTree : ZSTree

/**
 @param order the number of children to use. 
        keys possible will be (children - 1)
*/
-(nonnull instancetype)initWithOrder:(int)order;

/**
 Add a value to the tree
*/
-(void)add:(nonnull id)val;

@end
