
# react-native-broadcast

## Getting started

`$ npm install react-native-broadcast --save`

### Mostly automatic installation

`$ react-native link react-native-broadcast`

* iOS: Add `Privacy - Camera Usage Description` and `Privacy - Microphone Usage Description` to your project's Info.plist

* Android: Add the following permissions to your Android Manifest
    ```xml
    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    <uses-permission android:name="android.permission.RECORD_VIDEO"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    ```

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-broadcast` and add `RNBroadcast.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNBroadcast.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<
5. Need to add Link binary to `libz` & `libstdc++` into final project

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNBroadcastPackage;` to the imports at the top of the file
  - Add `new RNBroadcastPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-broadcast'
  	project(':react-native-broadcast').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-broadcast/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-broadcast')
    ```

## Usage

* Start publishing by providing an rtmpURL.
* Stop publishing by providing an empty string: ''
* Camera Position can be either 'front' or 'back'

```javascript
import BroadcastView from 'react-native-broadcast';

<BroadcastView
  publish='rtmp://a.rtmp.youtube.com/live2/...'
  cameraPosition='front'
/>
```
