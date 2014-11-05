//
//  ArithmeticProtocol.h
//  FractionalCalculator
//
//  Created by Iris Andrade dos Santos on 27/10/14.
//  Copyright (c) 2014 Iris Andrade dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ArithmeticProtocol <NSObject>
-(id) add: (id) rhs;
-(id) subtract: (id) rhs;
-(id) multiplication: (id) rhs;
-(id) division: (id) rhs;
-(id) root;
@end
