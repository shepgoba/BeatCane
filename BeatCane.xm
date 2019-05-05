#import "BeatCane.h"

%hook MediaControlsTimeControl
%property (nonatomic, retain) UILabel *pctLabel;
    - (id) initWithFrame:(CGRect)frame
    {
        MediaControlsTimeControl *orig = %orig;
        orig.pctLabel = [[UILabel alloc] init];
        orig.pctLabel.textColor = [UIColor whiteColor];
        orig.pctLabel.text = @"0%";
        [orig.pctLabel setTextAlignment:NSTextAlignmentCenter];
        orig.pctLabel.font = [self.pctLabel.font fontWithSize:10];
        return orig;
    }

    - (void) _updateTimeControl
    {
        %orig;

	static int labelFrameSize = 30;

        self.pctLabel.frame = CGRectMake(self.frame.size.width*0.5 - (labelFrameSize / 2),self.frame.size.height-(labelFrameSize-3),labelFrameSize,labelFrameSize);
        NSString *newLabelTxt;
        if (self.elapsedTrack)
        {
            newLabelTxt = [NSString stringWithFormat:@"%i%%",(int) roundf(100*(self.elapsedTrack.frame.size.width/self.frame.size.width))];
        } else {
            newLabelTxt = @"0%";
        }
        self.pctLabel.text = newLabelTxt;
        [self addSubview: self.pctLabel];
    }
%end
