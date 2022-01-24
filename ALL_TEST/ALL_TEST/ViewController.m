//
//  ViewController.m
//  ALL_TEST
//
//  Created by qinxinghua on 2021/11/30.
//

#import "ViewController.h"
#import "Person+Extension.h"
#import "ScrollViewAutolayoutVC.h"
#import "MMImageDownloader.h"
#import "TableviewPageEnableViewController.h"
#import "TestCollectionViewController.h"
#import "LiveCycleViewController.h"


@interface ViewController ()

@end

@implementation ViewController
- (IBAction)scrollViewBtnClick:(id)sender {
    ScrollViewAutolayoutVC *vc = [[ScrollViewAutolayoutVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)tableviewClick:(UIButton *)sender {
    TableviewPageEnableViewController *vc = [[TableviewPageEnableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)collectionVIewClick:(id)sender {
    TestCollectionViewController *vc = [[TestCollectionViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)liftCycleClick:(id)sender {
    LiveCycleViewController *vc = [[LiveCycleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - ***** lifeCycyle *****

- (void)viewDidLoad {
    [super viewDidLoad];
//    [MMImageDownloader downloadImageSizeWithURL:[NSURL URLWithString:@"http://10.9.180.53/1.jpg"] callback:^(CGSize size) {
//        NSLog(@"%@",NSStringFromCGSize(size));
//    }];
    
    Person *person = [[Person alloc] init];
    person.height = 10;

}




@end
