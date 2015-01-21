//
//  NHHeadlineViewController.h
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-18.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import "NHHeadline.h"
#import <Haneke/Haneke.h>
#import "NHFullStoryHongKongViewController.h"
#import "NHFullStoryOtakeViewController.h"

@interface NHHeadlineViewController : UIViewController

@property (strong,nonatomic)NHHeadline *shownHead;

- (id)init;

- (id)initWithData:(NHHeadline*)headline andPageCount:(NSInteger)page;

@end
