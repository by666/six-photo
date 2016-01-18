//
//  SixPhotoView.h
//  by
//
//  Created by by.huang on 15/12/19.
//  Copyright © 2015年 by.huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SixPhotoViewDelegate <NSObject>

-(void)OnAddPhotoPress;

-(void)OnDeletePhotoPress : (int)tag;

@end


@interface SixPhotoView : UIView <UIGestureRecognizerDelegate>

@property (strong, nonatomic) id delegate;

-(instancetype)initWithData : (NSMutableArray *)imgArray;

/**
 * 获取新的排序
 */
-(NSMutableArray *)getNewOrder;

/**
 * 添加一张图片
 */
-(void)addImage : (UIImage *)image;

/**
 * 删除一张图片
 */
-(void)deleteImage : (int)tag;

/**
 * 替换一张图片
 */
-(void)replaceImage : (UIImage *)image
           tag : (int)tag;



@end
