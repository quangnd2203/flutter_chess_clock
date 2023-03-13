part of '../routers/app_page.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  ChessClockBloc get clockBloc => Get.find<ChessClockBloc>();

  SoundCubit get soundCubit => Get.find<SoundCubit>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                clockBloc.add(ChessClockRun2());
              },
              child: Transform.rotate(
                angle: pi,
                child: TimeView(
                  timeBloc: clockBloc.timeBloc1,
                ),
              ),
            ),
          ),
          buildSettings(),
          Expanded(
            child: InkWell(
              onTap: () {
                clockBloc.add(ChessClockRun1());
              },
              child: TimeView(
                timeBloc: clockBloc.timeBloc2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSettings() {
    return Container(
      color: AppColors.black,
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildButtonSetting(Icons.refresh, () {
            clockBloc.add(ChessClockReset());
          }),
          const SizedBox(
            width: 20,
          ),
          playState(),
          const SizedBox(
            width: 50,
          ),
          buildButtonSetting(Icons.timer_outlined, (){
            Get.toNamed(Routes.timeControl.route);
            // Navigator.push(Get.context!, MaterialPageRoute(builder: (BuildContext context) => TimeControls()));
          }),
          const SizedBox(
            width: 20,
          ),
          soundState(),
        ],
      ),
    );
  }

  Widget buildButtonSetting(IconData icon, [VoidCallback? onPressed]) {
    return IconButton(
      onPressed: onPressed ?? () {},
      icon: Icon(icon),
      color: Colors.white,
      iconSize: 33,
      splashRadius: 1,
    );
  }

  Widget playState() {
    return BlocConsumer(
      bloc: clockBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ChessClockStopState) {
          return const SizedBox();
        }
        if (state is ChessClockStartState) {
          return buildButtonSetting(Icons.pause, () {
            clockBloc.add(ChessClockPause());
          });
        }
        if (state is ChessClockPauseState || state is ChessClockInitial) {
          return buildButtonSetting(Icons.play_arrow, () {
            clockBloc.add(ChessClockStart());
          });
        }
        return const SizedBox();
      },
    );
  }

  Widget soundState() {
    return BlocConsumer(
      builder: (context, bool state) {
        return buildButtonSetting(
          state ? Icons.volume_up : Icons.volume_off,
          () => Get.find<SoundCubit>().changeState(!state),
        );
      },
      listener: (state, context) {},
      bloc: soundCubit,
    );
  }
}
