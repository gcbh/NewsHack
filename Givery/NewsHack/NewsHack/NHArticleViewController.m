//
//  NHArticleViewController.m
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-25.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import "NHArticleViewController.h"

@interface NHArticleViewController ()

@end

@implementation NHArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNeedsStatusBarAppearanceUpdate];
    UIWebView *article = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20)];
    
    NSURL *url = [NSURL URLWithString:@"http://www.nikkei.com/article/DGXLASDG2400J_U4A021C1CC0000/"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [article loadRequest:requestObj];
    [self.view addSubview:article];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(170, 35, 60, 21)];
    [back setBackgroundColor:[UIColor colorWithRed:147/255 green:149/255 blue:152/255 alpha:1]];
    [back.layer setCornerRadius:2];
    //[back setBackgroundColor:[UIColor redColor]];
    [back setTitle:@"Back" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backButton) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:back];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)backButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
