//
//  NHFullStoryOtakeViewController.m
//  NewsHack
//
//  Created by Geoffrey Heath on 2014-10-25.
//  Copyright (c) 2014 News Publisher Japan. All rights reserved.
//

#import "NHFullStoryOtakeViewController.h"

@interface NHFullStoryOtakeViewController ()

@end

@implementation NHFullStoryOtakeViewController{
    UIImageView *imageView;
    UICollectionView *table;
}

- (id)initWithData:(NHHeadline*)data {
    self = [super init];
    if (self) {
        self.shownHead = data;
        [self setup];
    }
    return self;
}

- (void) setup {
    //[self.view setClipsToBounds:YES];
    
    imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    imageView.hnk_cacheFormat = [[[HNKCache sharedCache]formats] objectForKey:@"feedImage"];
    [imageView.hnk_cacheFormat setSize:imageView.bounds.size];
    
    [imageView hnk_setImageFromURL:[NSURL URLWithString:_shownHead.urlImage] placeholder:nil success:^(UIImage *image) {
        imageView.image = image;
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    UIView *shade = [[UIView alloc]initWithFrame:self.view.bounds];
    [shade setBackgroundColor:[UIColor colorWithRed:147/255 green:149/255 blue:152/255 alpha:0.3]];
    //[self.view addSubview:shade];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setFrame:CGRectMake(290, 25, 60,40)];
    [back setBackgroundColor:[UIColor colorWithRed:147/255 green:149/255 blue:152/255 alpha:0.8]];
    //[back setBackgroundColor:[UIColor redColor]];
    [back setTitle:@"Back" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backButton) forControlEvents:UIControlEventTouchUpInside];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setSectionInset:UIEdgeInsetsMake(0,0, 20, 0)];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [layout setItemSize:CGSizeMake(self.view.bounds.size.width - 40, 300)];
    [layout setHeaderReferenceSize:CGSizeMake(self.view.bounds.size.width - 30, 30)];
    
    table = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 20, self.view.bounds.size.width - 40, self.view.bounds.size.height) collectionViewLayout:layout];
    [table setBackgroundColor:[UIColor clearColor]];
    [table setContentSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height)];
    [table registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [table registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [table setDelegate:self];
    [table setDataSource:self];
    
    [self.view addSubview:table];
    [self.view insertSubview:back aboveSubview:table];
    
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self.view insertSubview:imageView atIndex:0];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [imageView removeFromSuperview];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithRed:147/255 green:149/255 blue:152/255 alpha:0.5]];
    for (UIView *v in cell.subviews) {
        [v removeFromSuperview];
    }
    UIImageView *image = [[UIImageView alloc]initWithFrame:cell.bounds];
    switch (indexPath.section) {
        case 0:
            [image setImage:[UIImage imageNamed:@"detail_02_a.png"]];
            break;
        case 1:
            [image setImage:[UIImage imageNamed:@"detail_02_b.png"]];
            break;
        case 2:
            [image setImage:[UIImage imageNamed:@"detail_02_c.png"]];
            break;
        case 3:
            [image setImage:[UIImage imageNamed:@"detail_02_d.png"]];
            break;
        case 4:
            [image setImage:[UIImage imageNamed:@"detail_02_e.png"]];
            break;
        default:
            break;
    }
    [cell addSubview:image];
    return cell;
}

- (UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    for (UIView *v in header.subviews) {
        [v removeFromSuperview];
    }
    [header setBackgroundColor:[UIColor colorWithRed:147/255 green:149/255 blue:152/255 alpha:0.5]];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 200, 20)];
    [title setBackgroundColor:[UIColor clearColor]];
    switch (indexPath.section) {
        case 0:
            [title setText:@"Summary"];
            break;
        case 1:
            [title setText:@"Articles"];
            break;
        case 2:
            [title setText:@"People"];
            break;
        case 3:
            [title setText:@"Location"];
            break;
        case 4:
            [title setText:@"Twitter"];
            break;
        default:
            break;
    }
    [title setTextColor:[UIColor whiteColor]];
    [header addSubview:title];
    return header;
}

- (void)backButton {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        [self presentViewController:[[NHArticleViewController alloc]init] animated:YES completion:nil];
    }
}

@end
