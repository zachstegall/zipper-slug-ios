//
//  ZSLLNode.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/27/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZSNode.h"

@interface ZSLLNode : NSObject<ZSNode>

@property (nullable) ZSLLNode *next;

@end
