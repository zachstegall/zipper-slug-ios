//
//  ZSNode.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/19/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSNode : NSObject

@property (nullable) id value;
@property (nullable) ZSNode *next;

-(nonnull instancetype)initWithValue:(nonnull id)v;

@end
