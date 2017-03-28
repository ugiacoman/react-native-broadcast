/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Button,
  Text,
  View,
  NativeModules
} from 'react-native';
const Permissions = require('react-native-permissions');
const BroadcastView = require('./BroadcastView');


export default class RNBroadcast extends Component {

  constructor(props) {
    super(props);
    this.state = {live: false, rtmpURL: ''};
  }

  _requestCamera() {
    Permissions.requestPermission('camera')
      .then(response => {
        //returns once the user has chosen to 'allow' or to 'not allow' access
        //response is one of: 'authorized', 'denied', 'restricted', or 'undetermined'
        console.log("camera response after req", response)
      });
  }
  _requestMicrophone() {
    Permissions.requestPermission('microphone')
      .then(response => {
        //returns once the user has chosen to 'allow' or to 'not allow' access
        //response is one of: 'authorized', 'denied', 'restricted', or 'undetermined'
        console.log("microphone response after req", response)
      });
  }

  componentDidMount() {
    Permissions.getPermissionStatus('camera')
      .then(response => {
        //response is one of: 'authorized', 'denied', 'restricted', or 'undetermined'
        console.log('permissions response', response)
        if (response === 'authorized' ){
          console.log("camera authorized")
        } else {
          this._requestCamera()
        }
      });
    Permissions.getPermissionStatus('microphone')
      .then(response => {
        //response is one of: 'authorized', 'denied', 'restricted', or 'undetermined'
        console.log('micro response', response)
        if (response === 'authorized' ){
          console.log("yay")
        } else {
          this._requestMicrophone()
        }
      });
      console.log("trying to start")

  }
  _toggleLive = () => {
    this.setState({ live: !this.state.live, rtmpURL: 'rtmp://a.rtmp.youtube.com/live2/hsa4-3pyd-7s00-2qmz' });
  }

  render() {
    return (
      <View>
        <BroadcastView live={this.state.live} rtmpURL={this.state.rtmpURL} />
        <Button
          title='Toggle'
          onPress={this._toggleLive}
          style={styles.toggleButton}
        />
      </View>
    )
  }
}

const styles = StyleSheet.create({
});

AppRegistry.registerComponent('RNBroadcast', () => RNBroadcast);
