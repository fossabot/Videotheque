import 'package:Videotheque/components/divider_component.dart';
import 'package:Videotheque/controllers/home_controller/home_controller.dart';
import 'package:Videotheque/globals.dart';
import 'package:Videotheque/views/home_view/carrousel_view.dart';
import 'package:Videotheque/views/home_view/components/AskMailComponent.dart';
import 'package:Videotheque/views/home_view/components/LoadingComponent.dart';
import 'package:Videotheque/views/home_view/components/TransfertDBComponent.dart';
import 'package:Videotheque/views/home_view/components/appBar_component.dart';
import 'package:Videotheque/views/home_view/components/askForCoffee_component.dart';
import 'package:Videotheque/views/home_view/components/noContentComponent.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeController(context),
      child: Consumer<HomeController>(
        builder: (context, controller, child) => Container(
          color: GlobalsColor.darkGreen,
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: Column(children: [
                    AppBarComponent(),
                    !controller.mailConfirmed ? AskMailComponent(controller.sendMailConfirm, controller.userMail) : Container(),
                    controller.askTransferDB ? AnimatedCrossFade(
                      firstChild: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: DividerComponent(GlobalsColor.darkGreen),
                      ),
                      secondChild: Container(), 
                      crossFadeState: !controller.isTransferDismissedHidden ? CrossFadeState.showFirst : CrossFadeState.showSecond, 
                      duration: const Duration(milliseconds: 200)
                    ) : Container(),
                    !controller.isTransferDismissedHidden ? 
                      controller.askTransferDB ? TransfertDBComponent(controller.confirmTransfertDB, controller.hideTransfertDB, controller.onDismissed)
                      : Container() : Container(),
                    AnimatedCrossFade(
                      firstChild: LoadingComponent(), 
                      secondChild: controller.hasNoContent ? NoContentComponent() : Column(children: 
                        List.generate(controller.carrouselLength, (int index) {
                          HomeCarrousels type = controller.getRandomCarrousel(index);
                          if (type == null) return Container();
                          return CarrouselView(type, controller.getCarrouselData(type), controller.getCarrouselTitle(type));})),
                      crossFadeState: controller.isLoading ? CrossFadeState.showFirst : CrossFadeState.showSecond, 
                      duration: const Duration(milliseconds: 200)
                    ),
                    AskForCoffeeComponent(controller.onDonateClick)
                  ]),
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}