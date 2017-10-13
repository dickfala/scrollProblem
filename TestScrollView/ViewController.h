//
//  ViewController.h
//  TestScrollView
//
//  Created by  on 2017/10/13.
//  Copyright © 2017年 Test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *sv;
@property (strong, nonatomic) IBOutlet UIView *keyboardToolbarVw;
- (IBAction)keyboardToolbarDoenBtnAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *tf;

@end

