//
//  BTree.m
//  ZSTest
//
//  Created by Zachary Stegall on 7/25/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZipperSlugBTree.h"


@interface BTree : XCTestCase

@end

@implementation BTree


-(void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}


-(void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void)testBTree
{
    ZSBTree *t = [[ZSBTree alloc] initWithOrder:3];
    /*
    [t add:@(2)];
    [t add:@(5)];
    [t add:@(7)];
    [t add:@(6)];
    [t add:@(10)];
    [t add:@(16)];
    [t add:@(21)];
    [t add:@(18)];
    [t add:@(9)];
    [t add:@(1)];
    */
    
    [t add:@(1)];
    [t add:@(2)];
    [t add:@(3)];
    [t add:@(4)];
    [t add:@(5)];
    [t add:@(6)];
    [t add:@(7)];
    [t add:@(8)];
    [t add:@(9)];
    [t add:@(10)];
    [t add:@(11)];
    [t add:@(12)];
    [t add:@(13)];
    [t add:@(14)];
    [t add:@(15)];
    [t add:@(16)];
    [t add:@(17)];
    [t add:@(18)];
    [t add:@(19)];
    [t add:@(20)];
    [t add:@(21)];
    [t add:@(22)];
    [t add:@(23)];
    [t add:@(24)];
    [t add:@(25)];
    [t add:@(26)];
    [t add:@(27)];
    [t add:@(28)];
    [t add:@(29)];
    [t add:@(30)];
    
    
    NSLog(@"%@", @"hi");
}


@end
