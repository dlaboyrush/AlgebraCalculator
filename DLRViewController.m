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
    BOOL isOperatorPressed;
    
    
    
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

//update the firstNumber and the secondNumber outlets

- (IBAction)digitPressed:(UIButton *)sender
{
    if (!isOperatorPressed){
    if (!isDigitPressed){
        self.firstNumber.text = [NSString string];
        
        self.firstNumber.text = [self.firstNumber.text stringByAppendingString:sender.titleLabel.text];
        isDigitPressed = YES;
    }
    
    else {
    self.firstNumber.text = [self.firstNumber.text stringByAppendingString:sender.titleLabel.text];
    }
    }
    else{
        if (!isDigitPressed){
            self.secondNumber.text = [NSString string];
            
            self.secondNumber.text = [self.secondNumber.text stringByAppendingString:sender.titleLabel.text];
            isDigitPressed = YES;
        }
        
        else {
            self.secondNumber.text = [self.secondNumber.text stringByAppendingString:sender.titleLabel.text];
        }
    }
}

//updates the operator level
- (IBAction)operatorPressed:(UIButton *)sender
{
    self.dFirstNumber = self.firstNumber.text.intValue;
    self.dSecondNumber  = self.secondNumber.text.intValue;
    self.dResult = self.result.text.doubleValue;
    
    
    if ([sender.titleLabel.text isEqualToString:(@"C")]){
        [self clear];
        
    }
    
    else {
        if (![sender.titleLabel.text isEqualToString:@"="]){
            //do the calculation
            [self doCalculationWithOperator:self.operator.text];
            self.operator.text = sender.titleLabel.text;
            

    }
        else{
            [self doCalculationWithOperator:self.operator.text];
            self.result.text = [NSString stringWithFormat:@"%.2f",self.dResult];
            self.secondNumber.text = @"0";
            
            
        }
        isOperatorPressed = YES;
        isDigitPressed = NO;
        
    }
    
    
}
- (void)doCalculationWithOperator:(NSString *)operator
{
    if ([operator isEqualToString:@"+"]){
        self.dResult = self.dFirstNumber + self.dSecondNumber;
        self.firstNumber.text = [NSString stringWithFormat: @"%.2f",self.dResult];
        self.secondNumber.text = @"0";
        
        
    }
    else if ([operator isEqualToString:@"-"]) {
        self.dResult = self.dFirstNumber - self.dSecondNumber;
        self.firstNumber.text = [NSString stringWithFormat: @"%.2f",self.dResult];
        self.secondNumber.text = @"0";
        
    }
    else if ([operator isEqualToString:@"x"]){
        self.dResult = self.dFirstNumber * self.dSecondNumber;
        self.firstNumber.text = [NSString stringWithFormat: @"%.2f",self.dResult];
        self.secondNumber.text = @"0";
    
    }
    else if ([operator isEqualToString:@"/"]){
        if ( self.dSecondNumber != 0) {
            self.dResult = self.dFirstNumber / self.dSecondNumber;
            self.firstNumber.text = [NSString stringWithFormat: @"%.2f",self.dResult];
            self.secondNumber.text = @"0";
            
        
        
    }
    }
}
- (void)clear
{
    self.firstNumber.text = @"0";
    self.secondNumber.text = @"0";
    self.result.text = @"0";
    self.operator.text = [NSString string];
    isOperatorPressed = NO;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    isDigitPressed = NO;
    isOperatorPressed = NO;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
