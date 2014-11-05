//
//  ViewController.h
//  FractionalCalculator
//
//  Created by Iris Andrade dos Santos on 26/10/14.
//  Copyright (c) 2014 Iris Andrade dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalculatorEngine.h"
#import "CalculatorView.h"

@interface ViewController : UIViewController
@property (retain, nonatomic) NSMutableArray * expression;
@property (assign) int fraction1Count;
@property (retain, nonatomic) NSString * numerator;
@property (retain, nonatomic) NSString * denominator;
@property (retain, nonatomic) CalculatorEngine* engine;
@property (assign) int rootOn;
@property (weak, nonatomic) IBOutlet CalculatorView *display;

- (IBAction)createFraction1:(id)sender;
- (IBAction)Button:(id)sender;


@end
