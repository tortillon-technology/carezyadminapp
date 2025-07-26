import 'package:carezyadminapp/src/services/view/widget/suspension_status_selector.dart';
import 'package:carezyadminapp/utils/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../res/styles/fonts/plus_jakarta_font_palette.dart';
import '../../view_model/add_service_view_model.dart';

class SuspensionSystem extends StatelessWidget {
  final AddServiceViewModel viewModel;

  const SuspensionSystem({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    //SuspensionStatusSelector
    return Container(
      width: context.sw(),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16.r)),
      child: Consumer<AddServiceViewModel>(builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Suspension System",
                  style: PlusJakartaFontPalette.fBlack_16_600,
                )
              ],
            ),
            26.verticalSpace,
// 1. Front Left Lower Arm
            SuspensionStatusSelector(
              title: "Front Left Lower Arm",
              selection: provider.flla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.flla = s;
                });
              },
              lifeController: provider.lifeFrontLeftLowerArmController,
            
              remainingController:
                  provider.remainingFrontLeftLowerArmController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextFrontLeftLowerArmChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextFrontLeftLowerArmChangeODOlController.clear();
                }
              },
              odoController: provider.nextFrontLeftLowerArmChangeODOlController,
            ),
            40.verticalSpace,

// 2. Front Right Lower Arm
            SuspensionStatusSelector(
              title: "Front Right Lower Arm",
              selection: provider.frla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.frla = s;
                });
              },
              lifeController: provider.lifeFrontRightLowerArmController,
              remainingController:
                  provider.remainingFrontRightLowerArmController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextFrontRightLowerArmChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextFrontRightLowerArmChangeODOlController.clear();
                }
              },
              odoController:
                  provider.nextFrontRightLowerArmChangeODOlController,
            ),
            40.verticalSpace,
// 3. Rear Left Lower Arm
            SuspensionStatusSelector(
              title: "Rear Left Lower Arm",
              selection: provider.rlla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.rlla = s;
                });
              },
              lifeController: provider.lifeRearLeftLowerArmController,
              remainingController: provider.remainingRearLeftLowerArmController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextRearLeftLowerArmChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextRearLeftLowerArmChangeODOlController.clear();
                }
              },
              odoController: provider.nextRearLeftLowerArmChangeODOlController,
            ),
            40.verticalSpace,
// 4. Rear Right Lower Arm
            SuspensionStatusSelector(
              title: "Rear Right Lower Arm",
              selection: provider.rrla,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.rrla = s;
                });
              },
              lifeController: provider.lifeRearRightLowerArmController,
              remainingController:
                  provider.remainingRearRightLowerArmController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextRearRightLowerArmChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextRearRightLowerArmChangeODOlController.clear();
                }
              },
              odoController: provider.nextRearRightLowerArmChangeODOlController,
            ),
            40.verticalSpace,
// 5. Upper Arm Front Left
            SuspensionStatusSelector(
              title: "Upper Arm Front Left",
              selection: provider.uafl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.uafl = s;
                });
              },
              lifeController: provider.lifeUpperArmFrontLeftController,
              remainingController:
                  provider.remainingUpperArmFrontLeftController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextUpperArmFrontLeftChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextUpperArmFrontLeftChangeODOlController.clear();
                }
              },
              odoController: provider.nextUpperArmFrontLeftChangeODOlController,
            ),
            40.verticalSpace,
// 6. Upper Arm Front Right
            SuspensionStatusSelector(
              title: "Upper Arm Front Right",
              selection: provider.uafr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.uafr = s;
                });
              },
              lifeController: provider.lifeUpperArmFrontRightController,
              remainingController:
                  provider.remainingUpperArmFrontRightController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextUpperArmFrontRightChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextUpperArmFrontRightChangeODOlController.clear();
                }
              },
              odoController:
                  provider.nextUpperArmFrontRightChangeODOlController,
            ),
            40.verticalSpace,
// 7. Trailor Arm Rear
            SuspensionStatusSelector(
              title: "Trailor Arm Rear",
              selection: provider.tar,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.tar = s;
                });
              },
              lifeController: provider.lifeTrailorArmRearController,
              remainingController: provider.remainingTrailorArmRearController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextTrailorArmRearChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextTrailorArmRearChangeODOlController.clear();
                }
              },
              odoController: provider.nextTrailorArmRearChangeODOlController,
            ),
            40.verticalSpace,
// 8. Axle Boot Front Left Inner
            SuspensionStatusSelector(
              title: "Axle Boot Front Left Inner",
              selection: provider.abli,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abli = s;
                });
              },
              lifeController: provider.lifeAxleBootLeftInnerController,
              remainingController:
                  provider.remainingAxleBootLeftInnerController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextAxleBootLeftInnerChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextAxleBootLeftInnerChangeODOlController.clear();
                }
              },
              odoController: provider.nextAxleBootLeftInnerChangeODOlController,
            ),
            40.verticalSpace,
// 9. Axle Boot Front Right Inner
            SuspensionStatusSelector(
              title: "Axle Boot Front Right Inner",
              selection: provider.abri,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abri = s;
                });
              },
              lifeController: provider.lifeAxleBootRightInnerController,
              remainingController:
                  provider.remainingAxleBootRightInnerController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextAxleBootRightInnerChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextAxleBootRightInnerChangeODOlController.clear();
                }
              },
              odoController:
                  provider.nextAxleBootRightInnerChangeODOlController,
            ),
            40.verticalSpace,
// 10. Axle Boot Front Right Outer
            SuspensionStatusSelector(
              title: "Axle Boot Front Right Outer",
              selection: provider.abro,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abro = s;
                });
              },
              lifeController: provider.lifeAxleBootRightOuterController,
              remainingController:
                  provider.remainingAxleBootRightOuterController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextAxleBootRightOuterChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextAxleBootRightOuterChangeODOlController.clear();
                }
              },
              odoController:
                  provider.nextAxleBootRightOuterChangeODOlController,
            ),
            40.verticalSpace,
// 11. Axle Boot Front Left Outer
            SuspensionStatusSelector(
              title: "Axle Boot Front Left Outer",
              selection: provider.ablo,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.ablo = s;
                });
              },
              lifeController: provider.lifeAxleBootLeftOuterController,
              remainingController:
                  provider.remainingAxleBootLeftOuterController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextAxleBootLeftOuterChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextAxleBootLeftOuterChangeODOlController.clear();
                }
              },
              odoController: provider.nextAxleBootLeftOuterChangeODOlController,
            ),
            40.verticalSpace,
// 12. Axle Boot Rear Left Inner
            SuspensionStatusSelector(
              title: "Axle Boot Rear Left Inner",
              selection: provider.abrir,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abrir = s;
                });
              },
              lifeController: provider.lifeAbriRearController,
              remainingController: provider.remainingAbriRearController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextAbriRearChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextAbriRearChangeODOController.clear();
                }
              },
              odoController: provider.nextAbriRearChangeODOController,
            ),
            40.verticalSpace,
// 13. Axle Boot Rear Right Inner
            SuspensionStatusSelector(
              title: "Axle Boot Rear Right Inner",
              selection: provider.abrrr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abrrr = s;
                });
              },
              lifeController: provider.lifeAbrrRearController,
              remainingController: provider.remainingAbrrRearController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextAbrrRearChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextAbrrRearChangeODOController.clear();
                }
              },
              odoController: provider.nextAbrrRearChangeODOController,
            ),
            40.verticalSpace,
// 14. Axle Boot Rear Right Outer
            SuspensionStatusSelector(
              title: "Axle Boot Rear Right Outer",
              selection: provider.abror,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.abror = s;
                });
              },
              lifeController: provider.lifeAbroRearController,
              remainingController: provider.remainingAbroRearController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextAbroRearChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextAbroRearChangeODOController.clear();
                }
              },
              odoController: provider.nextAbroRearChangeODOController,
            ),
            40.verticalSpace,
// 15. Axle Boot Rear Left Outer
            SuspensionStatusSelector(
              title: "Axle Boot Rear Left Outer",
              selection: provider.ablor,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.ablor = s;
                });
              },
              lifeController: provider.lifeAbloRearController,
              remainingController: provider.remainingAbloRearController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextAbloRearChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextAbloRearChangeODOController.clear();
                }
              },
              odoController: provider.nextAbloRearChangeODOController,
            ),
            40.verticalSpace,
// 16. Link Rod Front Left
            SuspensionStatusSelector(
              title: "Link Rod Front Left",
              selection: provider.lrfl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrfl = s;
                });
              },
              lifeController: provider.lifeLinkRodFrontLeftController,
              remainingController: provider.remainingLinkRodFrontLeftController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextLinkRodFrontLeftChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextLinkRodFrontLeftChangeODOlController.clear();
                }
              },
              odoController: provider.nextLinkRodFrontLeftChangeODOlController,
            ),
            40.verticalSpace,
// 17. Link Rod Front Right
            SuspensionStatusSelector(
              title: "Link Rod Front Right",
              selection: provider.lrfr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrfr = s;
                });
              },
              lifeController: provider.lifeLinkRodFrontRightController,
              remainingController:
                  provider.remainingLinkRodFrontRightController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextLinkRodFrontRightChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextLinkRodFrontRightChangeODOlController.clear();
                }
              },
              odoController: provider.nextLinkRodFrontRightChangeODOlController,
            ),
            40.verticalSpace,
// 18. Link Rod Rear Left
            SuspensionStatusSelector(
              title: "Link Rod Rear Left",
              selection: provider.lrrl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrrl = s;
                });
              },
              lifeController: provider.lifeLinkRodRearLeftController,
              remainingController: provider.remainingLinkRodRearLeftController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextLinkRodRearLeftChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextLinkRodRearLeftChangeODOlController.clear();
                }
              },
              odoController: provider.nextLinkRodRearLeftChangeODOlController,
            ),
            40.verticalSpace,
// 19. Link Rod Rear Right
            SuspensionStatusSelector(
              title: "Link Rod Rear Right",
              selection: provider.lrrr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.lrrr = s;
                });
              },
              lifeController: provider.lifeLinkRodRearRightController,
              remainingController: provider.remainingLinkRodRearRightController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextLinkRodRearRightChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextLinkRodRearRightChangeODOlController.clear();
                }
              },
              odoController: provider.nextLinkRodRearRightChangeODOlController,
            ),
            40.verticalSpace,
// 20. Balance Rod Bush Front
            SuspensionStatusSelector(
              title: "Balance Rod Bush Front",
              selection: provider.brbf,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.brbf = s;
                });
              },
              lifeController: provider.lifeBalanceRodBushFrontController,
              remainingController:
                  provider.remainingBalanceRodBushFrontController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextBalanceRodBushRearChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextBalanceRodBushRearChangeODOlController.clear();
                }
              },
              odoController:
                  provider.nextBalanceRodBushRearChangeODOlController,
            ),
            40.verticalSpace,
// 21. Balance Rod Bush Rear
            SuspensionStatusSelector(
              title: "Balance Rod Bush Rear",
              selection: provider.brbr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.brbr = s;
                });
              },
              lifeController: provider.lifeBalanceRodBushRearController,
              remainingController:
                  provider.remainingBalanceRodBushRearController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider.nextBalanceRodBushRearChangeODOlController
                      .text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextBalanceRodBushRearChangeODOlController.clear();
                }
              },
              odoController:
                  provider.nextBalanceRodBushRearChangeODOlController,
            ),
            40.verticalSpace,
// 22. Front Left Shock Absorber
            SuspensionStatusSelector(
              title: "Front Left Shock Absorber",
              selection: provider.fshockl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.fshockl = s;
                });
              },
              lifeController: provider.lifeFshocklController,
              remainingController: provider.remainingFshocklController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextFshocklChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextFshocklChangeODOController.clear();
                }
              },
              odoController: provider.nextFshocklChangeODOController,
            ),
            40.verticalSpace,
// 23. Front Right Shock Absorber
            SuspensionStatusSelector(
              title: "Front Right Shock Absorber",
              selection: provider.fshockr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.fshockr = s;
                });
              },
              lifeController: provider.lifeFshockrController,
              remainingController: provider.remainingFshockrController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextFshockrChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextFshockrChangeODOController.clear();
                }
              },
              odoController: provider.nextFshockrChangeODOController,
            ),
            40.verticalSpace,
// 24. Rear Left Shock Absorber
            SuspensionStatusSelector(
              title: "Rear Left Shock Absorber",
              selection: provider.rshockl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.rshockl = s;
                });
              },
              lifeController: provider.lifeRshocklController,
              remainingController: provider.remainingRshocklController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextRshocklChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextRshocklChangeODOController.clear();
                }
              },
              odoController: provider.nextRshocklChangeODOController,
            ),
            40.verticalSpace,
// 25. Rear Right Shock Absorber
            SuspensionStatusSelector(
              title: "Rear Right Shock Absorber",
              selection: provider.rshockr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.rshockr = s;
                });
              },
              lifeController: provider.lifeRshockrController,
              remainingController: provider.remainingRshockrController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextRshockrChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextRshockrChangeODOController.clear();
                }
              },
              odoController: provider.nextRshockrChangeODOController,
            ),
            40.verticalSpace,
// 26. Front Left Wheel Bearing
            SuspensionStatusSelector(
              title: "Front Left Wheel Bearing",
              selection: provider.wlbearfl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.wlbearfl = s;
                });
              },
              lifeController: provider.lifeWlbearflController,
              remainingController: provider.remainingWlbearflController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextWlbearflChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextWlbearflChangeODOController.clear();
                }
              },
              odoController: provider.nextWlbearflChangeODOController,
            ),
            40.verticalSpace,
// 27. Front Right Wheel Bearing
            SuspensionStatusSelector(
              title: "Front Right Wheel Bearing",
              selection: provider.wlbearfr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.wlbearfr = s;
                });
              },
              lifeController: provider.lifeWlbearfrController,
              remainingController: provider.remainingWlbearfrController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextWlbearfrChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextWlbearfrChangeODOController.clear();
                }
              },
              odoController: provider.nextWlbearfrChangeODOController,
            ),
            40.verticalSpace,
// 28. Rear Left Wheel Bearing
            SuspensionStatusSelector(
              title: "Rear Left Wheel Bearing",
              selection: provider.wlbearrl,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.wlbearrl = s;
                });
              },
              lifeController: provider.lifeWlbearrlController,
              remainingController: provider.remainingWlbearrlController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextWlbearrlChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextWlbearrlChangeODOController.clear();
                }
              },
              odoController: provider.nextWlbearrlChangeODOController,
            ),
            40.verticalSpace,
// 29. Rear Right Wheel Bearing
            SuspensionStatusSelector(
              title: "Rear Right Wheel Bearing",
              selection: provider.wlbearrr,
              onSelection: (s) {
                provider.update(callBack: () {
                  provider.wlbearrr = s;
                });
              },
              lifeController: provider.lifeWlbearrrController,
              remainingController: provider.remainingWlbearrrController,
              onRemainingChanged: (String data) {
                if (data.isNotEmpty) {
                  provider
                      .nextWlbearrrChangeODOController.text = (int.parse(data) +
                          int.parse(provider.currentOodometerReading ?? '0'))
                      .toString();
                } else {
                  provider.nextWlbearrrChangeODOController.clear();
                }
              },
              odoController: provider.nextWlbearrrChangeODOController,
            ),
          ],
        );
      }),
    );
  }
}
