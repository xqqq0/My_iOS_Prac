//
//  ScrollViewAutolayoutVC.m
//  ALL_TEST
//
//  Created by qinxinghua on 2021/11/30.
//

#import "ScrollViewAutolayoutVC.h"
#import "Masonry.h"

@interface ScrollViewAutolayoutVC ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *containerView;
@end

@implementation ScrollViewAutolayoutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    // 先创建并布局ScrollView
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.backgroundColor = [UIColor greenColor];
    [self.view addSubview: self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // 然后创建容器
    self.containerView = [[UIView alloc] init];
    self.containerView.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:self.containerView];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        // 如果是纵向滚动，则宽固定，如果是横向滚动，则高度固定
        make.width.equalTo(self.view);
    }];
    
    for (int i= 0; i < 10; i ++) {
        UIButton *button = [[UIButton alloc] init];
        [self.containerView addSubview: button];
        button.backgroundColor = [self getRandomColor];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.containerView);
            make.top.equalTo(self.containerView).offset(100 * i);
            make.size.mas_equalTo(CGSizeMake(200, 90));
            // 核心步骤:最后一个组件的时候，要设置其与容器底部的距离
            if (i == 9) {
//                make.bottom.equalTo(self.containerView);
                make.bottom.equalTo(self.containerView).offset(-50);
            }
        }];
        // 核心步骤
        if (i == 9) {
            button.backgroundColor = [UIColor blackColor];
        }
    }
    
    
    
}

- (UIColor *)getRandomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //0.5 to 1.0,away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}


@end
