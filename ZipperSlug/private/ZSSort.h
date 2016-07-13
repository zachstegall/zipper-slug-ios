//
//  ZSSort.h
//  ZipperSlug
//
//  Created by Zachary Stegall on 6/9/16.
//  Copyright © 2016 Zachary Stegall. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSSort : NSObject

/**
 <#description#>
 
 @param <#param 1#>
 @param <#param 2#>
 @return <#returns#>
*/
void selectionSort(NSMutableArray *q, NSInteger count);

/**
 <#description#>
 
 @param <#param 1#>
 @param <#param 2#>
 @return <#returns#>
*/
void insertionSort(NSMutableArray *q, NSInteger count);

/**
 <#description#>
 
 @param <#param 1#>
 @param <#param 2#>
 @return <#returns#>
*/
void quickSort(NSMutableArray *q, NSInteger start, NSInteger end);

/**
 <#description#>
 
 @param <#param 1#>
 @param <#param 2#>
 @return <#returns#>
*/
void mergeSort(NSMutableArray *m, NSInteger start, NSInteger end);

@end
