part of dashboard;

class Member extends StatelessWidget {
  const Member(
      {super.key, required this.member, required this.maxDisplayPeople});

  final List<String> member;
  final int maxDisplayPeople;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          (member.length > maxDisplayPeople) ? maxDisplayPeople : member.length,
          (index) => SimpleUserProfil(
                name: member[index],
                onPressed: () {},
              )),
    );
  }
}
