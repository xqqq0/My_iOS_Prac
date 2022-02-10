//
//  LiveCycleViewController.m
//  ALL_TEST
//
//  Created by qinxinghua on 2022/1/24.
//

#import "LiveCycleViewController.h"

@interface LiveCycleViewController ()
///
@property (nonatomic, strong) UIButton *btn;
///
@property (nonatomic, strong) UIButton *btn1;
@end

@implementation LiveCycleViewController
- (instancetype)init {
    NSLog(@"---%s",__func__);
    if (self = [super init]) {
        
    }
    return self;
    
}

//
//- (void)loadView {
//    [super loadView];
//    NSLog(@"---%s",__func__);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"---%s",__func__);
//    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 200, 100, 100)];
//    self.btn.backgroundColor = [UIColor redColor];
//    [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.btn];
//
//
//    UIView *red = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 200)];
//
//    red.backgroundColor = [UIColor redColor];
//
//    [self.view addSubview:red];
//    // Create the path
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:red.bounds
//                                                   byRoundingCorners:UIRectCornerAllCorners
//                                                         cornerRadii:CGSizeMake(100, 100)];
//    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithOvalInRect:red.bounds];
////    bezierPathWithOvalInRect
//
//    // Create the shape layer and set its path
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    maskLayer.frame = red.bounds;
//    maskLayer.path = maskPath1.CGPath;
//
//    // Set the newly created shape layer as the mask for the view's layer
//    red.layer.mask = maskLayer;
//
//    self.btn1 = self.btn;
//    self.btn = nil;
//    [self.btn1 class];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString * htmlString = @"日本前首相鸠山由纪夫衷心祝愿<font color='red'>北京冬奥会</font>成功举办";

    
    CGRect frame = CGRectMake(0, 100, self.view.frame.size.width, 200);
    UILabel * label = [[UILabel alloc] initWithFrame:frame];

    label.attributedText = [self strToAttriWithStr:htmlString];
    [self.view addSubview:label];
//    label.backgroundColor = [UIColor blueColor];

    CGRect rect = label.frame;
    rect.size.height = [self getAttriHeightWithLabel:label width:frame.size.width];
    label.frame = rect;
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



- (void)btnClick:(UIButton *)btn {
    LiveCycleViewController *vc =  [[LiveCycleViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
//    [self presentViewController:vc animated:YES completion:nil];
//    self.view.bounds = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 1);
}


/**
 *  富文本转html字符串
 */
- (NSString *)attriToStrWithAttri:(NSAttributedString *)attri{
    NSDictionary *tempDic = @{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,
                              NSCharacterEncodingDocumentAttribute:[NSNumber numberWithInt:NSUTF8StringEncoding]};
    
    NSData *htmlData = [attri dataFromRange:NSMakeRange(0, attri.length)
                         documentAttributes:tempDic
                                      error:nil];
    
    return [[NSString alloc] initWithData:htmlData
                                 encoding:NSUTF8StringEncoding];
}
 
/**
 *  字符串转富文本
 */
- (NSAttributedString *)strToAttriWithStr:(NSString *)htmlStr{
    return [[NSAttributedString alloc] initWithData:[htmlStr dataUsingEncoding:NSUnicodeStringEncoding]
                                            options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType}
                                 documentAttributes:nil
                                              error:nil];
}
 
/**
 *获得富文本的高度
 **/
-(CGFloat)getAttriHeightWithLabel:(UILabel *)label width:(CGFloat)width {
    CGFloat height = [label.attributedText boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;//针对富文本
    return height;
}



@end

// push
//@"init"
//@"loadView"
//@"viewDidLoad"
//@"viewWillAppear"
//@"viewWillLayoutSubviews"
//@"viewDidLayoutSubviews"
//@"viewDidAppear"

// pop
//viewWillDisappear:] --B
//viewWillAppear:] --- A
//viewDidDisappear:] -- B
//viewDidAppear:] -- A
//dealloc]


/* present
init]
loadView]
viewDidLoad]
viewWillAppear:]
viewWillLayoutSubviews]
viewDidLayoutSubviews]
viewWillLayoutSubviews]
viewDidLayoutSubviews]
viewDidAppear:]
 */
/*dismiss
 viewDidDisappear:]
 dealloc]
 */



//#import "ViewController.h"
//
//@interface ViewController ()
//
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    NSString * htmlString = @"<html><body>PM<sub>2.5<sub> <font size=\"13\" color=\"red\">hello world!</font> </body></html>";
//
//    UILabel * label = [[UILabel alloc] initWithFrame:self.view.bounds];
//
//    label.attributedText = [self strToAttriWithStr:htmlString];
//    [self.view addSubview:label];
//
//    CGRect rect = label.frame;
//    rect.size.height = [self getAttriHeightWithLabel:label width:self.view.bounds.size.width];
//    label.frame = rect;
//
//}
 
 
 
//@end
