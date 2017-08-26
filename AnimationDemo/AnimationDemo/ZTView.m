#import "ZTView.h"

@implementation ZTView

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    CGPoint current = [touch locationInView:self];
    CGPoint previous = [touch previousLocationInView:self];
    CGFloat offsetX = current.x - previous.x;
    CGFloat offsetY = current.y - previous.y;
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

@end
