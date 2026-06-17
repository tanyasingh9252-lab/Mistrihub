import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileWidget;
    final Widget desktopWidget;

      const ResponsiveLayout({
          super.key,
              required this.mobileWidget,
                  required this.desktopWidget,
                    });

                      @override
                        Widget build(BuildContext context) {
                            return LayoutBuilder(
                                  builder: (context, constraints) {
                                          if (constraints.maxWidth > 800) {
                                                    return desktopWidget;
                                                            } else {
                                                                      return mobileWidget;
                                                                              }
                                                                                    },
                                                                                        );
                                                                                          }
                                                                                          }import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileWidget;
  final Widget desktopWidget;

  const ResponsiveLayout({
    super.key,
    required this.mobileWidget,
    required this.desktopWidget,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return des