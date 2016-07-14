//
//  Sort.m
//  ZSTest
//
//  Created by Zachary Stegall on 7/14/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZSSort.h"
#import "ZSCompare.h"


@interface Sort : XCTestCase
@property NSMutableArray *testSortA;
@property NSMutableArray *testSortB;
@property NSMutableArray *testSortC;
@property NSMutableArray *testSortD;
@end


@implementation Sort


-(void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.testSortA = [[NSMutableArray alloc] init];
    NSUInteger count = 10000;
    for (NSUInteger i = 0; i < count; i++)
    {
        NSUInteger n = arc4random() % (count + 1);
        [self.testSortA addObject:[NSString stringWithFormat:@"%lu", (unsigned long)n]];
    }
    
    self.testSortB = [self.testSortA mutableCopy];
    self.testSortC = [self.testSortA mutableCopy];
    self.testSortD = [self.testSortA mutableCopy];
}


-(void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}



#pragma mark - Tests


-(void)sortTest:(NSMutableArray *)a
{
    id last = a[0];
    for (id n in a)
    {
        ZSComparisonResult cr = compare(n, last);
        if (cr == ZSCR_LESS_THAN)
        {
            XCTAssertTrue(false);
        }
        last = n;
    }
    
    XCTAssertTrue(true);
}



-(void)testSelectionSort
{
    selectionSort(self.testSortA, self.testSortA.count);
    [self sortTest:self.testSortA];
}


-(void)testInsertionSort
{
    insertionSort(self.testSortB, self.testSortB.count);
    [self sortTest:self.testSortB];
}


-(void)testQuickSort
{
    quickSort(self.testSortC, 0, self.testSortC.count - 1);
    [self sortTest:self.testSortC];
}


-(void)testMergeSort
{
    mergeSort(self.testSortD, 0, self.testSortD.count - 1);
    [self sortTest:self.testSortD];
}


@end
