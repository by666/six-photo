//
//  MovePhotoView.m
//  by
//
//  Created by by.huang on 15/12/19.
//  Copyright © 2015年 by.huang. All rights reserved.
//

#import "MovePhotoView.h"

@interface MovePhotoView()

@end

@implementation MovePhotoView


-(instancetype)init
{
    if(self == [super init])
    {
        self.userInteractionEnabled = YES;
        self.clipsToBounds = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}







@end
