//
//  RNBroadcastView.swift
//  RNBroadcast
//
//  Created by uli on 3/28/17.
//  Copyright © 2017 Facebook. All rights reserved.
//
import LFLiveKit
@objc(RNBroadcastView)
class RNBroadcastView: UIView, LFLiveSessionDelegate {
  
  var rtmpURL = ""
  
  
  var session: LFLiveSession = {
    let audioConfiguration = LFLiveAudioConfiguration.defaultConfiguration(for: LFLiveAudioQuality.high)
    let videoConfiguration = LFLiveVideoConfiguration.defaultConfiguration(for: LFLiveVideoQuality.high2, outputImageOrientation: .landscapeRight)
    videoConfiguration?.autorotate = true
    
    let session = LFLiveSession(audioConfiguration: audioConfiguration, videoConfiguration: videoConfiguration)
    return session!
  }()
  
  var live = false {
    willSet {
      print("will settings")
      if (live == false && (rtmpURL != "")) {
        let stream = LFLiveStreamInfo()
        stream.url = rtmpURL
        print("starting")
        session.startLive(stream)
      } else {
        print("stopping")
        session.stopLive()
      }
    }
  }
  
  var cameraPosition: String = "front" {
    willSet {
      if cameraPosition == "front" {
        session.captureDevicePosition = AVCaptureDevicePosition.front
      } else if cameraPosition == "back" {
        session.captureDevicePosition = AVCaptureDevicePosition.back
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    session.delegate = self
    let bounds = UIScreen.main.bounds
    print("bounds", bounds)
    let camera = UIView(frame: CGRect(x: 0, y: 0, width: bounds.size.width, height: bounds.size.height))
    session.preView = camera
    self.addSubview(camera)
    session.running = true
  }

  
  // liveSession
  func liveSession(_ session: LFLiveSession?, debugInfo: LFLiveDebug?) {
    print("debugInfo: \(debugInfo?.currentBandwidth)")
  }
  
  func liveSession(_ session: LFLiveSession?, errorCode: LFLiveSocketErrorCode) {
    print("errorCode: \(errorCode.rawValue)")
  }
  
  func liveSession(_ session: LFLiveSession?, liveStateDidChange state: LFLiveState) {
//    switch state {
//    case LFLiveState.ready:
////      stateLabel.text = "ready"
//      break;
//    case LFLiveState.pending:
////      stateLabel.text = "pending"
//      break;
//    case LFLiveState.start:
////      stateLabel.text = "start"
//      break;
//    case LFLiveState.error:
////      stateLabel.text = "error"
//      break;
//    case LFLiveState.stop:
////      stateLabel.text = "stop"
//      break;
//    default:
//      break;
//    }
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
