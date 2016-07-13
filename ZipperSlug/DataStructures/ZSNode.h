//
//  ZSNode.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/27/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//


@protocol ZSNode <NSObject>

@property (nullable) id value;

-(nonnull instancetype)initWithValue:(nonnull id)v;

@end