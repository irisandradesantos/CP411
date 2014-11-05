//
//  Stack.h
//  FractionalCalculator
//
//  Created by Iris Andrade dos Santos on 31/10/14.
//  Copyright (c) 2014 Iris Andrade dos Santos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject{
    int _MAX;
}
@property (assign) int MAX;
@property (retain) NSMutableArray* stack;
@property (retain) id top;

-(Stack*) initWithSize: (int) size;
-(void) push: (id) object;
-(id) pop;
-(BOOL) empty;
-(BOOL) full;

@end
