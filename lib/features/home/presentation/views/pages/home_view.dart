import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/home/presentation/views/widgets/home_view_body.dart';

import '../../../../../core/utils/assets_data.dart';
import '../widgets/sarch_bar_widget.dart';

class HomeViwe extends StatelessWidget {
  const HomeViwe({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120.w,
        toolbarHeight: 100.h,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Image.asset(
          AssetsData.logo,
          height: 100.h,
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: SearchWidget(
                textController: searchController,
                hintText: "Search",
                tap: () {
                  GoRouter.of(context).push(AppRouter.kSearch, extra: searchController);
                },
              ),
            )),
      ),
      body: const HomeViewBody(),
    );
  }
}
