//
//  ViewController.m
//  Poker
//
//  Created by AKI on 2015/8/25.
//  Copyright (c) 2015年 AKI. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray_shuffle.h"

@interface ViewController ()
{
    NSMutableArray *mArray;
    
    int AnswerInt;
    
    IBOutlet UIImageView *imgCard;
    IBOutlet UIButton *btnGameStart;
    IBOutlet UILabel *lblAnwser1;
    IBOutlet UILabel *lblCardCount;
    
    IBOutlet UIButton *btnPlayer1;
    IBOutlet UIButton *btnPlayer2;
    IBOutlet UIButton *btnPlayer3;
    IBOutlet UIButton *btnPlayer4;
    
    
    int PLayer1;
    int PLayer2;
    int PLayer3;
    int PLayer4;
    
    
    int WhoIdx;
    
    BOOL isPlayer1Click;
    BOOL isPlayer2Click;
    BOOL isPlayer3Click;
    BOOL isPlayer4Click;
    
    
    BOOL isCardCorrect;
    
    int CardCount;
    
}
@end

@implementation ViewController



-(IBAction)btnClick:(UIButton *)sender{
    NSLog(@"%ld",sender.tag);
    
    //有人點就暫時停止發牌
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(doDeal) object:nil];
    
    
    //看是誰點進來
    if(sender.tag==1){
        isPlayer1Click = YES;
    }
    if(sender.tag==2){
        isPlayer2Click = YES;
    }
    if(sender.tag==3){
        isPlayer3Click = YES;
    }
    if(sender.tag==4){
        isPlayer4Click = YES;
    }
    
    
    if(isCardCorrect){
        
        if(isPlayer1Click && isPlayer2Click && isPlayer3Click){
            //player4 lose
            
            PLayer4+=CardCount;
            [btnPlayer4 setTitle:[NSString stringWithFormat:@"%d",PLayer4] forState:UIControlStateNormal];
            
            if(PLayer1<=0 || PLayer2<=0 ||PLayer3<=0 ||PLayer4<=0){
                
                [self checkWinAndRestart];
                
            }else{
                
                [self continuePlayNextRound];
                
            }
            
            
        }else if(isPlayer4Click && isPlayer2Click && isPlayer3Click){
            //player1 lose
            PLayer1+=CardCount;
            [btnPlayer1 setTitle:[NSString stringWithFormat:@"%d",PLayer1] forState:UIControlStateNormal];
            
            if(PLayer1<=0 || PLayer2<=0 ||PLayer3<=0 ||PLayer4<=0){
                
                [self checkWinAndRestart];
                
            }else{
               [self continuePlayNextRound];
            }
            
            
            
        }else if(isPlayer1Click && isPlayer4Click && isPlayer3Click){
            //player2 lose
            
            PLayer2+=CardCount;
            [btnPlayer2 setTitle:[NSString stringWithFormat:@"%d",PLayer2] forState:UIControlStateNormal];
            
            
            if(PLayer1<=0 || PLayer2<=0 ||PLayer3<=0 ||PLayer4<=0){
                
                [self checkWinAndRestart];
                
                
            }else{
                [self continuePlayNextRound];
            }
            
        }else if(isPlayer1Click && isPlayer2Click && isPlayer4Click){
            //player3 lose
            
            PLayer3+=CardCount;
            [btnPlayer3 setTitle:[NSString stringWithFormat:@"%d",PLayer3] forState:UIControlStateNormal];
            
            
            if(PLayer1<=0 || PLayer2<=0 ||PLayer3<=0 ||PLayer4<=0){
                
                [self checkWinAndRestart];
                
                
            }else{
                [self continuePlayNextRound];
            }
            
            
            
        }
        
    }else{
        
        if(sender.tag==1){
            //player1 lose
            
            PLayer1+=CardCount;
            [btnPlayer1 setTitle:[NSString stringWithFormat:@"%d",PLayer1] forState:UIControlStateNormal];
            
            
            
            if(PLayer1<=0 || PLayer2<=0 ||PLayer3<=0 ||PLayer4<=0){
                
                [self checkWinAndRestart];
                
                
            }else{
                [self continuePlayNextRound];
            }
            
            
        }else if(sender.tag==2){
            //player2 lose
            PLayer2+=CardCount;
            [btnPlayer2 setTitle:[NSString stringWithFormat:@"%d",PLayer2] forState:UIControlStateNormal];
            if(PLayer1<=0 || PLayer2<=0 ||PLayer3<=0 ||PLayer4<=0){
                
                [self checkWinAndRestart];
                
                
            }else{
                
               [self continuePlayNextRound];
            }
            
        }else if(sender.tag==3){
            //player3 lose
            PLayer3+=CardCount;
            [btnPlayer3 setTitle:[NSString stringWithFormat:@"%d",PLayer3] forState:UIControlStateNormal];
            
            
            
            if(PLayer1<=0 || PLayer2<=0 ||PLayer3<=0 ||PLayer4<=0){
                
                [self checkWinAndRestart];
                
                
            }else{
                
                [self continuePlayNextRound];
            }
            
        }else if(sender.tag==4){
            //player4 lose
            
            PLayer4+=CardCount;
            [btnPlayer4 setTitle:[NSString stringWithFormat:@"%d",PLayer4] forState:UIControlStateNormal];
            
            
            if(PLayer1<=0 || PLayer2<=0 ||PLayer3<=0 ||PLayer4<=0){
                
                [self checkWinAndRestart];
                
                
            }else{
                
                [self continuePlayNextRound];
            }
        }
    }
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //四副牌
    mArray = [[NSMutableArray alloc] initWithObjects:@"A1.png",@"B1.png",@"C1.png",@"D1.png",@"A13.png",@"B13.png",@"C13.png",@"D13.png",@"A12.png",@"B12.png",@"C12.png",@"D12.png",@"A11.png",@"B11.png",@"C11.png",@"D11.png",@"A10.png",@"B10.png",@"C10.png",@"D10.png",@"A9.png",@"B9.png",@"C9.png",@"D9.png",@"A8.png",@"B8.png",@"C8.png",@"D8.png",@"A7.png",@"B7.png",@"C7.png",@"D7.png",@"A6.png",@"B6.png",@"C6.png",@"D6.png",@"A5.png",@"B5.png",@"C5.png",@"D5.png",@"A4.png",@"B4.png",@"C4.png",@"D4.png",@"A3.png",@"B3.png",@"C3.png",@"D3.png",@"A2.png",@"B2.png",@"C2.png",@"D2.png",@"A1.png",@"B1.png",@"C1.png",@"D1.png",@"A13.png",@"B13.png",@"C13.png",@"D13.png",@"A12.png",@"B12.png",@"C12.png",@"D12.png",@"A11.png",@"B11.png",@"C11.png",@"D11.png",@"A10.png",@"B10.png",@"C10.png",@"D10.png",@"A9.png",@"B9.png",@"C9.png",@"D9.png",@"A8.png",@"B8.png",@"C8.png",@"D8.png",@"A7.png",@"B7.png",@"C7.png",@"D7.png",@"A6.png",@"B6.png",@"C6.png",@"D6.png",@"A5.png",@"B5.png",@"C5.png",@"D5.png",@"A4.png",@"B4.png",@"C4.png",@"D4.png",@"A3.png",@"B3.png",@"C3.png",@"D3.png",@"A2.png",@"B2.png",@"C2.png",@"D2.png",@"A1.png",@"B1.png",@"C1.png",@"D1.png",@"A13.png",@"B13.png",@"C13.png",@"D13.png",@"A12.png",@"B12.png",@"C12.png",@"D12.png",@"A11.png",@"B11.png",@"C11.png",@"D11.png",@"A10.png",@"B10.png",@"C10.png",@"D10.png",@"A9.png",@"B9.png",@"C9.png",@"D9.png",@"A8.png",@"B8.png",@"C8.png",@"D8.png",@"A7.png",@"B7.png",@"C7.png",@"D7.png",@"A6.png",@"B6.png",@"C6.png",@"D6.png",@"A5.png",@"B5.png",@"C5.png",@"D5.png",@"A4.png",@"B4.png",@"C4.png",@"D4.png",@"A3.png",@"B3.png",@"C3.png",@"D3.png",@"A2.png",@"B2.png",@"C2.png",@"D2.png",@"A1.png",@"B1.png",@"C1.png",@"D1.png",@"A13.png",@"B13.png",@"C13.png",@"D13.png",@"A12.png",@"B12.png",@"C12.png",@"D12.png",@"A11.png",@"B11.png",@"C11.png",@"D11.png",@"A10.png",@"B10.png",@"C10.png",@"D10.png",@"A9.png",@"B9.png",@"C9.png",@"D9.png",@"A8.png",@"B8.png",@"C8.png",@"D8.png",@"A7.png",@"B7.png",@"C7.png",@"D7.png",@"A6.png",@"B6.png",@"C6.png",@"D6.png",@"A5.png",@"B5.png",@"C5.png",@"D5.png",@"A4.png",@"B4.png",@"C4.png",@"D4.png",@"A3.png",@"B3.png",@"C3.png",@"D3.png",@"A2.png",@"B2.png",@"C2.png",@"D2.png", nil];
    
    
    [btnGameStart setHidden:NO];
}


-(IBAction)btnStart:(id)sender{
    
    [btnGameStart setHidden:YES];
    [imgCard setHidden:NO];
    WhoIdx = 0;
    AnswerInt = 0;
    CardCount = 0;
    [mArray shuffle];
    PLayer1 =  (int) mArray.count /4 ;
    PLayer2 =  (int) mArray.count /4 ;
    PLayer3 =  (int) mArray.count /4 ;
    PLayer4 =  (int)mArray.count - PLayer1 - PLayer2 - PLayer3;
    
    
    [btnPlayer1 setTitle:[NSString stringWithFormat:@"%d",PLayer1] forState:UIControlStateNormal];
    [btnPlayer2 setTitle:[NSString stringWithFormat:@"%d",PLayer2] forState:UIControlStateNormal];
    [btnPlayer3 setTitle:[NSString stringWithFormat:@"%d",PLayer3] forState:UIControlStateNormal];
    [btnPlayer4 setTitle:[NSString stringWithFormat:@"%d",PLayer4] forState:UIControlStateNormal];
    
    [self performSelector:@selector(doDeal) withObject:nil afterDelay:1.0f];
    
}

-(void)doDeal{
    
    isPlayer1Click = NO;
    isPlayer2Click = NO;
    isPlayer3Click = NO;
    isPlayer4Click = NO;
    
    
    //showCard
    
    [imgCard setImage:[UIImage imageNamed:[mArray objectAtIndex:CardCount]]];
    
    //is Answer Correct
    if(AnswerInt+1 == [[[[mArray objectAtIndex:CardCount] substringFromIndex:1] stringByReplacingOccurrencesOfString:@".png" withString:@""]intValue]){
        
        //status Correct
        
        NSLog(@"%d",AnswerInt);
        
        isCardCorrect = YES;
        
        
        //此時不發牌  等待所有人搶前三  最後一個人判定為輸
        
    }else{
        
        //status InCorrect
        isCardCorrect = NO;
        
        [self performSelector:@selector(doDeal) withObject:nil afterDelay:3.0f];
        //此時等三秒發牌  第一個人搶按則判定為輸
        
    }
    
    CardCount+=1;
    AnswerInt +=1;
    WhoIdx+=1;
    
    
    
    lblAnwser1.text = [NSString stringWithFormat:@"%d",AnswerInt];
    lblCardCount.text = [NSString stringWithFormat:@"累積幾張牌：%d",CardCount];
    
    [self updatePlayerCards];
    
    
    if(AnswerInt>=13){
        AnswerInt=0;
    }
    
    if(WhoIdx==4){
        WhoIdx =0;
    }
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updatePlayerCards{
    if(WhoIdx==1){
        
        if(PLayer1>0){
            PLayer1 -=1;
            [btnPlayer1 setTitle:[NSString stringWithFormat:@"%d",PLayer1] forState:UIControlStateNormal];
        }else{
            WhoIdx = 2;
            [self updatePlayerCards];
        }
        
    }else if(WhoIdx==2){
        if(PLayer2>0){
            PLayer2 -=1;
            [btnPlayer2 setTitle:[NSString stringWithFormat:@"%d",PLayer2] forState:UIControlStateNormal];
            
        }else{
            WhoIdx = 3;
            [self updatePlayerCards];
        }
        
    }else if(WhoIdx==3){
        if(PLayer3>0){
            
            PLayer3 -=1;
            [btnPlayer3 setTitle:[NSString stringWithFormat:@"%d",PLayer3] forState:UIControlStateNormal];
        }else{
            WhoIdx = 4;
            [self updatePlayerCards];
        }
    }else{
        if(PLayer4>0){
            PLayer4 -=1;
            [btnPlayer4 setTitle:[NSString stringWithFormat:@"%d",PLayer4] forState:UIControlStateNormal];
        }else{
            WhoIdx = 1;
            [self updatePlayerCards];
        }
        
        
    }
}

-(void)checkWinAndRestart{
    if(PLayer1==0){
        [[[UIAlertView alloc] initWithTitle:@"遊戲結束" message:@"恭嘉 1號玩家 獲勝" delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil]show];
        
    }else if(PLayer2==0){
        
        [[[UIAlertView alloc] initWithTitle:@"遊戲結束" message:@"恭嘉 2號玩家 獲勝" delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil]show];
    }else if(PLayer3==0){
        
        [[[UIAlertView alloc] initWithTitle:@"遊戲結束" message:@"恭嘉 3號玩家 獲勝" delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil]show];
    }else{
        
        [[[UIAlertView alloc] initWithTitle:@"遊戲結束" message:@"恭嘉 4號玩家 獲勝" delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil]show];
    }
    
    lblCardCount.text = @"";
    lblAnwser1.text = @"";
    [imgCard setHidden:YES];
    [btnGameStart setHidden:NO];
    
}

-(void)continuePlayNextRound{
 
    AnswerInt = 0;
    CardCount = 0;
    lblAnwser1.text = @"";
    lblCardCount.text= @"";
    [imgCard setImage:nil];
    [mArray shuffle];
    [self performSelector:@selector(doDeal) withObject:nil afterDelay:3.0f];
    
}


@end
