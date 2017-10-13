//
//  BaseTableViewCell.m
//  Demo
//
//  Created by 李峰 on 2017/9/27.
//  Copyright © 2017年 李峰. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "MainConfigure.h"

@implementation BaseTableViewCell

+ (instancetype) tableViewCellWithTableView:(UITableView *)tableView
{
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifier]];
    if (nil == cell) {
        cell = [[[self class] alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:[self cellIdentifier]];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configure];
    }
    return self;
}

- (void)configure
{
    //    self.clipsToBounds                  = YES;
    self.selectionStyle                 = UITableViewCellSelectionStyleNone;
    self.backgroundColor = SM_whiteColor;
    self.contentView.backgroundColor    = SM_whiteColor;
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = HEXCOLOR(@"#F6F6F6");
        _bgView.hidden = YES;
    }
    return _bgView;
}
+ (NSString *)cellIdentifier
{
    return NSStringFromClass([self class]);
}

+ (CGFloat) cellHeight
{
    return DBL_EPSILON;
}

- (void)configureCellWithObj:(id)obj
{
    
}

- (void)dealloc
{
    NSLog(@"%@__dealloc",NSStringFromClass([self class]));
}
@end
