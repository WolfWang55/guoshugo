//
//  TableFooterView.m
//  LimitFreeDemo
//
//  Created by 千锋 on 15/12/14.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import "TableFooterView.h"

@implementation TableFooterView
{
    UIActivityIndicatorView * _indicatorView;
    UILabel *_textLabel;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        [self createViews];
    }
    return self;
}

//创建视图
-(void)createViews
{
    _textLabel=[[UILabel alloc]initWithFrame:self.bounds];
    [self addSubview:_textLabel];
    _textLabel.textAlignment=NSTextAlignmentCenter;
    _textLabel.font=[UIFont systemFontOfSize:14];
    
    //关闭停靠模式
    _textLabel.translatesAutoresizingMaskIntoConstraints=NO;
    [_textLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        //全等
        make.edges.equalTo(self);
    }];
    //创建一个灰色的活动指示器
    _indicatorView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:_indicatorView];
    _indicatorView.translatesAutoresizingMaskIntoConstraints=NO;
    [_indicatorView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_textLabel);
    }];
    _indicatorView.hidden = YES;
}

-(BOOL)respondsToTouch
{
    BOOL isTouch=self.status==RefreshStatusMore||self.status==RefreshStatusError;
    return isTouch;
}

-(void)setStatus:(RefreshStatus)status
{
    _status=status;
    NSArray *textArray=@[@"",@"",@"加载失败",@"加载更多",@"没有更多"];
    _textLabel.text=textArray[_status];
    if(_status==RefreshStatusLoading)
    {
        _indicatorView.hidden=NO;
        [_indicatorView startAnimating];
    }
    else
    {
        _indicatorView.hidden=YES;
        [_indicatorView stopAnimating];
    }
}
@end
