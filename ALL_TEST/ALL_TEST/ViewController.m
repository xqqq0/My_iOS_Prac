//
//  ViewController.m
//  ALL_TEST
//
//  Created by qinxinghua on 2021/11/30.
//

#import "ViewController.h"
#import "ScrollViewAutolayoutVC.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)scrollViewBtnClick:(id)sender {
    ScrollViewAutolayoutVC *vc = [[ScrollViewAutolayoutVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


@end