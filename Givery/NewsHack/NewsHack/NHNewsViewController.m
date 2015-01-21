//
//  ViewController.m
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-18.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import "NHNewsViewController.h"

@interface NHNewsViewController ()

@property (strong, nonatomic)NHNewsViewDataSource *data;
@end

@implementation NHNewsViewController

- (id)init {
    self = [super init];
    if (self) {
        [self setup];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)setup {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setNeedsStatusBarAppearanceUpdate];
    self.data = [[NHNewsViewDataSource alloc]init];
    [self setDataSource:self.data];
    [self setDelegate:self];
    //[self.data setup];
    
    [[self.data loadData]continueWithBlock:^id(BFTask *task) {

        [self setViewControllers:@[[[NHHeadlineViewController alloc]initWithData:task.result andPageCount:self.data.pageCount] ] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
        return nil;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma UIPageViewController delegate

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
       transitionCompleted:(BOOL)completed {
    if ([self.data.stories indexOfObject:[(NHHeadlineViewController*)[pageViewController.viewControllers lastObject] shownHead]] < [self.data.stories indexOfObject:[(NHHeadlineViewController*)[previousViewControllers lastObject] shownHead]])
    {
        self.data.pageCount--;
    }
    else {
        self.data.pageCount++;
    }

}

@end
