//
//  ZSStack.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/20/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_OPTIONS (NSUInteger, ZSStackInternalDataStructure)
{
    ZS_STACK_ARRAY = 0,
    ZS_STACK_LINKED_LIST = 1
};


@protocol ZSStackProtocol <NSObject>
-(void)push:(nonnull id)object;
-(nullable id)pop;
-(nullable id)peek;
@end


@interface ZSStack : NSObject<ZSStackProtocol>

+(nonnull instancetype)initWithInternalDataStructure:(ZSStackInternalDataStructure)ds;

@end
