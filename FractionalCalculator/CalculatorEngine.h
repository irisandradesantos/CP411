//
//  CalculatorEngine.h
//  FractionalCalculator
//
//  Created by Iris Andrade dos Santos on 26/10/14.
//  Copyright (c) 2014 Iris Andrade dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FractionalNumber.h"
#import "Stack.h"
@interface CalculatorEngine : NSObject

@property (retain, nonatomic) id <ArithmeticProtocol> waitingOperand;
@property (assign, nonatomic) SEL waitingOperation;



//brain dead calc

-(id <ArithmeticProtocol>) store: (id <ArithmeticProtocol> ) operand with: (SEL) operation;
-(id <ArithmeticProtocol>) store2: (id <ArithmeticProtocol> ) operand with: (SEL) operation and: (id <ArithmeticProtocol> ) operand2;
-(NSMutableArray*) analyseExpression: (NSMutableArray*) exp;
+(CalculatorEngine*) sharedCalculatorEngine;
@end
