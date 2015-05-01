//
//  L3SDKTextField.m
//  QRPark
//
//  Created by Domenico Vacchiano on 30/04/15.
//  Copyright (c) 2015 LamCube. All rights reserved.
//

#import "L3SDKTextField.h"


@interface L3SDKTextField ()
@property(strong, nonatomic) id currentDelegate;
@end

@implementation L3SDKTextField
@synthesize maxLength;

- (void)setDelegate:(id)newDelegate {
    //wraps and set super.delegate
    [super setDelegate:nil];
    _currentDelegate = newDelegate;
    [super setDelegate:(id)self];
}
- (id)delegate {
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    if (self) {
        //wraps and init super delegate
        [super setDelegate:(id)self];
    }
    return self;
}



- (id)forwardingTargetForSelector:(SEL)aSelector {
    //returns proper delegate/selector
    if ([_currentDelegate respondsToSelector:aSelector]) { return _currentDelegate; }
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [super respondsToSelector:aSelector] || [_currentDelegate respondsToSelector:aSelector];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    //if maxLength==0 returns YES
    if (self.maxLength==0) {
        return YES;
    }
    
    //UNCOMMENT if you want to raise the same event on the super
    /*
    //raise shouldChangeCharactersInRange on super delegate
    if (_currentDelegate != NULL && [_currentDelegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        [_currentDelegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    */
    
    //returns YES/NO
    return (range.location + [string length]) <= self.maxLength;
}


@end
