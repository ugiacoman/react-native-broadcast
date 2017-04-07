
package com.reactlibrary;

import java.util.List;
import java.util.Arrays;

import android.graphics.Color;
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
import com.facebook.react.views.image.ReactImageView;
import com.facebook.drawee.backends.pipeline.Fresco;
import com.github.faucamp.simplertmp.RtmpHandler;

import net.ossrs.yasea.SrsCameraView;
import net.ossrs.yasea.SrsEncodeHandler;
import net.ossrs.yasea.SrsPublisher;
import net.ossrs.yasea.SrsRecordHandler;

import static android.graphics.Color.BLUE;


public class RNBroadcastViewManager extends SimpleViewManager<ReactImageView> {

  public static final String REACT_CLASS = "RNBroadcastView";

  @Override
  public String getName() {
    return REACT_CLASS;
  }

  @Override
  public ReactImageView createViewInstance(ThemedReactContext context) {
    return new ReactImageView(context, Fresco.newDraweeControllerBuilder(), null);
  }

  @ReactProp(name = "rtmpURL")
  public void setRtmpURL(ReactImageView view, @Nullable String rtmpURL) {
    Log.d("RNBroadcast", "In manager src prop is: " + rtmpURL);
  }

  @ReactProp(name = "cameraPosition")
  public void setCameraPosition(ReactImageView view, @Nullable String cameraPosition) {
    Log.d("RNBroadcast", "Camera Position: " + cameraPosition);
  }

  @ReactProp(name = "deviceOrientation")
  public void setDeviceOrientation(ReactImageView view, @Nullable Integer deviceOrientation) {
    Log.d("RNBroadcast", "Device orientation" + deviceOrientation);
  }

  @ReactProp(name = "started")
  public void setSrc(ReactImageView view, @Nullable Boolean started) {
    Log.d("asdf", "Setting started to:" + started);
  }

}
