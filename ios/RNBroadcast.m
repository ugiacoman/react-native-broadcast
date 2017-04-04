
#import "LFLivePreview.h"
#import <React/RCTViewManager.h>
#import <UIKit/UIKit.h>

@interface RNBroadcastViewManager : RCTViewManager
@end

@implementation RNBroadcastViewManager
RCT_EXPORT_MODULE()

- (UIView *)view
{
    CGRect screen = [[UIScreen mainScreen] bounds];
    return [[LFLivePreview alloc] initWithFrame:screen];
}
RCT_EXPORT_VIEW_PROPERTY(started, BOOL);
RCT_EXPORT_VIEW_PROPERTY(rtmpURL, NSString);
RCT_EXPORT_VIEW_PROPERTY(cameraPosition, NSString);

@end
