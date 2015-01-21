//
//  NHHeadline.m
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-18.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import "NHHeadline.h"

@implementation NHHeadline

//@property (strong, nonatomic, readonly)NSString *headLine;
//@property (strong,nonatomic) UIImage *image;
//@property (strong, nonatomic, readonly)NSString *urlImage;
//@property (readonly) NSInteger rank;
//@property (readonly) NSInteger viewing;
//@property (readonly) NSInteger dateGoing;
//@property (readonly) NSString *location; //prefecture
//@property (strong, nonatomic, readonly) NSDate *time;
//@property (strong, nonatomic, readonly)NSString *storyId;


- (id)initWithParseObject:(PFObject*)object {
    self = [NHHeadline new];
    if (self) {
        _headLine = [object objectForKey:@"title"];

        PFFile *file = [object objectForKey:@"image"];
        _urlImage = file.url;
        
        _rank = (int)[object objectForKey:@"rank"];
        _viewing = (int)[object objectForKey:@"viewing"];
        _dateGoing = (int)[object objectForKey:@"date_going"];
        _location = [object objectForKey:@"location"];
        _time = [object objectForKey:@""];
    }
    return self;
}

@end
