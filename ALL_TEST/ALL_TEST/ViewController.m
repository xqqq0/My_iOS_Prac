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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务1:%@",[NSThread currentThread]);
        sleep(1);
        [self signal:sem];
    });
    
    [self wait:sem];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务2:%@",[NSThread currentThread]);
        [self signal:sem];
    });
    
    
    [self wait:sem];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"任务3:%@",[NSThread currentThread]);
    });
}

- (void)signal:(dispatch_semaphore_t)sem {
    NSLog(@"sem_sgnal%@",[NSThread currentThread]);
    dispatch_semaphore_signal(sem);
}

- (void)wait:(dispatch_semaphore_t)sem {
    NSLog(@"sem_wait%@",[NSThread currentThread]);
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
}
@end
