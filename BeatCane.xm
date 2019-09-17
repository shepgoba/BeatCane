#import "BeatCane.h"

%hook MediaControlsTimeControl

    //Add the percent label property to the MediaControlsTimeControl class
    %property (nonatomic, retain) UILabel *pctLabel;

    //Initialize the label once instead of every update call
    - (id) initWithFrame:(CGRect)frame
    {
        self = %orig;
        if (self)
        {
            self.pctLabel = [[UILabel alloc] init];
            self.pctLabel.textColor = [UIColor whiteColor];
            [self.pctLabel setTextAlignment:NSTextAlignmentCenter];
            self.pctLabel.font = [UIFont systemFontOfSize:11];
            [self addSubview: self.pctLabel];
        }
        return self;
    }

    - (void) layoutSubviews
    {
        %orig;

	    static int labelFrameSize = 30;

        // Set the frame equal to the bottom middle. (the +1.5 X and -3 Y are for small offsets)
        self.pctLabel.frame = CGRectMake(self.frame.size.width * 0.5 - (labelFrameSize / 2) + 1.5, self.frame.size.height - (labelFrameSize - 3), labelFrameSize, labelFrameSize);
        NSString *percentText = @"0%";

        // Make sure the slider exists and isn't hidden. If it does, we calculate the percent. Otherwise (which shouldn't happen) set it to 0%
        if (self.elapsedTrack && !self.elapsedTrack.hidden)
        {
            percentText = [NSString stringWithFormat:@"%i%%", (int) roundf(clamp(self.sliderValue, 0, 1)*100)];
        }

        // Set the label's text equal to the percent text we just calculated
        self.pctLabel.text = percentText;
        
    }
%end
