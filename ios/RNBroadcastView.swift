//
//  RNBroadcastView.swift
//  RNBroadcast
//
//  Created by uli on 3/28/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

class RNBroadcastView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100,
                                      height: 50))
    label.text = "This is Swift"
    self.addSubview(label)
  }
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
