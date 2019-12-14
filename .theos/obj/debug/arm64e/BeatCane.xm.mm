#line 1 "BeatCane.xm"
#import "BeatCane.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class MediaControlsTimeControl; 
static MediaControlsTimeControl* (*_logos_orig$_ungrouped$MediaControlsTimeControl$initWithFrame$)(_LOGOS_SELF_TYPE_INIT MediaControlsTimeControl*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static MediaControlsTimeControl* _logos_method$_ungrouped$MediaControlsTimeControl$initWithFrame$(_LOGOS_SELF_TYPE_INIT MediaControlsTimeControl*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$MediaControlsTimeControl$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL MediaControlsTimeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MediaControlsTimeControl$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL MediaControlsTimeControl* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MediaControlsTimeControl$updateSliderConstraint)(_LOGOS_SELF_TYPE_NORMAL MediaControlsTimeControl* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MediaControlsTimeControl$updateSliderConstraint(_LOGOS_SELF_TYPE_NORMAL MediaControlsTimeControl* _LOGOS_SELF_CONST, SEL); 

#line 3 "BeatCane.xm"


    
    __attribute__((used)) static UILabel * _logos_method$_ungrouped$MediaControlsTimeControl$pctLabel(MediaControlsTimeControl * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$MediaControlsTimeControl$pctLabel); }; __attribute__((used)) static void _logos_method$_ungrouped$MediaControlsTimeControl$setPctLabel(MediaControlsTimeControl * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$MediaControlsTimeControl$pctLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

    

static MediaControlsTimeControl* _logos_method$_ungrouped$MediaControlsTimeControl$initWithFrame$(_LOGOS_SELF_TYPE_INIT MediaControlsTimeControl* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {
    self = _logos_orig$_ungrouped$MediaControlsTimeControl$initWithFrame$(self, _cmd, frame);
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

static void _logos_method$_ungrouped$MediaControlsTimeControl$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL MediaControlsTimeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$MediaControlsTimeControl$didMoveToWindow(self, _cmd);
    self.pctLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self.pctLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;
    [self.pctLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-5].active = YES;
}

static void _logos_method$_ungrouped$MediaControlsTimeControl$updateSliderConstraint(_LOGOS_SELF_TYPE_NORMAL MediaControlsTimeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$MediaControlsTimeControl$updateSliderConstraint(self, _cmd);

	NSString *percentText = @"0%%";
    if (self.elapsedTrack && !self.elapsedTrack.hidden) {
        percentText = [NSString stringWithFormat:@"%i%%", (int) roundf(clamp(self.sliderValue, 0, 1)*100)];
    }

    self.pctLabel.text = percentText;
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$MediaControlsTimeControl = objc_getClass("MediaControlsTimeControl"); MSHookMessageEx(_logos_class$_ungrouped$MediaControlsTimeControl, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$MediaControlsTimeControl$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$MediaControlsTimeControl$initWithFrame$);MSHookMessageEx(_logos_class$_ungrouped$MediaControlsTimeControl, @selector(didMoveToWindow), (IMP)&_logos_method$_ungrouped$MediaControlsTimeControl$didMoveToWindow, (IMP*)&_logos_orig$_ungrouped$MediaControlsTimeControl$didMoveToWindow);MSHookMessageEx(_logos_class$_ungrouped$MediaControlsTimeControl, @selector(updateSliderConstraint), (IMP)&_logos_method$_ungrouped$MediaControlsTimeControl$updateSliderConstraint, (IMP*)&_logos_orig$_ungrouped$MediaControlsTimeControl$updateSliderConstraint);{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$MediaControlsTimeControl, @selector(pctLabel), (IMP)&_logos_method$_ungrouped$MediaControlsTimeControl$pctLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$MediaControlsTimeControl, @selector(setPctLabel:), (IMP)&_logos_method$_ungrouped$MediaControlsTimeControl$setPctLabel, _typeEncoding); } } }
#line 42 "BeatCane.xm"
