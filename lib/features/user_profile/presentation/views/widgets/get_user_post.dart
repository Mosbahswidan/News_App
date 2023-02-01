import 'package:news_app/features/user_profile/presentation/views/widgets/user_post_ltem.dart';

import '../../../../../core/utils/export.dart';
import '../../../../add_news/presentation/view_models/add_nwes_cubit/add_news_state.dart';

class GetUserPostList extends StatelessWidget {
  const GetUserPostList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewsCubit, AddNewsState>(
      builder: (context, state) {
        // print(state);
        if (AddNewsCubit.get(context).posts.isNotEmpty) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: AddNewsCubit.get(context).posts.length,
              itemBuilder: (context, index) {
                return UserNewsItem(newsModel: AddNewsCubit.get(context).posts[index]);
              },
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
