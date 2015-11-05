//
//  LightViewController.m
//  Lighting
//
//  Created by huazi on 15-5-12.
//  Copyright (c) 2015年 xiaoningLi. All rights reserved.
//

#import "LightViewController.h"
#import "CustomButton.h"

#define kSpacing 90

@interface LightViewController (){
    NSMutableArray *_btns;
    NSInteger       _num;
}
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITextField *numTextView;

@end

@implementation LightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _btns = [NSMutableArray array];
    _num = 0;
    self.numTextView.text = [NSString stringWithFormat:@"%ld",(long)_num];
     [self.numTextView addTarget:self action:@selector(changeLight:) forControlEvents:UIControlEventEditingChanged];
    [self creatLight:_num];
}

- (void)creatLight:(NSInteger)num{
    
    for (int i = 0; i < num; i ++) {
        CustomButton *btn = [[CustomButton alloc]initWithFrame:CGRectMake(i%3 * kSpacing ,i/3 * kSpacing, 50, 50)];
        [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        [btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(updateUI:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        [_btns addObject:btn];
    }
}

- (void)updateUI:(id)sender{
    if (_num < 9) {
        return;
    }
    NSLog(@"sender%@" ,[sender currentTitle]);
    for (int i = 0; i < [_btns count]; i++) {
        if (_btns[i] == sender) {
            int j = i % 3;
            [_btns[i] setSelected:!((CustomButton *)_btns[i]).selected];
            
            if (j == 0) {
                [_btns[i + 1] setSelected:!((CustomButton *)_btns[i + 1]).selected];
            }else if (j == (3 - 1)){
                [_btns[i - 1] setSelected:!((CustomButton *)_btns[i - 1]).selected];
            }else{
                [_btns[i + 1] setSelected:!((CustomButton *)_btns[i + 1]).selected];
                [_btns[i - 1] setSelected:!((CustomButton *)_btns[i - 1]).selected];
            }
            
            int k = i / 3;
            if (k == 0) {
                [_btns[i + 3] setSelected:!((CustomButton *)_btns[i + 3]).selected];
            }else if (k == (3 - 1)){
                [_btns[i - 3] setSelected:!((CustomButton *)_btns[i - 3]).selected];
            }else{
                [_btns[i - 3] setSelected:!((CustomButton *)_btns[i - 3]).selected];
                [_btns[i + 3] setSelected:!((CustomButton *)_btns[i + 3]).selected];
            }
        }
    }
}

- (void)changeLight:(UITextField *)textField{
    NSLog(@"%lu",(unsigned long)textField.text.length);
    for (UIButton *btn in _btns) {
        [btn removeFromSuperview];
    }
    [_btns removeAllObjects];
    if([textField.text integerValue] >= 0  && [textField.text integerValue] <= 9){
        [self creatLight:[textField.text integerValue]];
        _num = [textField.text integerValue];
    }
}

- (IBAction)subtractAction:(id)sender {
    
    if (_num <= 0) {
        return;
    }
    [[_btns lastObject]removeFromSuperview];
    [_btns removeLastObject];
    _num--;
    self.numTextView.text = [NSString stringWithFormat:@"%ld",(long)_num];
    NSLog(@"%ld-----%lu",(long)_num,(unsigned long)_btns.count);
}

- (IBAction)addAction:(id)sender {
    if (_num > 8) {
        return;
    }
    for (UIButton *btn in _btns) {
        [btn removeFromSuperview];
    }
    [_btns removeAllObjects];
    _num++;
    [self creatLight:_num];
    self.numTextView.text = [NSString stringWithFormat:@"%ld",(long)_num];
    NSLog(@"%ld-----%lu",(long)_num,(unsigned long)_btns.count);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
