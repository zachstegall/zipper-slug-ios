//
//  Search.m
//  ZSTest
//
//  Created by Zachary Stegall on 7/14/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZSSearch.h"


@interface Search : XCTestCase
@property NSMutableArray *testSearchA;
@property id searchVal;
@end


static NSUInteger arraySize = 100000;


@implementation Search


-(void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.testSearchA = [[NSMutableArray alloc] init];
    for (NSUInteger i = 1; i <= arraySize; i++)
    {
        [self.testSearchA addObject:@(i)];
    }
    
    self.searchVal = @(MAX(arc4random() % (arraySize + 1), 1));
}


-(void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



#pragma mark - Tests


-(void)searchTest:(NSUInteger)indexValFound searched:(id)valSearched
{
    XCTAssertNoThrow(self.testSearchA[indexValFound]);
    XCTAssertEqualObjects(self.testSearchA[indexValFound], valSearched);
}



-(void)testLinearSearch
{
    NSUInteger i = linearSearch(self.testSearchA, self.testSearchA.count, self.searchVal);
    [self searchTest:i searched:self.searchVal];
}


-(void)testBetterLinearSearch
{
    NSUInteger i = betterLinearSearch(self.testSearchA, self.testSearchA.count, self.searchVal);
    [self searchTest:i searched:self.searchVal];
}


-(void)testSentinelLinearSearch
{
    NSUInteger i = sentinelLinearSearch(self.testSearchA, self.testSearchA.count, self.searchVal);
    [self searchTest:i searched:self.searchVal];
}


-(void)testRecursiveLinearSearch
{
    NSUInteger i = recursiveLinearSearch(self.testSearchA, self.testSearchA.count, 0, self.searchVal);
    [self searchTest:i searched:self.searchVal];
}


-(void)testBinarySearch
{
    NSUInteger i = binarySearch(self.testSearchA, self.testSearchA.count, self.searchVal);
    [self searchTest:i searched:self.searchVal];
}


-(void)testRecursiveBinarySearch
{
    NSUInteger i = recursiveBinarySearch(self.testSearchA, self.testSearchA.count, self.searchVal, 0, self.testSearchA.count - 1);
    [self searchTest:i searched:self.searchVal];
}



@end
