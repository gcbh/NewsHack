//
//  NHFullStoryOtakeViewController.h
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-25.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import <Haneke/Haneke.h>
#import <UIKit/UIKit.h>
#import "NHHeadline.h"
#import "NHArticleViewController.h"

@interface NHFullStoryOtakeViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong,nonatomic)NHHeadline *shownHead;

- (id)initWithData:(NHHeadline*)data;

@end
