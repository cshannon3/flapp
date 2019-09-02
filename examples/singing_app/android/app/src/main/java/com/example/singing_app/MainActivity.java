package com.example.singing_app;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

import be.tarsos.dsp.AudioDispatcher;
import be.tarsos.dsp.AudioEvent;
import be.tarsos.dsp.io.android.AudioDispatcherFactory;
import be.tarsos.dsp.pitch.PitchDetectionHandler;
import be.tarsos.dsp.pitch.PitchDetectionResult;
import be.tarsos.dsp.pitch.PitchProcessor;
import be.tarsos.dsp.pitch.PitchProcessor.PitchEstimationAlgorithm;
import android.util.Log;
public class MainActivity extends FlutterActivity {
    public static final String STREAM = "com.example.singing_app/stream";
    float pitchInHz = 0.0f;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      GeneratedPluginRegistrant.registerWith(this);
      AudioDispatcher dispatcher = AudioDispatcherFactory.fromDefaultMicrophone(22050,1024,0);
        dispatcher.addAudioProcessor(new PitchProcessor(PitchEstimationAlgorithm.FFT_YIN, 22050, 1024, new PitchDetectionHandler() {

            @Override
            public void handlePitch(PitchDetectionResult pitchDetectionResult, AudioEvent audioEvent) {
                pitchInHz = pitchDetectionResult.getPitch();
                // Log.w("GGGG", String.valueOf(pitchInHz));
            }
        }));
      new EventChannel(getFlutterView(), STREAM).setStreamHandler(
        new EventChannel.StreamHandler() {
            @Override
            public void onListen(Object args, final EventChannel.EventSink events) {
                events.success(pitchInHz);
            }

            @Override
            public void onCancel(Object args) {

                //dispatcher.cancelling();
            }

        });
        new Thread(dispatcher,"Audio Dispatcher").start();
    }
  }
/*
public class MainActivity extends FlutterActivity {
    public static final String STREAM = "com.example.a/stream";
    float pitchInHz = 0.0f;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Log.w("GG", "f");
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        AudioDispatcher dispatcher = AudioDispatcherFactory.fromDefaultMicrophone(22050,1024,0);
        dispatcher.addAudioProcessor(new PitchProcessor(PitchEstimationAlgorithm.FFT_YIN, 22050, 1024, new PitchDetectionHandler() {

            @Override
            public void handlePitch(PitchDetectionResult pitchDetectionResult, AudioEvent audioEvent) {
                pitchInHz = pitchDetectionResult.getPitch();
                // Log.w("GGGG", String.valueOf(pitchInHz));
            }
        }));

        new EventChannel(getFlutterView(), STREAM).setStreamHandler(
                new EventChannel.StreamHandler() {
                    @Override
                    public void onListen(Object args, final EventChannel.EventSink events) {
                        events.success(pitchInHz);
                    }

                    @Override
                    public void onCancel(Object args) {

                        //dispatcher.cancelling();
                    }

                });
        //	}
        // }));
        new Thread(dispatcher,"Audio Dispatcher").start();
    }
}


import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.EventChannel;

import be.tarsos.dsp.AudioDispatcher;
import be.tarsos.dsp.AudioEvent;
import be.tarsos.dsp.io.android.AudioDispatcherFactory;
import be.tarsos.dsp.pitch.PitchDetectionHandler;
import be.tarsos.dsp.pitch.PitchDetectionResult;
import be.tarsos.dsp.pitch.PitchProcessor;
import be.tarsos.dsp.pitch.PitchProcessor.PitchEstimationAlgorithm;
import android.util.Log;



public class MainActivity extends FlutterActivity {
  public static final String STREAM = "com.example.singing_app/stream";
    float pitchInHz = 0.0f;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        AudioDispatcher dispatcher = AudioDispatcherFactory.fromDefaultMicrophone(22050,1024,0);
        dispatcher.addAudioProcessor(new PitchProcessor(PitchEstimationAlgorithm.FFT_YIN, 22050, 1024, new PitchDetectionHandler() {

            @Override
            public void handlePitch(PitchDetectionResult pitchDetectionResult, AudioEvent audioEvent) {
                pitchInHz = pitchDetectionResult.getPitch();
             
            }
        }));
        //dispatcher.EventChannel(getFlutterView(), STREAM).

        new EventChannel(getFlutterView(), STREAM).setStreamHandler(
                new EventChannel.StreamHandler() {
                    @Override
                    public void onListen(Object args, final EventChannel.EventSink events) {
                        events.success(pitchInHz);
                    }

                    @Override
                    public void onCancel(Object args) {
                    }

                });
    
        new Thread(dispatcher,"Audio Dispatcher").start();
    }

}
*/