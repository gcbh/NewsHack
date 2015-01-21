//
//  NSNewsViewDataSource.m
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-18.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import "NHNewsViewDataSource.h"

@interface NHNewsViewDataSource()

@property NSInteger numberLoaded;



@end

@implementation NHNewsViewDataSource

- (id)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    self.stories = [NSMutableArray array];
    _pageCount = 0;
    
    }

- (BFTask*)loadData {
    PFQuery *query = [PFQuery queryWithClassName:@"Headline"];
    [query setLimit:3];
    //[query whereKey:@"rank" lessThanOrEqualTo:@5];
    //[query includeKey:@"image"];
    BFTaskCompletionSource *t = [BFTaskCompletionSource taskCompletionSource];
    
    [[IMAsync findObjectsAsync:query]continueWithBlock:^id(BFTask *task) {
        if (!task.error){
            for (PFObject *item in task.result){
                NHHeadline *temp = [[NHHeadline alloc]initWithParseObject:item];
                [_stories addObject:temp];
            }
            _numberLoaded += 3;
            [t setResult:[_stories objectAtIndex:0]];
        }
        else {
            [t setError:task.error];
        }
        return nil;
    }];
    return t.task;
}

- (UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NHHeadlineViewController *view;
    
    if ((_pageCount - 1) >= 0) {
        view = [[NHHeadlineViewController alloc]initWithData:[_stories objectAtIndex:(_pageCount - 1)] andPageCount:self.pageCount];
    }
    return view;
}

- (UIViewController*)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NHHeadlineViewController *view;

    if ((_pageCount + 1) < [_stories count]) {
    view= [[NHHeadlineViewController alloc]initWithData:[_stories objectAtIndex:(_pageCount + 1)] andPageCount:self.pageCount];        
    }
    return view;
}

@end
