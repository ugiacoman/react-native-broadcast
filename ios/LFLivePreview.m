//
//  LFLivePreview.m
//  LFLiveKit
//
//  Created by 倾慕 on 16/5/2.
//  Copyright © 2016年 live Interactive. All rights reserved.
//

#import "LFLivePreview.h"
#import "UIControl+YYAdd.h"
#import "UIView+YYAdd.h"
#import "LFLiveKit.h"

@interface LFLivePreview ()<LFLiveSessionDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) LFLiveDebug *debugInfo;
@property (nonatomic, strong) LFLiveSession *session;
@property (nonatomic, strong) NSString *rtmpURL;
@property (nonatomic, strong) NSString *cameraPosition;
@property (nonatomic, assign) NSInteger *deviceOrientation;
@end

@implementation LFLivePreview {
    BOOL started;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.containerView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
        [self addSubview:self.containerView];
        [self.session setRunning:YES];
    }
    return self;
}

#pragma mark -- Getter Setter
- (LFLiveSession*)session {
    if (!_session) {
        LFLiveVideoConfiguration *videoConfiguration = [LFLiveVideoConfiguration new];
        videoConfiguration.videoSize = CGSizeMake(640, 360);
        videoConfiguration.videoBitRate = 800*1024;
        videoConfiguration.videoMaxBitRate = 1000*1024;
        videoConfiguration.videoMinBitRate = 500*1024;
        videoConfiguration.videoFrameRate = 24;
        videoConfiguration.videoMaxKeyframeInterval = 48;
        videoConfiguration.outputImageOrientation = UIInterfaceOrientationLandscapeLeft;
        videoConfiguration.autorotate = YES;
        videoConfiguration.sessionPreset = LFCaptureSessionPreset720x1280;

        _session = [[LFLiveSession alloc] initWithAudioConfiguration:[LFLiveAudioConfiguration defaultConfiguration] videoConfiguration:videoConfiguration];

        _session.preView = self.containerView;
        _session.delegate = self;
    }
    return _session;
}

- (void)setStarted:(BOOL) started {
    if(started){
        printf("starting");
        LFLiveStreamInfo *stream = [LFLiveStreamInfo new];
        stream.url = _rtmpURL;
        [self.session startLive:stream];
    } else {
        printf("stopping");
        [self.session stopLive];
    }
}

- (void) setRtmpURL:(NSString *)rtmpURL
{
    _rtmpURL=rtmpURL;
}

- (void) setCameraPosition:(NSString *)cameraPosition
{
    if ([cameraPosition isEqualToString:@"front"]) {
        self.session.captureDevicePosition = AVCaptureDevicePositionFront;
    } else if ([cameraPosition isEqualToString:@"back"]) {
        self.session.captureDevicePosition = AVCaptureDevicePositionBack;
    }
}

- (void) setDeviceOrientation:(NSInteger *)deviceOrientation
{
    printf("device orientation %ld", (long)deviceOrientation);
    if ((long)deviceOrientation == 1) {
        _deviceOrientation = UIInterfaceOrientationPortrait;
    } else if ((long)deviceOrientation == 2) {
        _deviceOrientation = UIInterfaceOrientationPortraitUpsideDown;
    } else if ((long)deviceOrientation == 3) {
        _deviceOrientation = UIInterfaceOrientationLandscapeRight;
    } else if ((long)deviceOrientation == 4) {
        _deviceOrientation = UIInterfaceOrientationLandscapeLeft;
    }
}

@end
