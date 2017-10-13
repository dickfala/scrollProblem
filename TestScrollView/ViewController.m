//
//  ViewController.m
//  TestScrollView
//
//  Created by  on 2017/10/13.
//  Copyright © 2017年 Test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     [self registerForKeyboardNotifications];
    self.tf.inputAccessoryView = self.keyboardToolbarVw;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.sv.contentInset = contentInsets;
    self.sv.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.view.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, self.view.frame.origin.y-kbSize.height);
        [self.sv setContentOffset:scrollPoint animated:YES];
    }
}


- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.sv.contentInset = contentInsets;
    self.sv.scrollIndicatorInsets = contentInsets;
}

- (IBAction)keyboardToolbarDoenBtnAction:(UIButton *)sender {
    [self.tf resignFirstResponder];
}
@end
