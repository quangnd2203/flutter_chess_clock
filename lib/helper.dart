String formatTime(Duration duration) {
  int second = duration.inSeconds.remainder(60);
  return [duration.inMinutes, second].map((seg) => seg.toString().padLeft(2, '0')).join(':');
}