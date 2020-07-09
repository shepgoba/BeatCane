#import "BeatCane.h"

%hook MediaControlsTimeControl

%property (nonatomic, retain) UILabel *pctLabel;

-(id)initWithFrame:(CGRect)frame
{
    self = %orig;
    if (self) {
        self.pctLabel = [[UILabel alloc] init];
        self.pctLabel.textColor = [UIColor whiteColor];
        self.pctLabel.textAlignment = NSTextAlignmentCenter;
        self.pctLabel.font = [UIFont systemFontOfSize:11];
        [self.pctLabel sizeToFit];
        
        [self addSubview: self.pctLabel];
    }
    return self;
}

-(void)didMoveToWindow {
    %orig;
    self.pctLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.pctLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [self.pctLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-5].active = YES;
}

-(void)updateSliderConstraint {
    %orig;

    NSString *percentText = @"0%";
    if (self.elapsedTrack && !self.elapsedTrack.hidden) {
        percentText = [NSString stringWithFormat:@"%i%%", (int) roundf(clamp(self.sliderValue, 0, 1)*100)];
    }

    self.pctLabel.text = percentText;
}
%end
