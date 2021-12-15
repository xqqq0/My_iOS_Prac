//
//  TestCollectionViewController.m
//  ALL_TEST
//
//  Created by qinxinghua on 2021/12/15.
//

#import "TestCollectionViewController.h"
#import "TestSelectCollectionCell.h"
@interface TestCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation TestCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout =  [[UICollectionViewFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [collectionView registerClass:[TestSelectCollectionCell class] forCellWithReuseIdentifier:@"TestSelectCollectionCell"];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    [collectionView reloadData];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestSelectCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TestSelectCollectionCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed: (arc4random() % 256)/255.0 green: (arc4random() % 256)/255.0 blue: (arc4random() % 256)/255.0 alpha:1];
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
