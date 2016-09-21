//
//  ViewController.m
//  MNTapCounter
//
//  Created by Mrunalini on 19/09/16.
//  Copyright © 2016 Mrunalini Nemade. All rights reserved.
//

#define kHeightOfResetButton 80.0
#define kHeightOfStatusBar 20.0
#define kHeightToReduceFrom (kHeightOfResetButton + kHeightOfStatusBar)

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    CGFloat heightOfScreen = [[UIScreen mainScreen] bounds].size.height;
    
    CGFloat widthOfScreen = [[UIScreen mainScreen] bounds].size.width;
    
    CGRect labelNumberFrame = CGRectMake(0, kHeightOfStatusBar, widthOfScreen, heightOfScreen-kHeightToReduceFrom);
    
    labelNumber = [[UILabel alloc]initWithFrame:labelNumberFrame];
    labelNumber.backgroundColor = [UIColor whiteColor];
    labelNumber.textColor = [UIColor blackColor];
    [self handleReset];
    
    labelNumber.textAlignment = NSTextAlignmentCenter;
    labelNumber.font = [UIFont systemFontOfSize:100];
    [self.view addSubview:labelNumber];
    
    
    buttonTap = [[UIButton alloc]initWithFrame:labelNumberFrame];
    [buttonTap addTarget:self action:@selector(handleTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonTap];
    
    
    CGRect resetButtonFrame = CGRectMake(0, heightOfScreen-kHeightOfResetButton, widthOfScreen, kHeightOfResetButton);
    buttonReset = [[UIButton alloc]initWithFrame:resetButtonFrame];
    
    [buttonReset setTitle:@"RESET" forState:UIControlStateNormal];
    [buttonReset setTitle:@"RESETING..." forState:UIControlStateHighlighted];
    
    [buttonReset setTintColor:[UIColor whiteColor]];
    [buttonReset setBackgroundColor:[UIColor blackColor]];
    
    [buttonReset addTarget:self action:@selector(handleReset) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonReset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleTap {
    
    NSString *currentValueString = labelNumber.text;
    
    int currentValueInt = currentValueString.intValue;
    
    currentValueInt = currentValueInt + 1;
    
    NSString *newValueString = [NSString stringWithFormat:@"%d",currentValueInt];
    
    labelNumber.text = newValueString;
    
    // NSString *currentTextstring = labelNumber.text;
    //    char character=[currentTextstring characterAtIndex:0];
    //
    //
    //    if(character == 'Z')
    //        [ self handleReset];
    //    else
    //    {
    //        //
    //        int ascii = (int)character;
    //
    //
    //        ascii = ascii + 1;
    //
    //        character=(char)ascii;
    //
    //
    //        NSString  *newString = [NSString stringWithFormat:@"%c",character];
    //        labelNumber.text=newString;
    //
}
//
//    NSLog(@"%d",ascii);


-(void)handleReset {
    labelNumber.text = @"0";
}



@end

