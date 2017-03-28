/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  NativeModules
} from 'react-native';
const Permissions = require('react-native-permissions');


export default class RNBroadcast extends Component {
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
    var Broadcast = NativeModules.Broadcast
    Broadcast.addEvent("boby", "sanders")
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>
          Welcome to React Native!
        </Text>
        <Text style={styles.instructions}>
          To get started, edit index.ios.js
        </Text>
        <Text style={styles.instructions}>
          Press Cmd+R to reload,{'\n'}
          Cmd+D or shake for dev menu
        </Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('RNBroadcast', () => RNBroadcast);
