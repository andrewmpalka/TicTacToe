//
//  ViewController.m
//  TicTacToe
//
//  Created by Andrew Palka on 1/14/16.
//  Copyright © 2016 Andrew Palka. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (weak, nonatomic) IBOutlet UIButton *buttonFive;
@property (weak, nonatomic) IBOutlet UIButton *buttonSix;
@property (weak, nonatomic) IBOutlet UIButton *buttonSeven;
@property (weak, nonatomic) IBOutlet UIButton *buttonEight;
@property (weak, nonatomic) IBOutlet UIButton *buttonNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    self.whichPlayerLabel.text = @"Your turn!";
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *buttonArray = @[self.buttonOne, self.buttonTwo, self.buttonThree, self.buttonFour, self.buttonFive, self.buttonSix, self.buttonSeven, self.buttonEight];
    
    for (UIButton *button in buttonArray) {
        [button setTitle:@"" forState:UIControlStateNormal];
        [button setEnabled:YES];
    }
}

-(BOOL)isGameOver:(NSString *)tag {
    /// 1
    if ([self.buttonOne.currentTitle isEqualToString:tag] ){
        if ([self.buttonTwo.currentTitle isEqualToString:tag]) {
            if ([self.buttonThree.currentTitle isEqualToString:tag]) {
                NSLog(@"Reached");
                return TRUE;

            }
        }
        else if ([self.buttonFour.currentTitle isEqualToString:tag]){
            if ([self.buttonSeven.currentTitle isEqualToString:tag]) {
                return TRUE;
            }
            else if ([self.buttonFive.currentTitle isEqualToString:tag]){
                if ([self.buttonNine.currentTitle isEqualToString:tag]) {
                    return TRUE;
                }
            }
        }
        //2
    } if ([self.buttonTwo.currentTitle isEqualToString:tag]) {
        if ( [self.buttonFive.currentTitle isEqualToString:tag]) {
            if ( [self.buttonEight.currentTitle isEqualToString:tag]) {
                return TRUE;
            }
        }
        //3
    } if ([self.buttonThree.currentTitle isEqualToString:tag]) {
        if ( [self.buttonSix.currentTitle isEqualToString:tag]) {
            if ( [self.buttonNine.currentTitle isEqualToString:tag]) {
                return  TRUE;
            }
        }
        
        //4
    } if ( [self.buttonFour.currentTitle isEqualToString:tag]) {
        if ( [self.buttonFive.currentTitle isEqualToString:tag]) {
            if ( [self.buttonSix.currentTitle isEqualToString:tag]) {
                return TRUE;
            }
        }
        //7
    } if ( [self.buttonSeven.currentTitle isEqualToString:tag]) {
        if ( [self.buttonEight.currentTitle isEqualToString:tag]) {
            if ( [self.buttonNine.currentTitle isEqualToString:tag]) {
                return true;
            }
        } else if ( [self.buttonFive.currentTitle isEqualToString:tag]){
            if ( [self.buttonThree.currentTitle isEqualToString:tag]) {
                return true;
            }
        }
    }
    NSLog([NSString stringWithFormat:@"button1%@tag%@",self.buttonOne.currentTitle,tag]);
    return NO;
}

- (void)whoWon:(NSString *)tag {
    self.whichPlayerLabel.text = [NSString stringWithFormat:@"Game Over"];
    if ([tag isEqualToString:@"X"]){
//        self.whichPlayerLabel.text = [NSString stringWithFormat:@"You Won"];
        UIAlertController *winner = [UIAlertController alertControllerWithTitle:@"You Won!" message:@"Congrats!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *reset = [UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self viewDidLoad];
        }];
        [self presentViewController:winner animated:YES completion:nil];
        [winner addAction:reset];
        
        } else {
//        self.whichPlayerLabel.text = [NSString stringWithFormat:@"Computer Won"];
            UIAlertController *winner = [UIAlertController alertControllerWithTitle:@"Computer Won!" message:@"Sorry!!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *reset = [UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                [self viewDidLoad];
            }];
            [self presentViewController:winner animated:YES completion:nil];
            [winner addAction:reset];
    }
}

-(IBAction)onButtonTapped:(UIButton *)sender {
    if ([self.whichPlayerLabel.text isEqualToString:@"Your turn!"]) {
        [sender setTitle:@"X" forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [sender setEnabled:NO];
        
        if ([self isGameOver:sender.currentTitle]) {
            [self whoWon:sender.currentTitle];
        } else {
            self.whichPlayerLabel.text = [NSString stringWithFormat:@"Computer's turn!"];
        }
    } else {
        [sender setTitle:@"O" forState:UIControlStateNormal];
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [sender setEnabled:NO];
        
        if ([self isGameOver:sender.currentTitle]){
            [self whoWon:sender.currentTitle];
        } else {
            self.whichPlayerLabel.text = [NSString stringWithFormat:@"Your turn!"];
        }
    }
    
}


@end
