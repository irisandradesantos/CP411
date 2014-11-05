//
//  ViewController.m
//  FractionalCalculator
//
//  Created by Iris Andrade dos Santos on 26/10/14.
//  Copyright (c) 2014 Iris Andrade dos Santos. All rights reserved.
//

#import "ViewController.h"
#import "FractionalNumber.h"


@interface ViewController ()

@end

@implementation ViewController
//@synthesize expression;
@synthesize fraction1Count;
@synthesize numerator;
@synthesize denominator;
@synthesize engine;
@synthesize expression;
@synthesize rootOn;
@synthesize display;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    expression = [NSMutableArray arrayWithObjects: nil];
    fraction1Count = 0;
    engine = [CalculatorEngine sharedCalculatorEngine];
    numerator = @"";
    denominator = @"1";
    rootOn = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createFraction1:(id)sender{
    fraction1Count = 1;
    denominator = @"";
}

- (IBAction)createFraction2:(id)sender {
}

- (IBAction)Button:(id)sender {
    
    
    //NSLog(@"fra%d", fraction1Count);
    if ([sender tag] <= 9) {
        
        if(fraction1Count == 0) {

            numerator = [numerator stringByAppendingString:[NSString stringWithFormat:@"%d", [sender tag]]];
          //  display.text = [display.text stringByAppendingString:[NSString stringWithFormat:@"%d", [sender tag]]];
        }else if(fraction1Count == 1){

            denominator = [denominator stringByAppendingString:[NSString stringWithFormat:@"%d", [sender tag]]];
           
            //display.text = [display.text stringByAppendingString:[NSString stringWithFormat:@"%d", [sender tag]]];
            
            NSLog(@"fracao %@", denominator);
        }
    }
    if ([sender tag]>9) {
        
        FractionalNumber * number ;
        //tem que verificar se o denominador eh zero
        switch ([sender tag]) {
            case 10:
                //call engine
                NSLog(@"*");
               // display.text = [display.text stringByAppendingString:@"*"];
                if (denominator == 0) {
                    NSLog(@"Error");
                }else{
                    if (rootOn == 1 ) {
                        number = [[FractionalNumber alloc] initWithNumerator: numerator.intValue denominator:denominator.intValue rootFlag:true];
                        rootOn = 0;
                    }else{
                        number = [[FractionalNumber alloc] initWithNumerator: numerator.intValue denominator:denominator.intValue rootFlag:false];
                    }
                    [expression addObject:number];
                    [expression addObject:@"multiplication:"];
                }
                numerator = @"";
                denominator =@"1";
                fraction1Count = 0;
                break;
            case 11:
                //call engine
                NSLog(@"/");
                //display.text = [display.text stringByAppendingString:@"/"];
                //[engine store:number with:@selector(division:)];
                if (denominator == 0) {
                    NSLog(@"Error");
                }else{
                    if (rootOn == 1 ) {
                        number = [[FractionalNumber alloc] initWithNumerator: numerator.intValue denominator:denominator.intValue rootFlag:true];
                        rootOn = 0;
                    }else{
                        number = [[FractionalNumber alloc] initWithNumerator: numerator.intValue denominator:denominator.intValue rootFlag:false];
                    }
                    [expression addObject:number];
                    [expression addObject:@"division:"];
                }
                numerator = @"";
                denominator =@"1";
                fraction1Count = 0;
                break;
            case 12:
                NSLog(@"+");
                //call engine
                //display.text = [display.text stringByAppendingString:@"+"];
                if (denominator == 0) {
                    NSLog(@"Error");
                }else{
                    if (rootOn == 1 ) {
                        number = [[FractionalNumber alloc] initWithNumerator: numerator.intValue denominator:denominator.intValue rootFlag:true];
                        rootOn = 0;
                    }else{
                        number = [[FractionalNumber alloc] initWithNumerator: numerator.intValue denominator:denominator.intValue rootFlag:false];
                    }
                    //[engine store:number with:@selector(add:)];
                    [expression addObject:number];
                    [expression addObject:@"add:"];
                }
                numerator = @"";
                denominator =@"1";
                fraction1Count = 0;
                break;
            case 13:
                NSLog(@"-");
                
                if (denominator == 0) {
                    NSLog(@"Error");
                }else{
                
                    if (rootOn == 1 ) {
                        number = [[FractionalNumber alloc] initWithNumerator: numerator.intValue denominator:denominator.intValue rootFlag:true];
                        rootOn = 0;
                    }else{
                        number = [[FractionalNumber alloc] initWithNumerator: numerator.intValue denominator:denominator.intValue rootFlag:false];
                    }
                    //[engine store:number with:@selector(subtract:)];
                    [expression addObject:number];
                    [expression addObject:@"subtract:"];
                }
                numerator = @"";
                denominator =@"1";
                fraction1Count = 0;
                break;
            case 14:
                NSLog(@"+-");
                //call engine
                
                if([[numerator substringToIndex:1] isEqualToString: @"-"]){
                    
                    numerator = [numerator substringFromIndex:1];
                }else{
                    numerator = [@"-" stringByAppendingString: numerator];
                
                }
                 NSLog(@"%@",numerator);
                /*[engine store:[[FractionalNumber alloc] initWithNumerator:2 denominator:1] with:@selector(add:)];*/
                
                break;
            case 15:
                NSLog(@"=");
                //call engine
                //verificar se o ultimo objeto eh da classe string
                
                
                if (rootOn == 1 ) {
                    number = [[FractionalNumber alloc] initWithNumerator: numerator.intValue denominator:denominator.intValue rootFlag:true];
                    rootOn = 0;
                }else{
                    number = [[FractionalNumber alloc] initWithNumerator: numerator.intValue denominator:denominator.intValue rootFlag:false];
                
                }
                [expression addObject:number];
                
                
                if ([expression count] >1) {
                        NSMutableArray * result = [engine analyseExpression:expression];
                    NSLog(@"result %@", result);
                }else{
                    NSLog(@"result %@", expression);
                }
            
                numerator = @"";
                denominator =@"1";
                fraction1Count = 0;
                [expression removeAllObjects];
                break;
            case 16:
                NSLog(@"root:");
                rootOn = 1;
                //[expression addObject:@"root:"];
                //numerator = @"";
                //denominator =@"1";
                //fraction1Count = 0;
                //analizar se o que tem antes eh um numero
                break;
            case 17:
                //clean screen
                NSLog(@"AC");
                //display.text = @"";
                numerator = @"";
                denominator =@"1";
                fraction1Count = 0;
                [expression removeAllObjects];
                
                break;
            default:
                break;
        }
        
       
    }
    
}



@end
