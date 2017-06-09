//
//  LFLivePreview.m
//  RNBroadcast
//
//  Created by uli on 3/20/17.
//  Copyright © 2017 Ulises Giacoman. All rights reserved.
//

#import "LFLivePreview.h"
#import "UIControl+YYAdd.h"
#import "UIView+YYAdd.h"
#import "LFLiveKit.h"

@interface LFLivePreview ()<LFLiveSessionDelegate>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) LFLiveDebug *debugInfo;
@property (nonatomic, strong) LFLiveSession *session;
@property (nonatomic, strong) NSString *cameraPosition;
@property (nonatomic, strong) NSString *publish;
@end

@implementation LFLivePreview {
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGRect switchRect = CGRectMake([UIScreen mainScreen].applicationFrame.origin.x, [UIScreen mainScreen].applicationFrame.origin.y, [UIScreen mainScreen].applicationFrame.size.height, [UIScreen mainScreen].applicationFrame.size.width);
        self.containerView = [[UIView alloc]initWithFrame:switchRect];
        [self addSubview:self.containerView];
        [self.session setRunning:YES];
    }
    return self;
}

- (LFLiveSession*)session {
    if (!_session) {
        LFLiveVideoConfiguration *videoConfiguration = [LFLiveVideoConfiguration new];
        videoConfiguration.videoSize = CGSizeMake(1280, 720);
        videoConfiguration.videoBitRate = 800*1024;
        videoConfiguration.videoMaxBitRate = 1000*1024;
        videoConfiguration.videoMinBitRate = 500*1024;
        videoConfiguration.videoFrameRate = 24;
        videoConfiguration.videoMaxKeyframeInterval = 48;
        videoConfiguration.outputImageOrientation = UIInterfaceOrientationLandscapeRight;
        videoConfiguration.autorotate = YES;
        videoConfiguration.sessionPreset = LFCaptureSessionPreset720x1280;
        
        _session = [[LFLiveSession alloc] initWithAudioConfiguration:[LFLiveAudioConfiguration defaultConfiguration] videoConfiguration:videoConfiguration];
        
        _session.preView = self.containerView;
        _session.delegate = self;
    }
    return _session;
}

- (void)setPublish:(NSString *) publish {
    if (![publish isEqualToString:@""]) {
        LFLiveStreamInfo *stream = [LFLiveStreamInfo new];
        stream.url = publish;
        [self.session startLive:stream];
    } else {
        [self.session stopLive];
    }
}

- (void) setCameraPosition:(NSString *)cameraPosition
{
    if ([cameraPosition isEqualToString:@"front"]) {
        self.session.captureDevicePosition = AVCaptureDevicePositionFront;
    } else if ([cameraPosition isEqualToString:@"back"]) {
        self.session.captureDevicePosition = AVCaptureDevicePositionBack;
    }
}

@end
