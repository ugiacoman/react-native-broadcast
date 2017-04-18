
package com.reactlibrary;

import java.io.IOException;
import java.net.SocketException;
import java.util.List;
import java.util.Arrays;

import android.app.Activity;
import android.graphics.Color;
import android.hardware.Camera;
import android.support.annotation.Nullable;
import android.util.Log;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.facebook.react.ReactRootView;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewProps;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.views.image.ImageResizeMode;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.github.faucamp.simplertmp.RtmpHandler;

import net.ossrs.yasea.SrsCameraView;
import net.ossrs.yasea.SrsEncodeHandler;
import net.ossrs.yasea.SrsPublisher;
import net.ossrs.yasea.SrsRecordHandler;

import static com.facebook.react.common.ReactConstants.TAG;


public class RNBroadcastViewManager extends SimpleViewManager<SrsCameraView> implements RtmpHandler.RtmpListener,
        SrsRecordHandler.SrsRecordListener, SrsEncodeHandler.SrsEncodeListener {

    public static final String REACT_CLASS = "RNBroadcastView";
    private SrsPublisher mPublisher;
    private ThemedReactContext mContext = null;
    private Boolean isLive = false;


    @Override
    public String getName() {
    return REACT_CLASS;
  }

    @Override
    public SrsCameraView createViewInstance(ThemedReactContext context) {
      this.mContext = context;

      SrsCameraView view = new SrsCameraView(context);
      this.mPublisher = new SrsPublisher(view);
      this.mPublisher.setEncodeHandler(new SrsEncodeHandler(this));
      this.mPublisher.setRtmpHandler(new RtmpHandler(this));
      this.mPublisher.setRecordHandler(new SrsRecordHandler(this));
      this.mPublisher.setPreviewResolution(1280, 720);
      this.mPublisher.setOutputResolution(1280, 720);
      this.mPublisher.setScreenOrientation(2);
      this.mPublisher.switchToSoftEncoder();
      this.mPublisher.setVideoHDMode();
      this.mPublisher.startCamera();
      return view;
    }

  @ReactProp(name = "cameraPosition")
  public void setCameraPosition(SrsCameraView view, @Nullable String cameraPosition) {
    mPublisher.switchCameraFace((mPublisher.getCamraId() + 1) % Camera.getNumberOfCameras());
  }

  private void handleException(Exception e) {
    try {
      this.mPublisher.stopPublish();
      this.mPublisher.stopRecord();
    } catch (Exception e1) {
      //
    }
  }

  @ReactProp(name = "publish")
  public void started(SrsCameraView view, @Nullable String publish) {
    System.out.println("Starting: " + publish + "live: " + this.isLive);
    if (!publish.isEmpty()) {
      this.mPublisher.startPublish(publish);
    }
    else if (publish.isEmpty() && this.isLive){
      this.mPublisher.stopPublish();
    }
  }

  // Implementation of SrsRtmpListener.

  @Override
  public void onRtmpConnecting(String msg) {
//    Toast.makeText(getApplicationContext(), msg, Toast.LENGTH_SHORT).show();
  }

  @Override
  public void onRtmpConnected(String msg) {
//    Toast.makeText(getApplicationContext(), msg, Toast.LENGTH_SHORT).show();
  }

  @Override
  public void onRtmpVideoStreaming() {
      this.isLive = true;
  }

  @Override
  public void onRtmpAudioStreaming() {
    this.isLive = true;
  }

  @Override
  public void onRtmpStopped() {
      this.isLive = false;
  }

  @Override
  public void onRtmpDisconnected() {
//    Toast.makeText(getApplicationContext(), "Disconnected", Toast.LENGTH_SHORT).show();
  }

  @Override
  public void onRtmpVideoFpsChanged(double fps) {
    Log.i(TAG, String.format("Output Fps: %f", fps));
  }

  @Override
  public void onRtmpVideoBitrateChanged(double bitrate) {
    int rate = (int) bitrate;
    if (rate / 1000 > 0) {
      Log.i(TAG, String.format("Video bitrate: %f kbps", bitrate / 1000));
    } else {
      Log.i(TAG, String.format("Video bitrate: %d bps", rate));
    }
  }

  @Override
  public void onRtmpAudioBitrateChanged(double bitrate) {
    int rate = (int) bitrate;
    if (rate / 1000 > 0) {
      Log.i(TAG, String.format("Audio bitrate: %f kbps", bitrate / 1000));
    } else {
      Log.i(TAG, String.format("Audio bitrate: %d bps", rate));
    }
  }

  @Override
  public void onRtmpSocketException(SocketException e) {

    handleException(e);
  }

  @Override
  public void onRtmpIOException(IOException e) {

    handleException(e);
  }

  @Override
  public void onRtmpIllegalArgumentException(IllegalArgumentException e) {

    handleException(e);
  }

  @Override
  public void onRtmpIllegalStateException(IllegalStateException e) {

    handleException(e);
  }

  // Implementation of SrsRecordHandler.

  @Override
  public void onRecordPause() {
//    Toast.makeText(getApplicationContext(), "Record paused", Toast.LENGTH_SHORT).show();
  }

  @Override
  public void onRecordResume() {
//    Toast.makeText(getApplicationContext(), "Record resumed", Toast.LENGTH_SHORT).show();
  }

  @Override
  public void onRecordStarted(String msg) {
//    Toast.makeText(getApplicationContext(), "Recording file: " + msg, Toast.LENGTH_SHORT).show();
  }

  @Override
  public void onRecordFinished(String msg) {
//    Toast.makeText(getApplicationContext(), "MP4 file saved: " + msg, Toast.LENGTH_SHORT).show();
  }

  @Override
  public void onRecordIOException(IOException e) {


  }

  @Override
  public void onRecordIllegalArgumentException(IllegalArgumentException e) {


  }

  // Implementation of SrsEncodeHandler.

  @Override
  public void onNetworkWeak() {
  }

  @Override
  public void onNetworkResume() {
  }

  @Override
  public void onEncodeIllegalArgumentException(IllegalArgumentException e) {
    handleException(e);
  }

}
