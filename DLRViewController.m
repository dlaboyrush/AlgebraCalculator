//
//  DLRViewController.m
//  AlgebraCalculator
//
//  Created by Diana  Laboy-Rush on 8/11/14.
//  Copyright (c) 2014 Diana Laboy-Rush. All rights reserved.
//

#import "DLRViewController.h"

@interface DLRViewController ()

{
    BOOL isDigitPressed;
    
    
    
}

//UI outlets
@property (weak, nonatomic) IBOutlet UILabel *firstNumber;
@property (weak, nonatomic) IBOutlet UILabel *secondNumber;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UILabel *operator;

//keypad features
@property (weak, nonatomic) IBOutlet UIView *keypadView;

@property (nonatomic) double dFirstNumber;
@property (nonatomic) double dSecondNumber;
@property (nonatomic) double dResult;




@end

@implementation DLRViewController

- (IBAction)digitPressed:(UIButton *)sender
{
    if (!isDigitPressed){
        self.firstNumber.text = [NSString string];
        
        self.firstNumber.text = [sender.titleLabel.text stringByAppendingString:sender.titleLabel.text];
        isDigitPressed = YES;
    }
    
    else {
    self.firstNumber.text = [sender.titleLabel.text stringByAppendingString:sender.titleLabel.text];
    }
}

- (IBAction)operatorPressed:(UIButton *)sender
{
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    isDigitPressed = NO;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
