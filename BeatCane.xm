#import "BeatCane.h"

%hook MediaControlsTimeControl

    //Add the percent label property to the MediaControlsTimeControl class
    %property (nonatomic, retain) UILabel *pctLabel;

    //Initialize the label once instead of every update call
    - (id) initWithFrame:(CGRect)frame
    {
        MediaControlsTimeControl *orig = %orig;
        orig.pctLabel = [[UILabel alloc] init];
        orig.pctLabel.textColor = [UIColor whiteColor];
        orig.pctLabel.text = @"0%";
        [orig.pctLabel setTextAlignment:NSTextAlignmentCenter];
        orig.pctLabel.font = [self.pctLabel.font fontWithSize:11];
        return orig;
    }

    - (void) layoutSubviews
    {
        %orig;

	    static int labelFrameSize = 30;

        // Set the frame equal to the bottom middle. (the +1.5 X and -3 Y are for small offsets)
        self.pctLabel.frame = CGRectMake(self.frame.size.width * 0.5 - (labelFrameSize / 2) + 1.5, self.frame.size.height - (labelFrameSize-3),labelFrameSize,labelFrameSize);
        NSString *percentText;

        // Make sure the slider exists. If it does, we calculate the percent. Otherwise (which shouldn't happen) set it to 0%
        if (self.elapsedTrack)
        {
            percentText = [NSString stringWithFormat:@"%i%%",(int) roundf(100*(self.elapsedTrack.frame.size.width/self.frame.size.width))];
        } else {
            percentText = @"0%";
        }

        // Set the label's text equal to the percent text we just calculated, and add the label to the view
        self.pctLabel.text = percentText;
        [self addSubview: self.pctLabel];
    }
%end
