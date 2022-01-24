//
//  LiveCycleViewController.m
//  ALL_TEST
//
//  Created by qinxinghua on 2022/1/24.
//

#import "LiveCycleViewController.h"

@interface LiveCycleViewController ()

@end

@implementation LiveCycleViewController
- (instancetype)init {
    NSLog(@"---%s",__func__);
    if (self = [super init]) {
        
    }
    return self;
    
}


- (void)loadView {
    [super loadView];
    NSLog(@"---%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"---%s",__func__);
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"---%s",__func__);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"---%s",__func__);
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    NSLog(@"---%s",__func__);
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    NSLog(@"---%s",__func__);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"---%s",__func__);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"---%s",__func__);
}

- (void)dealloc {
    NSLog(@"---%s",__func__);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    LiveCycleViewController *vc =  [[LiveCycleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
}
@end
