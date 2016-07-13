//
//  ZSGraphList.m
//  ZipperSlug
//
//  Created by Zachary Stegall on 7/12/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import "ZSGraphList.h"


@implementation ZSGraphList
@synthesize type;


-(instancetype)init
{
    if (self = [super init])
    {
        self.type = ZS_GRAPH_TYPE_UNDIRECTED;
        self.relations = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}


-(instancetype)init:(ZSGraphType)type
{
    if (self = [self init])
    {
        
    }
    
    return self;
}



-(void)addEdge:(id)vertex1 toVertex:(id)vertex2
{
    if (self.type == ZS_GRAPH_TYPE_DIRECTED)
        [self addDirectedEdge:vertex1 toVertex:vertex2];
    else if (self.type == ZS_GRAPH_TYPE_UNDIRECTED)
        [self addUndirectedEdge:vertex1 toVertex:vertex2];
}


-(void)removeEdge:(id)vertex1 fromVertex:(id)vertex2
{
    if (self.type == ZS_GRAPH_TYPE_DIRECTED)
        [self removeDirectedEdge:vertex1 fromVertex:vertex2];
    else if (self.type == ZS_GRAPH_TYPE_UNDIRECTED)
        [self removeUndirectedEdge:vertex1 fromVertex:vertex2];
}


-(void)addVertex:(id)vertex
{
    if ([self.relations objectForKey:vertex] == nil)
    {
        [self.relations setObject:[[NSMutableSet alloc] init] forKey:vertex];
    }
}


-(void)removeVertex:(id)vertex
{
    if ([self.relations objectForKey:vertex] != nil)
    {
        [self.relations removeObjectForKey:vertex];
        for (NSMutableSet *s in [self.relations allValues])
        {
            [s removeObject:vertex];
        }
    }
}



#pragma mark - Directed


-(void)addDirectedEdge:(id)v1 toVertex:(id)v2
{
    NSMutableSet *s = [self getRelationOfVertex:v2];
    if (s == nil)
    {
        s = [[NSMutableSet alloc] init];
        [self.relations setObject:s forKey:v2];
    }
    
    [s addObject:v1];
}


-(void)removeDirectedEdge:(id)v1 fromVertex:(id)v2
{
    NSMutableSet *s = [self getRelationOfVertex:v2];
    if (s != nil)
    {
        [s removeObject:v1];
        if ([s count] == 0)
        {
            [self.relations removeObjectForKey:v2];
        }
    }
}



#pragma mark - Undirected


-(void)addUndirectedEdge:(id)v1 toVertex:(id)v2
{
    [self addDirectedEdge:v1 toVertex:v2];
    [self addDirectedEdge:v2 toVertex:v1];
}


-(void)removeUndirectedEdge:(id)v1 fromVertex:(id)v2
{
    [self removeDirectedEdge:v1 fromVertex:v2];
    [self removeDirectedEdge:v2 fromVertex:v1];
}



#pragma mark - Search


-(nullable NSMutableSet *)getRelationOfVertex:(nonnull id)v
{
    return [self.relations objectForKey:v];
}



@end
