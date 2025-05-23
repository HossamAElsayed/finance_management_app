import 'package:finance_management_app/models/card.dart';
import 'package:finance_management_app/shared/widgets/custom_app_bar.dart';
import 'package:finance_management_app/modules/wallet/ui/components/wallet_card_listview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardProvider(),
      child: const WalletScreenBody(),
    );
  }
}

class WalletScreenBody extends StatefulWidget {
  const WalletScreenBody({super.key});

  @override
  State<WalletScreenBody> createState() => _WalletScreenBodyState();
}

class _WalletScreenBodyState extends State<WalletScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Wallet'),
      body: SizedBox(
        height: 200,
        child: CardList(cards: Provider.of<CardProvider>(context).cards),
      ),
    );
  }
}
