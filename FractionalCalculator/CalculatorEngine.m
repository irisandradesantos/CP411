//
//  CalculatorEngine.m
//  FractionalCalculator
//
//  Created by Iris Andrade dos Santos on 26/10/14.
//  Copyright (c) 2014 Iris Andrade dos Santos. All rights reserved.
//

#import "CalculatorEngine.h"


static CalculatorEngine* _engine;
@implementation CalculatorEngine
@synthesize waitingOperand;
@synthesize waitingOperation;

-(id) init{
    self = [super init];
    if(self){
        waitingOperand = [[FractionalNumber alloc] initWithNumerator:0 denominator:1 rootFlag:false];
        waitingOperation = @selector(add:);
    }
    return self;
}
-(id <ArithmeticProtocol>) store: (id <ArithmeticProtocol> ) operand with: (SEL) operation{
    // NSLog(@"Oi");
    id returnid = [self.waitingOperand performSelector:self.waitingOperation withObject:operand];
    [self setWaitingOperand:returnid];
    [self setWaitingOperation:operation];
    return returnid;
}
-(id <ArithmeticProtocol>) store2: (id <ArithmeticProtocol> ) operand with: (SEL) operation and: (id <ArithmeticProtocol> ) operand2{
    // NSLog(@"Oi");
    id returnid = [operand performSelector: operation withObject:operand2];
    //[self setWaitingOperand:returnid];
    //[self setWaitingOperation:operation];
    return returnid;
}

-(NSMutableArray*) analyseExpression: (NSMutableArray*) exp{
    Stack* stack1 = [[Stack alloc] initWithSize:50];
    Stack* stack2 = [[Stack alloc] initWithSize:50];
    NSMutableArray * expRoot = [[NSMutableArray alloc] initWithObjects: nil  ];
    NSMutableArray * expWRoot = [[NSMutableArray alloc] initWithObjects: nil  ];
    //removing roots
    Stack * testStack =  [[Stack alloc] initWithSize:50];
    Stack * testStack2 =  [[Stack alloc] initWithSize:50];
    for (int i = [exp count]-1; i>=0; i --){
        
        if ([[exp objectAtIndex:i] isKindOfClass:[FractionalNumber class]] == YES){
            
            if ([[exp objectAtIndex:i] rootFlag] == true) {

                [testStack push:[exp objectAtIndex:i]];
                
                if(i>=1){
                    i = i-1;
                    [testStack push:[exp objectAtIndex:i]];
                    
                    while (i>=1 && [[exp objectAtIndex:i] isEqualToString:@"multiplication:"] ) {
                        
                        i = i -1;
                        [testStack push:[exp objectAtIndex:i]];
                        
                        if(i>=1){
                            i = i-1;
                            [testStack push:[exp objectAtIndex:i]];
                        }
                    }
                }
            }else{
            
                [testStack2 push:[exp objectAtIndex:i]];
            }
            
        }else{
            [testStack2 push:[exp objectAtIndex:i]];
        }
    }
    
    
    while (!testStack.empty) {
        [expRoot addObject:testStack.pop];
        
    }
    
    
    
    while (!testStack2.empty) {
        [expWRoot addObject:testStack2.pop];
        
    }
    

    
    // if exp >1
    if([expWRoot count] != 0){
        if ([[expWRoot objectAtIndex:0] isKindOfClass:[NSString class]] == YES) {
            [expRoot addObject:[expWRoot objectAtIndex:0]];
            [expWRoot removeObjectAtIndex:0];
        }
    }
    
   // NSLog(@"%@", expRoot);
    NSLog(@"%@", expWRoot);
    
   // NSLog(@"%d", [expWRoot count]);

    NSMutableArray * test = [[NSMutableArray alloc] initWithObjects: nil];
   
    if([expWRoot count]>2){
    
        
    
        for(id d in expWRoot){
            //NSLog(@"oi");
            if([d isKindOfClass:[FractionalNumber class]] == YES){
                
                [stack1 push:d];
          
            }else{
  
                if(!stack2.empty){
                    
                    if([stack2.top  isEqual: @"multiplication:"] ||[stack2.top  isEqual: @"division:"]){
                        
                        [stack1 push:[stack2 pop]];
                    }else{
                    
                        if([d isEqualToString:@"multiplication:"] || [d isEqualToString:@"division:"]){
                        
                            [stack2 push:d];
                         
                        }else{
                            while (!stack2.empty) {
                                [stack1 push:[stack2 pop]];
                            }
                        
                            [stack2 push:d];
                            
                        }
                    }
                }else{
                    [stack2 push:d];
                  
                
                }
            
            
            }
        
        }
        while (!stack2.empty) {
            [stack1 push:[stack2 pop]];
        }
    
   
    
        while (!stack1.empty) {
            [test addObject:stack1.pop];
       
        }
   
        for (int i =[test count]-1 ; i>=0; i--) {
            if ([[test objectAtIndex:i] isKindOfClass:[NSString class]] == YES) {
          
                NSString * run = [test objectAtIndex:i];
           
                id <ArithmeticProtocol> result ;
                if ([run isEqualToString:@"multiplication:"]) {
                    result = [[test objectAtIndex:i+2] performSelector: @selector(multiplication:) withObject:[test objectAtIndex:i+1]];
                }
                if ([run isEqualToString:@"division:"]) {
                    result = [[test objectAtIndex:i+2] performSelector: @selector(division:) withObject:[test objectAtIndex:i+1]];
                }
                if ([run isEqualToString:@"add:"]) {
                    result = [[test objectAtIndex:i+2] performSelector: @selector(add:) withObject:[test objectAtIndex:i+1]];
                }
                if ([run isEqualToString:@"subtract:"]) {
                    result = [[test objectAtIndex:i+2] performSelector: @selector(subtract:) withObject:[test objectAtIndex:i+1]];
                }
                NSMutableArray * temp = [[NSMutableArray alloc] initWithObjects: nil];
                for (int j = 0; j <= i; j++) {
                    if (j == i) {
                        [temp addObject:result];
                        for (int k = j+3; k<[test count]; k++) {
                            [temp addObject:[test objectAtIndex:k]];
                        }
                    }else
                        [temp addObject:[test objectAtIndex:j]];
                
                }
                test = temp;

                i = [test count] -1;
            }
        }
  
        //FractionalNumber * frac = [test objectAtIndex:0];
        //NSLog(@"numerador %d denominador %d", frac.numerator, frac.denominator);
    }
    //NSLog(@"passei");
    //[test objectAtIndex:0];
    if ([test count] == 0 ) {
        //NSLog(@"passei1");
        return expRoot;
    }else if([expRoot count] == 0){
        //NSLog(@"passei2");
        return test;
    }else{
       // NSLog(@"passei3");
        if([[expRoot objectAtIndex:0] isKindOfClass:[NSString class]]== YES){
            [test addObjectsFromArray:expRoot];
            return test;
        }else{
            [expRoot addObjectsFromArray:test];
            return expRoot;
        }
    }
    return expRoot;
}
+(CalculatorEngine*) sharedCalculatorEngine{
    if (_engine == nil) {
        _engine = [[CalculatorEngine alloc] init];
    }
    return _engine;
}
@end
