import React from 'react';
import { requireNativeComponent } from 'react-native';

class BroadcastView extends React.Component {
  render() {
    return  <RNBroadcastView {...this.props} />
  }
}

BroadcastView.propTypes = {
  live: React.PropTypes.bool,
  rtmpURL: React.PropTypes.string,
  cameraPosition: React.PropTypes.string,
}

var RNBroadcastView = requireNativeComponent('RNBroadcastView', BroadcastView);

module.exports = BroadcastView;
