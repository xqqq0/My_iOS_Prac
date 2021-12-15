//
//  TestSelectCollectionCell.m
//  ALL_TEST
//
//  Created by qinxinghua on 2021/12/15.
//

#import "TestSelectCollectionCell.h"

@implementation TestSelectCollectionCell
- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    NSLog(@"-------%d",selected);
}
@end
