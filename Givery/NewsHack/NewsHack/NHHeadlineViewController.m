//
//  NHHeadlineViewController.m
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-18.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import "NHHeadlineViewController.h"

@interface NHHeadlineViewController ()

//@property (strong,nonatomic)NHHeadline *shownHead;

@property (strong, nonatomic)NSDictionary *views;
@property (strong, nonatomic)NSDictionary *metrics;
@property NSInteger pageCount;

@end

@implementation NHHeadlineViewController

- (id)init {
    self = [super init];
    if (self) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (id)initWithData:(NHHeadline*)headline andPageCount:(NSInteger)page {
    self = [super init];
    if (self) {
        self.pageCount = page;
        self.shownHead = headline;
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
    imageView.hnk_cacheFormat = [[[HNKCache sharedCache]formats] objectForKey:@"feedImage"];
    [imageView.hnk_cacheFormat setSize:imageView.bounds.size];

    [imageView hnk_setImageFromURL:[NSURL URLWithString:_shownHead.urlImage] placeholder:nil success:^(UIImage *image) {
        imageView.image = image;
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    [self.view addSubview:imageView];
    
    UIButton *menu = [UIButton buttonWithType:UIButtonTypeCustom];
    [menu setTranslatesAutoresizingMaskIntoConstraints:NO];
    [menu setImage:[UIImage imageNamed:@"icon_menu.png"] forState:UIControlStateNormal];
    [self.view addSubview:menu];
    
    UIButton *openStory = [UIButton buttonWithType:UIButtonTypeCustom];
    [openStory setTranslatesAutoresizingMaskIntoConstraints:NO];
    [openStory setImage:[UIImage imageNamed:@"icon_more.png"] forState:UIControlStateNormal];
    [openStory addTarget:self action:@selector(openStory:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openStory];
    
    UILabel *position = [[UILabel alloc]init];
    [position setTranslatesAutoresizingMaskIntoConstraints:NO];
    [position setText:[NSString stringWithFormat:@"%ld/30",(long)_shownHead.rank]];
    [position setTextColor:[UIColor whiteColor]];
    [self.view addSubview:position];
    
    UILabel *header = [[UILabel alloc]init];
    [header setTranslatesAutoresizingMaskIntoConstraints:NO];
    [header setText:_shownHead.headLine];
    [header setTextColor:[UIColor whiteColor]];
    //[header sizeToFit];
    [self.view addSubview:header];
    
    UILabel *location = [[UILabel alloc]init];
    [location setTranslatesAutoresizingMaskIntoConstraints:NO];
    [location setText:_shownHead.location];
    [location setTextColor:[UIColor whiteColor]];
    //[location sizeToFit];
    [self.view addSubview:location];
    
    UILabel *time = [[UILabel alloc]init];
    [time setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSDateFormatter *f = [[NSDateFormatter alloc]init];
    [f setDateFormat:@"HH:mm"];
    [time setText:[f stringFromDate:_shownHead.time]];
    [time setTextColor:[UIColor whiteColor]];
    [self.view addSubview:time];
    
    _views = NSDictionaryOfVariableBindings(header, time, location, menu, openStory, position);
    _metrics = @{@"bottomMargin":@(self.view.bounds.size.height * 0.15), @"separator":@30, @"menuSize":@10, @"openSize":@20};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[header]-(separator)-[location][time]-(bottomMargin)-|" options:NSLayoutFormatAlignAllLeading metrics:_metrics views:_views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-10-[header]" options:0 metrics:_metrics views:_views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(30)-[position]" options:0 metrics:_metrics views:_views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(30)-[menu(menuSize)]" options:0 metrics:_metrics views:_views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[openStory(openSize)]-(bottomMargin)-|" options:0 metrics:_metrics views:_views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[position]-(20)-|" options:0 metrics:_metrics views:_views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[menu(menuSize)]" options:0 metrics:_metrics views:_views ]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[openStory(openSize)]-|" options:0 metrics:_metrics views:_views ]];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openStory:(id)sender {
    UIViewController *storyView;
    if ([self.shownHead.location isEqualToString:@"Nagano, Japan"]){
        storyView = [[NHFullStoryOtakeViewController alloc]initWithData:self.shownHead];
        [self presentViewController:storyView animated:YES completion:nil];
    }
    else if ([self.shownHead.location isEqualToString:@"Hong Kong"]){
        storyView = [[NHFullStoryHongKongViewController alloc]initWithData:self.shownHead];
        [self presentViewController:storyView animated:YES completion:nil];
    }
}


@end
