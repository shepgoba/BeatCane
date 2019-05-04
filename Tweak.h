@interface MediaControlsTimeControl : UIControl
{
    UILabel* _elapsedTimeLabel;
    UILabel* _remainingTimeLabel;
    UIView* _elapsedTrack;
}
@property (nonatomic,retain) UILabel * elapsedTimeLabel;
@property (nonatomic,retain) UILabel * remainingTimeLabel;
@property (nonatomic,retain) UIView* elapsedTrack;
@property (nonatomic,retain) UILabel * pctLabel;
@end

@implementation MediaControlsTimeControl
@synthesize elapsedTimeLabel = _elapsedTimeLabel;
@synthesize remainingTimeLabel = _remainingTimeLabel;
@synthesize elapsedTrack = _elapsedTrack;
@end
