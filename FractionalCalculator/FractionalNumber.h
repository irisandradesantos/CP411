//
//  FractionalNumber.h
//  FractionalCalculator
//
//  Created by Iris Andrade dos Santos on 26/10/14.
//  Copyright (c) 2014 Iris Andrade dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArithmeticProtocol.h"

@interface FractionalNumber : NSObject <ArithmeticProtocol>
@property (assign) int numerator;
@property (assign) int denominator;
@property (assign) BOOL rootFlag;

+(instancetype) theFractionalNumber;

-(FractionalNumber*) initWithNumerator: (int) n denominator: (int) d rootFlag: (BOOL) flag;

-(FractionalNumber*) simplifyNumber;


//-(FractionalNumber*) add: (int) n denominator: (int) d;

//-(FractionalNumber*) sub: (int) n denominator: (int) d;

//-(FractionalNumber*) multiplication: (int) n denominator: (int) d;

//-(FractionalNumber*) division: (int) n denominator: (int) d;
@end
