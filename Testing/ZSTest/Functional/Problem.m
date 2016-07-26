//
//  Problem.m
//  ZSTest
//
//  Created by Zachary Stegall on 7/21/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZipperSlugProblems.h"


@interface Problem : XCTestCase

@end


@implementation Problem


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



#pragma mark - Tests


-(void)testAsteriskSubstring
{
    if ([ZSProblem isString:@"M*ss*i" subStringOf:@"Mississippi"])
         XCTAssertTrue(true);
    else
        XCTAssertTrue(false);
}


-(void)testEquationTree
{
    ZSTree *t = [[ZSTree alloc] init];
    t.root = [[ZSPairTreeNode alloc] initWithValue:@"*"];
    
    ZSPairTreeNode *r = (ZSPairTreeNode *)t.root;
    r.left = [[ZSPairTreeNode alloc] initWithValue:@"+"];
    r.right = [[ZSPairTreeNode alloc] initWithValue:@"c"];
    
    ZSPairTreeNode *l1 = (ZSPairTreeNode *)r.left;
    l1.left = [[ZSPairTreeNode alloc] initWithValue:@"a"];
    l1.right = [[ZSPairTreeNode alloc] initWithValue:@"b"];
    
    NSLog(@"EQUATION %@", [ZSProblem equationFromTree:t]);
}



@end
