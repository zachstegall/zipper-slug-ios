//
//  ZSGraphOperations.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 7/12/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//


typedef NS_OPTIONS (NSUInteger, ZSGraphType)
{
    ZS_GRAPH_TYPE_DIRECTED = 0,
    ZS_GRAPH_TYPE_UNDIRECTED = 1
};


@protocol ZSGraphOperations


@required
@property ZSGraphType type;
-(instancetype)init:(ZSGraphType)type;
-(void)addEdge:(id)vertex1 toVertex:(id)vertex2;
-(void)removeEdge:(id)vertex1 fromVertex:(id)vertex2;

-(void)addVertex:(id)vertex;
-(void)removeVertex:(id)vertex;

@end
