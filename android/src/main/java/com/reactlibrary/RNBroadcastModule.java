
package com.reactlibrary;

import java.util.List;
import java.util.Arrays;

import android.graphics.Color;
import android.support.annotation.Nullable;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.views.image.ReactImageView;
import com.facebook.drawee.backends.pipeline.Fresco;



public class RNBroadcastModule extends SimpleViewManager<ReactImageView> {

  public static final String REACT_CLASS = "RNBroadcastView";

  @Override
  public String getName() {
    return REACT_CLASS;
  }

  @Override
  public ReactImageView createViewInstance(ThemedReactContext context) {
    // initializer, here lets create the SRSCameraView
    return new ReactImageView(context, Fresco.newDraweeControllerBuilder(), null);
  }

  @ReactProp(name = "src")
  public void setSrc(ReactImageView view, @Nullable String src) {
    view.setSource(null);
    System.out.print("set border color");
  }
}