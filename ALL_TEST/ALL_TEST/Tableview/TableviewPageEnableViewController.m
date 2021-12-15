//
//  TableviewPageEnableViewController.m
//  ALL_TEST
//
//  Created by qinxinghua on 2021/12/10.
//

#import "TableviewPageEnableViewController.h"

@interface TableviewPageEnableViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TableviewPageEnableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.pagingEnabled = YES;
    UIView *midBlack = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height * 0.5, self.view.frame.size.width, 10)];
    midBlack.backgroundColor = [UIColor blackColor];
    [self.view addSubview:midBlack];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    }
    cell.backgroundColor = [self getRandomColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}


- (UIColor *)getRandomColor {
    CGFloat hue = (arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
@end
