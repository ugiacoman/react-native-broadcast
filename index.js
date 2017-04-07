import React, { PropTypes } from 'react'
import { View, requireNativeComponent } from 'react-native'

class BroadcastView extends React.Component {
  render () {
    return <RNBroadcastView {...this.props} />
  }
}

BroadcastView.propTypes = {
  /**
   * rtmpURL: RTMP server to stream to ex: rtmp://youtube.com/....
   * cameraPosition: 'front' or 'back'
   * deviceOrientation: Which orientation to stream
      - Portrait: 1
      - UpsideDown: 2
      - LandscapeRight: 3
      - LandscapeLeft: 4
   * started: whether to start or stop streaming
   */
  //  rtmpURL: React.PropTypes.string,
  //  cameraPosition: React.PropTypes.string,
  //  deviceOrientation: React.PropTypes.number,
  //  started: React.PropTypes.bool,
  ...View.propTypes,
  accessibilityLabel: PropTypes.string,
  src: PropTypes.string

}

var RNBroadcastView = requireNativeComponent('RNBroadcastView', BroadcastView)

module.exports = BroadcastView


// import { PropTypes } from 'react'
// import { requireNativeComponent, View } from 'react-native'
//
// var BroadcastView = {
//   name: 'BroadcastView',
//   propTypes: {
//      ...View.propTypes,
//      accessibilityLabel: PropTypes.string
//     src: PropTypes.string
//   }
// }
//
// module.exports = requireNativeComponent('RNBroadcastView', BroadcastView)
