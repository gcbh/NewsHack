//
//  NHHeadline.h
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-18.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface NHHeadline : NSObject

@property (strong, nonatomic, readonly)NSString *headLine;
@property (strong,nonatomic) UIImage *image;
@property (strong, nonatomic, readonly)NSString *urlImage;
@property (readonly) NSInteger rank;
@property (readonly) NSInteger viewing;
@property (readonly) NSInteger dateGoing;
@property (readonly) NSString *location; //prefecture
@property (strong, nonatomic, readonly) NSDate *time;
@property (strong, nonatomic, readonly)NSString *storyId;

- (id)initWithParseObject:(PFObject*)object;

@end
