package io.flutter.plugins.videoplayer;

import com.google.android.exoplayer2.DefaultLoadControl;
import com.google.android.exoplayer2.LoadControl;
import com.google.android.exoplayer2.Renderer;
import com.google.android.exoplayer2.source.TrackGroupArray;
import com.google.android.exoplayer2.trackselection.ExoTrackSelection;
import com.google.android.exoplayer2.upstream.Allocator;

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
    public void onTracksSelected(Renderer[] renderers, TrackGroupArray trackGroups, ExoTrackSelection[] trackSelections) {
        internalLoadControl.onTracksSelected(renderers, trackGroups, trackSelections);
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

    @Override
    public boolean shouldStartPlayback(long bufferedDurationUs, float playbackSpeed, boolean rebuffering, long targetLiveOffsetUs) {
        return internalLoadControl.shouldStartPlayback(bufferedDurationUs, playbackSpeed, rebuffering, targetLiveOffsetUs);
    }
}
