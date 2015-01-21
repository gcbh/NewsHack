//
//  NSNewsViewDataSource.h
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-18.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import "IMAsync.h"
#import "NHHeadline.h"
#import "NHHeadlineViewController.h"

@interface NHNewsViewDataSource : NSObject <UIPageViewControllerDataSource>

@property NSInteger pageCount;

@property (strong, nonatomic)NSMutableArray *stories;

- (BFTask*)loadData;

@end
