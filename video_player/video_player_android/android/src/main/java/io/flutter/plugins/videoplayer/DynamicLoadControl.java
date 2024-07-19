package io.flutter.plugins.videoplayer;

import androidx.annotation.NonNull;
import androidx.media3.common.util.UnstableApi;
import androidx.media3.exoplayer.DefaultLoadControl;
import androidx.media3.exoplayer.LoadControl;
import androidx.media3.exoplayer.upstream.Allocator;

@UnstableApi
public class DynamicLoadControl implements LoadControl {
    LoadControl internalLoadControl;

    public DynamicLoadControl() {
        internalLoadControl = new DefaultLoadControl();
    }

    public void setInternalLoadControl(LoadControl internalLoadControl) {
        this.internalLoadControl = internalLoadControl;
    }
    // LoadControl method implementations

    @Override
    public void onPrepared() {
        internalLoadControl.onPrepared();
    }

    @Override
    public void onStopped() {
        internalLoadControl.onStopped();
    }

    @Override
    public void onReleased() {
        internalLoadControl.onReleased();
    }

    @Override
    @NonNull
    public Allocator getAllocator() {
        return internalLoadControl.getAllocator();
    }

    @Override
    public long getBackBufferDurationUs() {
        return internalLoadControl.getBackBufferDurationUs();
    }

    @Override
    public boolean retainBackBufferFromKeyframe() {
        return internalLoadControl.retainBackBufferFromKeyframe();
    }

    @Override
    public boolean shouldContinueLoading(long playbackPositionUs, long bufferedDurationUs, float playbackSpeed) {
        return internalLoadControl.shouldContinueLoading(playbackPositionUs, bufferedDurationUs, playbackSpeed);
    }
}
