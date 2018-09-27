package com.spark.jsinteractive_android;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.WebChromeClient;
import android.webkit.WebViewClient;
import android.widget.Toast;

import com.github.lzyzsd.jsbridge.BridgeHandler;
import com.github.lzyzsd.jsbridge.BridgeWebView;
import com.github.lzyzsd.jsbridge.BridgeWebViewClient;
import com.github.lzyzsd.jsbridge.CallBackFunction;
import com.github.lzyzsd.jsbridge.DefaultHandler;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    private static final String tag = "MainActivity";

    BridgeWebView bridgeWebView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        bridgeWebView = (BridgeWebView) findViewById(R.id.webView);

        bridgeWebView.setDefaultHandler(new MyDefaultHandler());

        bridgeWebView.loadUrl("file:///android_asset/jsbridge.html");

        // 注册供JS调用的方法
        registerJSInvokeMethods();
    }

    class MyDefaultHandler extends DefaultHandler {
        @Override
        public void handler(String data, CallBackFunction function) {
//            super.handler(data, function);
            Log.e(tag, data);
            function.onCallBack("js send default message callback");
        }
    }


    public void nativeCallJS(View view) {
        Log.e("xxxxxxxxxxxx", "native call js");
        bridgeWebView.callHandler("showQrCodePage", "key-value-from-native", new CallBackFunction() {
            @Override
            public void onCallBack(String data) {
                Log.e("xxxxxxxxxxxx", "native call js response : " + data);

            }
        });
    }

    public void nativeCallJSWithResponse(View view) {
        Log.e("xxxxxxxxxxxx", "native call js with response");
//        bridgeWebView.callHandler("jsbridge_getJsMessage", "native call js with response", new CallBackFunction() {
//            @Override
//            public void onCallBack(String data) {
//                Log.e("xxxxxxxxxxxxx", "callback : " + data);
//            }
//        });

    }

    public void registerJSInvokeMethods() {
        bridgeWebView.registerHandler("invokeNative", new BridgeHandler() {
            @Override
            public void handler(String data, CallBackFunction function) {
                Log.e(tag, "data from js:" + data);
                Map map = new HashMap();
                map.put("name" , "王子");
                function.onCallBack(map.toString());
            }
        });

        bridgeWebView.registerHandler("login", new BridgeHandler() {
            @Override
            public void handler(String data, CallBackFunction function) {
                Log.e("xxxxxxxxxxxx", data);
            }
        });

    }



}
