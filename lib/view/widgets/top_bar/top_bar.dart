import 'package:manage_hotel/utils/app_export.dart';

class TopBar extends StatelessWidget {
  final Function()? popupIconButton;
  final Function()? addIconButton;

  const TopBar({
    super.key,
    required this.popupIconButton,
    required this.addIconButton,
  });

  @override
  Widget build(BuildContext context) {
     final mq = MediaQuery.of(context).size;
     TextEditingController textEditingController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.qr_code,
                    color: AppColors.homeBackgroundColor,
                  )),

              InkWell(onTap: popupIconButton, child: BoardTypeMenu()),

              const Spacer(),

              IconButton(
                  onPressed: addIconButton,
                  icon: const Icon(Icons.add, color: AppColors.homeBackgroundColor)),

              IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(Icons.dehaze,
                      color: AppColors.homeBackgroundColor)),
            ],
          ),
          Container(
            height: mq.height * 0.05,
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                color: AppColors.homeBackgroundColor,
                borderRadius: BorderRadius.circular(8)),
            child:  TextField(
              cursorColor: AppColors.secondaryTextColor,
              controller: textEditingController,
              style: AppTextStyles.bodyText2.copyWith(height: 0.9,fontSize: 19),
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                  hintText: "search here...",
                  border: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }
}
