@interface MediaControlsTimeControl : UIControl
{
    UIView* _elapsedTrack;
}

@property (nonatomic,retain) UIView* elapsedTrack;
@property (nonatomic,retain) UILabel* pctLabel;
@end

@implementation MediaControlsTimeControl
@synthesize elapsedTrack = _elapsedTrack;
@end
