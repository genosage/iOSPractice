#import "ZTView.h"

@implementation ZTView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    NSTimeInterval dur = 0.2;
    UIViewAnimationOptions options = UIViewAnimationOptionCurveEaseIn;
    
    [UIView animateWithDuration:dur delay:0 options:options animations:^
     {
         self.transform = CGAffineTransformMakeScale(1.3f, 1.3f);
     } completion:^(BOOL finished)
     {
         [UIView animateWithDuration:dur delay:0 options:options animations:^
          {
              self.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
          } completion:nil];
     }];
}


- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    UITouch *touch = [touches anyObject];
    
    CGPoint current = [touch locationInView:self];
    CGPoint previous = [touch previousLocationInView:self];
    CGFloat offsetX = current.x - previous.x;
    CGFloat offsetY = current.y - previous.y;
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

@end
