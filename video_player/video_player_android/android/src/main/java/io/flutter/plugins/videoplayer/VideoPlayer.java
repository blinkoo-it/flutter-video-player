// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

package io.flutter.plugins.videoplayer;

import static androidx.media3.common.Player.REPEAT_MODE_ALL;
import static androidx.media3.common.Player.REPEAT_MODE_OFF;

import android.annotation.SuppressLint;
import android.content.Context;
import android.view.Surface;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.VisibleForTesting;
import androidx.media3.common.AudioAttributes;
import androidx.media3.common.C;
import androidx.media3.common.MediaItem;
import androidx.media3.common.PlaybackParameters;
import androidx.media3.common.util.UnstableApi;
import androidx.media3.datasource.DataSource;
import androidx.media3.datasource.DefaultDataSource;
import androidx.media3.exoplayer.DefaultLoadControl;
import androidx.media3.exoplayer.ExoPlayer;
import androidx.media3.exoplayer.LoadControl;
import androidx.media3.exoplayer.upstream.DefaultBandwidthMeter;

import io.flutter.view.TextureRegistry;

@UnstableApi
final class VideoPlayer {
  private ExoPlayer exoPlayer;
  private Surface surface;
  private final TextureRegistry.SurfaceTextureEntry textureEntry;
  private final VideoPlayerCallbacks videoPlayerEvents;
  private final VideoPlayerOptions options;
  private DynamicLoadControl loadControl;

  /**
   * Creates a video player.
   *
   * @param context application context.
   * @param events event callbacks.
   * @param textureEntry texture to render to.
   * @param asset asset to play.
   * @param options options for playback.
   * @return a video player instance.
   */
  @NonNull
  static VideoPlayer create(
      Context context,
      VideoPlayerCallbacks events,
      TextureRegistry.SurfaceTextureEntry textureEntry,
      VideoAsset asset,
      VideoPlayerOptions options) {
        DefaultBandwidthMeter bandwidthMeter = DefaultBandwidthMeter.getSingletonInstance(context);
        DynamicLoadControl loadControl = new DynamicLoadControl();
    ExoPlayer.Builder builder = new ExoPlayer.Builder(context)
            .setBandwidthMeter(bandwidthMeter)
            .setLoadControl(loadControl)
            .setMediaSourceFactory(asset.getMediaSourceFactory(context));
    return new VideoPlayer(builder, events, textureEntry, asset.getMediaItem(), options, loadControl);
  }

  @VisibleForTesting
  VideoPlayer(
          ExoPlayer.Builder builder,
          VideoPlayerCallbacks events,
          TextureRegistry.SurfaceTextureEntry textureEntry,
          MediaItem mediaItem,
          VideoPlayerOptions options,
          DynamicLoadControl loadControl) {
    this.videoPlayerEvents = events;
    this.textureEntry = textureEntry;
    this.options = options;
    this.loadControl = loadControl;

    ExoPlayer exoPlayer = builder.build();
    exoPlayer.setMediaItem(mediaItem);
    exoPlayer.prepare();

    setUpVideoPlayer(exoPlayer);
  }

  private void setUpVideoPlayer(ExoPlayer exoPlayer) {
    this.exoPlayer = exoPlayer;

    surface = new Surface(textureEntry.surfaceTexture());
    exoPlayer.setVideoSurface(surface);
    setAudioAttributes(exoPlayer, options.mixWithOthers);
    exoPlayer.addListener(new ExoPlayerEventListener(exoPlayer, videoPlayerEvents));
  }

  void sendBufferingUpdate() {
    videoPlayerEvents.onBufferingUpdate(exoPlayer.getBufferedPosition());
  }

  private static void setAudioAttributes(ExoPlayer exoPlayer, boolean isMixMode) {
    exoPlayer.setAudioAttributes(
        new AudioAttributes.Builder().setContentType(C.AUDIO_CONTENT_TYPE_MOVIE).build(),
        !isMixMode);
  }

  void play() {
    exoPlayer.setPlayWhenReady(true);
  }

  void pause() {
    exoPlayer.setPlayWhenReady(false);
  }

  void setLooping(boolean value) {
    exoPlayer.setRepeatMode(value ? REPEAT_MODE_ALL : REPEAT_MODE_OFF);
  }

  void setVolume(double value) {
    float bracketedValue = (float) Math.max(0.0, Math.min(1.0, value));
    exoPlayer.setVolume(bracketedValue);
  }

  void setPlaybackSpeed(double value) {
    // We do not need to consider pitch and skipSilence for now as we do not handle them and
    // therefore never diverge from the default values.
    final PlaybackParameters playbackParameters = new PlaybackParameters(((float) value));

    exoPlayer.setPlaybackParameters(playbackParameters);
  }

  void seekTo(int location) {
    exoPlayer.seekTo(location);
  }

  long getPosition() {
    return exoPlayer.getCurrentPosition();
  }

  public void setMaxResolution(int width, int height) {
    exoPlayer.setTrackSelectionParameters(
            exoPlayer.getTrackSelectionParameters()
                    .buildUpon()
                    .setMaxVideoSize(width, height)
                    .build()
    );
  }

  public void setBufferWindow(@Nullable Long seconds) {
   DefaultLoadControl.Builder builder = new DefaultLoadControl.Builder();
   int maxBufferMs = seconds != null ? seconds.intValue() * 1000 : DefaultLoadControl.DEFAULT_MAX_BUFFER_MS;
   builder.setBufferDurationsMs(
           DefaultLoadControl.DEFAULT_MIN_BUFFER_MS,
           Math.max(maxBufferMs,DefaultLoadControl.DEFAULT_MIN_BUFFER_MS),
           DefaultLoadControl.DEFAULT_BUFFER_FOR_PLAYBACK_MS,
           DefaultLoadControl.DEFAULT_BUFFER_FOR_PLAYBACK_AFTER_REBUFFER_MS
   );
   loadControl.setInternalLoadControl(builder.build());
  }

  void dispose() {
    textureEntry.release();
    if (surface != null) {
      surface.release();
    }
    if (exoPlayer != null) {
      exoPlayer.release();
    }
  }
}
