//
//  CalculatorView.m
//  FractionalCalculator
//
//  Created by Iris Andrade dos Santos on 02/11/14.
//  Copyright (c) 2014 Iris Andrade dos Santos. All rights reserved.
//

#import "CalculatorView.h"

@implementation CalculatorView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    NSLog(@"desenhando");
    //getting the context
    CGColorRef gray = [[UIColor grayColor] CGColor];
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    
    // Drawing with a white stroke color
    // setting the stroke color
    //CGContextSetRGBStrokeColor(context, 1.0, 1.0, 0.0, 1.0);
    // And drawing with a red fill color
    CGContextSetFillColorWithColor(context, gray);
    //CGContextSetRGBFillColor(context, 1.0, 1.0, 0.0, 1.0);
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    //CGContextSetLineWidth(context, 2.0);
    
    
    // Add Rect to the current path, then stroke it
    
    // CGRectMake(x, y, width, length)
    
    //CGContextAddRect(context, CGRectMake(35.0, 72.0, 264.0, 70.0));
    //CGContextStrokePath(context);
    //CGContextFillPath(context);
    CGContextFillRect(context, CGRectMake(0, 0, 288.0, 108.0));
    
    
    
    
    
}




@end
