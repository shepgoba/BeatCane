@interface MediaControlsTimeControl : UIControl
{
    UIView* _elapsedTrack;
    UILabel* _elapsedTimeLabel;
    CGFloat _sliderValue;
}

@property (nonatomic, retain) UIView* elapsedTrack;
@property (nonatomic, retain) UILabel* pctLabel;
@property (nonatomic, retain) UILabel* elapsedTimeLabel;
@property (nonatomic, assign, readwrite) CGFloat sliderValue;
@end

@implementation MediaControlsTimeControl
@synthesize elapsedTrack = _elapsedTrack;
@synthesize elapsedTimeLabel = _elapsedTimeLabel;
@synthesize sliderValue=_sliderValue;
@end

CGFloat clamp(CGFloat val, CGFloat min, CGFloat max)
{
    if (val < min)
    {
        return min;
    } else if (val > max)
    {
        return max;
    }
    return val;
}
