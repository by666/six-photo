//
//  ViewController.m
//  sixphoto
//
//  Created by by.huang on 16/1/18.
//  Copyright © 2016年 by.huang. All rights reserved.
//

#import "ViewController.h"


#define BIGIMAGE_WIDTH 199
#define DIVIDE_WIDTH 3
#define SMALLIMAGE_WIDTH (BIGIMAGE_WIDTH - DIVIDE_WIDTH)/2

@interface ViewController ()

@property(strong, nonatomic) SixPhotoView *sixPhotoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];

}

-(void)initView
{
    [self.view setBackgroundColor:[UIColor grayColor]];
    NSArray *array = @[@"image0",@"image1",@"image2",@"image3",@"image4",@"image5"];
    NSMutableArray *imgArray = [[NSMutableArray alloc]init];
    for(NSString *temp in array)
    {
        [imgArray addObject:[UIImage imageNamed:temp]];
    }
    _sixPhotoView = [[SixPhotoView alloc]initWithData:imgArray];
    [self.view addSubview:_sixPhotoView];
    _sixPhotoView.frame = CGRectMake(0, 0, BIGIMAGE_WIDTH + DIVIDE_WIDTH + SMALLIMAGE_WIDTH, BIGIMAGE_WIDTH + DIVIDE_WIDTH + SMALLIMAGE_WIDTH);
    _sixPhotoView.delegate = self;
}


-(void)OnAddPhotoPress
{
    
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"请选择" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *addAction = [UIAlertAction actionWithTitle:@"添加" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_sixPhotoView addImage:[UIImage imageNamed:@"image4"]];
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    [controller addAction:addAction];
    [controller addAction:cancelAction];
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)OnDeletePhotoPress : (int)tag
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"请选择" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction *replaceAction = [UIAlertAction actionWithTitle:@"替换" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_sixPhotoView replaceImage:[UIImage imageNamed:@"image5"] tag:tag];
        
    }];
    [controller addAction:replaceAction];
    
    if([[_sixPhotoView getNewOrder] count] > 1)
    {
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [_sixPhotoView deleteImage:tag];
            
        }];
        [controller addAction:deleteAction];
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [controller dismissViewControllerAnimated:YES completion:nil];
    }];
    [controller addAction:cancelAction];
    [self presentViewController:controller animated:YES completion:nil];
}


@end
