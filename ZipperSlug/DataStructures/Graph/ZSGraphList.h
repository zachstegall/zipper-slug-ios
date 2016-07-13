//
//  ZSGraphList.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 7/12/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSGraph.h"
#import "ZSGraphOperations.h"

@interface ZSGraphList : ZSGraph<ZSGraphOperations>

/// NSMutableDictionary < vertex, set of Edges >
@property NSMutableDictionary *relations;

@end
