import 'package:flutter/material.dart';
import 'package:weather/gen/assets.gen.dart';
import 'package:weather/presentation/home/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeCubit>().getWeather(33.44, -94.04);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff47BBE1),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 35),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon:
                                  ImageIcon(AssetImage(Assets.images.map.path)),
                              iconSize: 17,
                              color: Colors.white,
                            ),
                            Text(
                              "${state.weather.name}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 17),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: ImageIcon(
                                  AssetImage(Assets.images.chevronDown.path)),
                              iconSize: 17,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: ImageIcon(
                              AssetImage(Assets.images.notification.path)),
                          iconSize: 17,
                          color: Colors.white,
                        )
                      ],
                    ),
                    const SizedBox(height: 45),
                    Image.network(
                      "http://openweathermap.org/img/wn/${state.weather.weather!.first.icon}@2x.png",
                      height: 250,
                      width: 250,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      height: 280,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(14)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Today, 12 September",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${(state.weather.main!.temp! - 278).toStringAsFixed(2)}°",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 70),
                          ),
                          Text(
                            "${state.weather.weather!.first.main}",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 17),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 30,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          Assets.images.windy.path,
                                          width: 17,
                                          height: 17,
                                        ),
                                        const SizedBox(width: 15),
                                        const Text(
                                          "Wind",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: const Text("|",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("${state.weather.wind!.speed} m/s",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 30,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          Assets.images.hum.path,
                                          width: 17,
                                          height: 17,
                                        ),
                                        const SizedBox(width: 15),
                                        const Text(
                                          "Humidty",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: const Text("|",
                                        style: TextStyle(
                                          color: Colors.white,
                                        )),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("${state.weather.main!.humidity}%",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  )
                                ]),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state is HomeError) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
