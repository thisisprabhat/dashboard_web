import 'package:admin_pannel_p1/controllers/MenuController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
              onPressed: () {
                context.read<MenuController>().toggleDrawer();
              },
              icon: const Icon(Icons.menu)),
        if (!Responsive.isMobile(context))
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(
            flex: Responsive.isDesktop(context) ? 2 : 1,
          ),
        const Expanded(
          child: SearchField(),
        ),
        Container(
          margin: const EdgeInsets.only(left: defaultPadding),
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          decoration: BoxDecoration(
            color: secondaryColor,
            border: Border.all(color: Colors.white10),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/profile_pic.png',
                height: 38,
              ),
              if (!Responsive.isMobile(context))
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  child: Text("Angelina Joli"),
                ),
              const Icon(Icons.keyboard_arrow_down_rounded)
            ],
          ),
        )
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: secondaryColor,
        hintText: "Search",
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
              padding: const EdgeInsets.all(defaultPadding * .75),
              margin:
                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: SvgPicture.asset("assets/icons/Search.svg")),
        ),
      ),
    );
  }
}
