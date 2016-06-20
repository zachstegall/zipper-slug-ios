//
//  ZSLinkedList.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/19/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZSNode.h"

@interface ZSLinkedList : NSObject

@property (nullable) ZSNode *head;
@property (nullable) ZSNode *tail;
@property (readonly) NSUInteger count;

-(void)addElement:(nonnull id)value;
-(void)insertElementAtHead:(nonnull id)value;
-(void)insertElement:(nonnull id)value afterValue:(nonnull id)aValue;
-(void)insertElement:(nonnull id)value beforeValue:(nonnull id)bValue;

-(void)removeHead;
-(void)removeTail;

-(void)reverse;

@end
