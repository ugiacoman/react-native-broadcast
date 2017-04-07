
package com.reactlibrary;

import java.util.List;
import java.util.Arrays;

import android.app.Activity;
import android.graphics.Color;
import android.hardware.Camera;
import android.support.annotation.Nullable;
import android.util.Log;
import android.widget.LinearLayout;

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


public class RNBroadcastViewManager extends SimpleViewManager<SrsCameraView> {

  public static final String REACT_CLASS = "RNBroadcastView";
  private SrsPublisher mPublisher;
  private ThemedReactContext mContext = null;
  private Activity mActivity = null;

  public RNBroadcastViewManager(Activity activity) {
    mActivity = activity;
  }
  @Override
  public String getName() {
    return REACT_CLASS;
  }

  @Override
  public SrsCameraView createViewInstance(ThemedReactContext context) {
    return new SrsCameraView(context);
  }

  @ReactProp(name = "rtmpURL")
  public void setRtmpURL(SrsCameraView view, @Nullable String rtmpURL) {
    Log.d("RNBroadcast", "In manager src prop is: " + rtmpURL);

    mPublisher = new SrsPublisher(view);
    mPublisher.setEncodeHandler(new SrsEncodeHandler((SrsEncodeHandler.SrsEncodeListener) mActivity));
    mPublisher.setRtmpHandler(new RtmpHandler((RtmpHandler.RtmpListener) mActivity));
    mPublisher.setRecordHandler(new SrsRecordHandler((SrsRecordHandler.SrsRecordListener) mActivity));
    mPublisher.setPreviewResolution(640, 360);
    mPublisher.setOutputResolution(720, 1280);
    mPublisher.setVideoHDMode();
    mPublisher.startCamera();
  }

  @ReactProp(name = "cameraPosition")
  public void setCameraPosition(SrsCameraView view, @Nullable String cameraPosition) {
    Log.d("RNBroadcast", "Camera Position: " + cameraPosition);
//    mPublisher.switchCameraFace((mPublisher.getCamraId() + 1) % Camera.getNumberOfCameras());
  }

  @ReactProp(name = "deviceOrientation")
  public void setDeviceOrientation(SrsCameraView view, @Nullable Integer deviceOrientation) {
    Log.d("RNBroadcast", "Device orientation" + deviceOrientation);
  }

  @ReactProp(name = "started")
  public void setSrc(SrsCameraView view, @Nullable Boolean started) {
    Log.d("asdf", "Setting started to:" + started);
    if (started == true) {
      mPublisher.startPublish("rtmp://a.rtmp.youtube.com/live2/hsa4-3pyd-7s00-2qmz");
    }
//    else {
//      mPublisher.stopPublish();
//    }

  }

}
