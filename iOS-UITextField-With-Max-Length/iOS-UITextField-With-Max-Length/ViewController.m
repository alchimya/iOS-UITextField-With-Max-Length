//
//  ViewController.m
//  iOS-UITextField-With-Max-Length
//
//  Created by Domenico Vacchiano on 01/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "ViewController.h"
#import "L3SDKTextField.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet L3SDKTextField *myTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //set delegate and maxLength
    self.myTextField.delegate=self;
    self.myTextField.maxLength=2;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    //delegate works!
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    //delegate works!
    NSLog(@"textFieldShouldBeginEditing");
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //delegate works!
    NSLog(@"textFieldShouldReturn");
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
