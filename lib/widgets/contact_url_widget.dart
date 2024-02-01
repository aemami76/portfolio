import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUrlWidget extends StatefulWidget {
  const ContactUrlWidget(
      {super.key,
      required this.text,
      required this.icon,
      required this.url,
      this.ltr = false});
  final String text;
  final IconData icon;
  final String url;
  final bool ltr;

  @override
  State<ContactUrlWidget> createState() => _ContactUrlWidgetState();
}

class _ContactUrlWidgetState extends State<ContactUrlWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  copyUrl() async {
    await Clipboard.setData(ClipboardData(text: widget.url));
    var data = await Clipboard.getData(widget.url);
    if (data != null && data.text == widget.url) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'copied!',
              style: TextStyle(color: Colors.green),
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: SelectableText(
              '<<${widget.text}>>: ${widget.url}',
              style: const TextStyle(color: Colors.green),
            ),
          ),
        );
      }
    }
  }

  launchURL() async {
    if (widget.url.contains('@')) {
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: widget.url,
        queryParameters: {
          'subject': 'Subject of the Email',
          'body': 'Body of the Email'
        },
      );

      if (await canLaunchUrl(emailLaunchUri)) {
        await launchUrl(emailLaunchUri);
      } else {
        throw 'Could not launch $emailLaunchUri';
      }
    } else {
      final url = Uri.parse(widget.url);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch url';
      }
    }
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            ),
            child: Padding(
              padding: EdgeInsets.all(6 * animationController.value),
              child: child,
            ),
          );
        },
      ),
      const SizedBox(
        width: 8,
      ),
      Center(child: Icon(widget.icon)),
      const SizedBox(
        width: 8,
      ),
      Text(widget.text),
      const Spacer(),
      IconButton(
          iconSize: 15,
          onPressed: copyUrl,
          icon: const Icon(
            Icons.copy,
          )),
    ];

    return ElevatedButton(
        onHover: (isHover) {
          if (isHover) {
            animationController
              ..forward()
              ..repeat(reverse: true);
          } else {
            animationController.reset();
            animationController.stop();
          }
        },
        onPressed: () async {
          await launchURL();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width:
                MediaQuery.sizeOf(context).width > 600 ? 150 : double.infinity,
            child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: !widget.ltr
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children:
                    widget.ltr ? widgetList.reversed.toList() : widgetList),
          ),
        ));
  }
}
