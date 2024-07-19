package io.flutter.plugins.videoplayer;

import androidx.annotation.NonNull;
import androidx.media3.common.Timeline;
import androidx.media3.common.util.UnstableApi;
import androidx.media3.exoplayer.DefaultLoadControl;
import androidx.media3.exoplayer.LoadControl;
import androidx.media3.exoplayer.Renderer;
import androidx.media3.exoplayer.source.MediaSource;
import androidx.media3.exoplayer.source.TrackGroupArray;
import androidx.media3.exoplayer.trackselection.ExoTrackSelection;
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

    @Override
    public void onPrepared() {
        internalLoadControl.onPrepared();
    }

    @Override
    public void onTracksSelected(Timeline timeline, MediaSource.MediaPeriodId mediaPeriodId, Renderer[] renderers, TrackGroupArray trackGroups, ExoTrackSelection[] trackSelections) {
        internalLoadControl.onTracksSelected(timeline, mediaPeriodId, renderers, trackGroups, trackSelections);
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
    public boolean shouldStartPlayback(Timeline timeline, MediaSource.MediaPeriodId mediaPeriodId, long bufferedDurationUs, float playbackSpeed, boolean rebuffering, long targetLiveOffsetUs) {
        return internalLoadControl.shouldStartPlayback(timeline, mediaPeriodId, bufferedDurationUs, playbackSpeed, rebuffering, targetLiveOffsetUs);
    }
}
