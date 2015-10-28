 //
//  EditViewController.m
//  Sqllite3Cdemo
//
//  Created by qingyun on 15/10/19.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "EditViewController.h"
#import "ClassMateMode.h"
#import "DBHandleOpration.h"


@interface EditViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfID;
@property (weak, nonatomic) IBOutlet UITextField *tfName;
@property (weak, nonatomic) IBOutlet UITextField *tfPhone;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end

@implementation EditViewController
- (IBAction)clickPickerImageView:(id)sender {
    //图片选择器
    UIImagePickerController *pickerViewcontroller=[[UIImagePickerController alloc] init];
    //相册
    pickerViewcontroller.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    pickerViewcontroller.delegate=self;
    [self presentViewController:pickerViewcontroller animated:YES completion:^{
        
    }];
    
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    _iconImage.image=image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}


-(void)SaveValue{
    ClassMateMode *mode=[[ClassMateMode alloc] initWith:_tfName.text Id:_tfID.text.intValue phoneFor:_tfPhone.text icon:UIImageJPEGRepresentation(_iconImage.image, 1)];
    
    if ([[DBHandleOpration ShardDBHandle] updateValueForMode:mode]) {
        NSLog(@"======修改成功");
    }
}

-(void)addsubView{
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(SaveValue)];
    self.navigationItem.rightBarButtonItem=item;
    
}


- (void)viewDidLoad {
    [self addsubView];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
