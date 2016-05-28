//
//  TableFooterView.h
//  LimitFreeDemo
//
//  Created by 千锋 on 15/12/14.
//  Copyright (c) 2015年 LG. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, RefreshStatus)
{
    RefreshStatusNotVisiable,   //不可见
    RefreshStatusLoading,       //加载
    RefreshStatusError,         //加载失败
    RefreshStatusMore,          //加载更多
    RefreshStatusNotMore,       //没有更多数据
};
@interface TableFooterView : UIView

//是否能过响应点击
-(BOOL)respondsToTouch;

//表示当前状态
@property(nonatomic,assign)RefreshStatus status;
@end
