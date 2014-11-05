
//
//  FractionalNumber.m
//  FractionalCalculator
//
//  Created by Iris Andrade dos Santos on 26/10/14.
//  Copyright (c) 2014 Iris Andrade dos Santos. All rights reserved.
//

#import "FractionalNumber.h"


FractionalNumber * _the_fractional;
@implementation FractionalNumber
@synthesize numerator;
@synthesize denominator;
@synthesize rootFlag;

+(instancetype) theFractionalNumber{
    if(_the_fractional == nil){
        _the_fractional = [[FractionalNumber alloc] init];
    }
    return _the_fractional;
}

-(FractionalNumber*) initWithNumerator: (int) n denominator: (int) d rootFlag:(BOOL)flag{
    assert(d != 0);
    self = [super init];
    if (self){
        self.numerator = n;
        self.denominator = d;
        self.rootFlag = flag;
    }
    return self;
}

-(FractionalNumber*)root{
    NSLog(@"root baby");
    return self ;
}

-(FractionalNumber*) add: (FractionalNumber*) rhs{
    
    int newNumerator = ((rhs.denominator*self.numerator)+(self.denominator*rhs.numerator));
    int newDenominator = self.denominator * rhs.denominator;
    
    [self setNumerator:newNumerator];
    [self setDenominator:newDenominator];
    
    if(self.numerator == 1){
        return self;
    }else
        return [self simplifyNumber];
    
}

-(FractionalNumber*) subtract: (FractionalNumber*) rhs{

    int newNumerator = ((rhs.denominator*self.numerator)-(self.denominator*rhs.numerator));
    int newDenominator = self.denominator * rhs.denominator;
    
    [self setNumerator:newNumerator];
    [self setDenominator:newDenominator];
    
    if(self.numerator == 1){
        return self;
    }else
        return [self simplifyNumber];

}

-(FractionalNumber*) multiplication: (FractionalNumber*) rhs{
    int newNumerator = (self.numerator*rhs.numerator);
    int newDenominator = (self.denominator * rhs.denominator);

    [self setNumerator:newNumerator];
    [self setDenominator:newDenominator];

     if(self.numerator == 1){
         return self;
     }else
         return [self simplifyNumber];

}
-(FractionalNumber*) division: (FractionalNumber*) rhs{

    int newNumerator = (self.numerator*rhs.denominator);
    int newDenominator = (self.denominator * rhs.numerator);

    [self setNumerator:newNumerator];
    [self setDenominator:newDenominator];
    
    if(self.numerator == 1){

        return self;
    }else
        
        return [self simplifyNumber];

}

-(FractionalNumber*) simplifyNumber{
    int newNumerator = self.numerator;
    int newDenominator = self.denominator;
  
    FractionalNumber *results = [[FractionalNumber alloc] initWithNumerator:newNumerator denominator:newDenominator rootFlag:false];
    
    if ((newNumerator - floor(newNumerator / newDenominator) * newDenominator) == 0) {
        
        results = [[FractionalNumber alloc] initWithNumerator:newNumerator/newDenominator denominator:1 rootFlag:false];
        return results;
    }else{
        NSMutableArray * factorsN = [[NSMutableArray alloc] initWithObjects: nil];
        
        int d = 2;
        int rem = 0;
        while (newNumerator > 1){
            rem = (newNumerator - floor(newNumerator / d) * d);
            
            while ((newNumerator - floor(newNumerator / d) * d) == 0){
                [factorsN addObject: [NSNumber numberWithInt:d]];
                newNumerator /= d;
            }
            d = d + 1;
            
        }
        
        NSMutableArray * factorsD = [[NSMutableArray alloc] initWithObjects: nil];
        
        
        d = 2;
        
        while (newDenominator > 1){
            
            while ((newDenominator - floor(newDenominator / d) * d) == 0){
                [factorsD addObject: [NSNumber numberWithInt:d]];
                
                newDenominator /= d;
            }
            d = d + 1;
        }
        //removing numbers in common
        for(int i = 0; i< [factorsN count]; i++){
            
            for (int j = 0 ; j< [factorsD count]; j++) {
                
                if([[factorsN objectAtIndex:i] isEqual: [factorsD objectAtIndex:j]]){
                    
                    [factorsN removeObjectAtIndex:i];
                    [factorsD removeObjectAtIndex:j];
                }
            }
            
        }
        newNumerator = 1;
        for (int i = 0 ; i<[factorsN count]; i++) {
            newNumerator *= [[factorsN objectAtIndex:i] intValue];
        }
        newDenominator = 1;
        for (int i = 0 ; i<[factorsD count]; i++) {
            newDenominator *= [[factorsD objectAtIndex:i] intValue];
        }
        
    }
    [results setNumerator:newNumerator];
    [results setDenominator:newDenominator];

    return results;
}


@end
