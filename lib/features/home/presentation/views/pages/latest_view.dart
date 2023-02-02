import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/home/presentation/views/widgets/latest_view_body.dart';

class LatestView extends StatelessWidget {
  const LatestView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        // appBar: CustomAppBar(
        //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //   title: "Latest",
        //   titleColor: Colors.black,
        //   leftIcon: const Icon(
        //     Icons.arrow_back_outlined,
        //     color: Colors.black,
        //   ),
        //   pressedLeftIcon: () {
        //     GoRouter.of(context).pop();
        //   },
        //   isShowActionIcon1: true,
        //   actionIcon1: const Icon(
        //     Icons.more_vert,
        //     color: Colors.black,
        //   ),
        //   isShowLeftIcon: true,
        // ),
        appBar: AppBar(
          title: const Text(
            "Latest",
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                //  color: Colors.black,
              )),
          actions: const [
            Icon(
              Icons.more_vert,
              //    color: Colors.black,
            )
          ],
          bottom: const TabBar(
            //   labelStyle:
            //    Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
            indicatorWeight: 5,
            tabs: [
              Tab(
                text: "All",
              ),
              Tab(
                text: "Sports",
              ),
              Tab(
                text: "Politics",
              ),
              Tab(
                text: "Bussiness",
                // iconMargin: EdgeInsets.all(30),
                //height: 40,
              ),
              Tab(
                text: "Health",
              ),
            ],
            labelPadding: EdgeInsets.zero,
            // labelColor: ,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.zero,
          ),
        ),
        body: const LatestViewBody(),
      ),
    );
  }
}
