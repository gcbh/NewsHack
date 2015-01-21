//
//  NHFullStoryViewController.h
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-18.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import "NHHeadline.h"
#import <Haneke/Haneke.h>
#import "NHNewsViewController.h"

@interface NHFullStoryHongKongViewController : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong,nonatomic)NHHeadline *shownHead;

- (id)initWithData:(NHHeadline*)data;

@end
