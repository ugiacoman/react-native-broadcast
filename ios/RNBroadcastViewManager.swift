//
//  RNBroadcastViewManager.swift
//  RNBroadcast
//
//  Created by uli on 3/28/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

import Foundation

@objc(RNBroadcastViewManager)
class RNBroadcastViewManager : RCTViewManager {
  override func view() -> UIView! {
    return RNBroadcastView();
  }
}
