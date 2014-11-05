//
//  Stack.m
//  FractionalCalculator
//
//  Created by Iris Andrade dos Santos on 31/10/14.
//  Copyright (c) 2014 Iris Andrade dos Santos. All rights reserved.
//

#import "Stack.h"

@implementation Stack

@synthesize MAX;

-(Stack*) initWithSize: (int) size{
    self = [super init];
    if(self){
        _MAX = size;
        self.stack = [NSMutableArray arrayWithObjects:nil];
    }
    return self;
}
-(void) push: (id) object{
    // add if for full
    if (self.full) {
        NSLog(@"stack Full");
    }else{
        [self.stack addObject:object];
    }
}
-(id) pop{
    if(self.empty){
        NSLog(@"stack Empty");
        return nil;
    }
    id obj = [self.stack lastObject];
    [self.stack removeLastObject];
    return obj;
}
-(BOOL) empty{
    return [self.stack count] ==0;
}
-(BOOL) full{
    //NSLog(@"%d", [self.stack count] );
    //NSLog(@"%d", _MAX);
    return [self.stack count] == _MAX;
}



@end
