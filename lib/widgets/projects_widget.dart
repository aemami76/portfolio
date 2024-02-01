import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget(this.data, {super.key});
  final List data;

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  launchURL() async {
    final url = Uri.parse(widget.data[3]);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    Widget closeContainer() {
      return SizedBox(
        width: 100,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4, top: 8),
            child: CachedNetworkImage(
              height: w / 4.4,
              width: w / 4.4,
              fit: BoxFit.contain,
              imageUrl: widget.data[0],
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.black,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const Spacer(),
          Text(
            widget.data[1],
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
        ]),
      );
    }

    Widget openContainer() {
      return SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              border: Border.all(
                  color: Theme.of(context).colorScheme.primary, width: 3),
              borderRadius: BorderRadius.circular(25)),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4, top: 8),
                child: CachedNetworkImage(
                  height: w / 4.4,
                  width: w / 4.4,
                  fit: BoxFit.contain,
                  imageUrl: widget.data[0],
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(
                    color: Colors.black,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(widget.data[1],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 16,
              ),
              Text(widget.data[2]),
              const SizedBox(
                height: 16,
              ),
              widget.data[3].toString().isEmpty
                  ? const Text('\n\n<<<Private>>>')
                  : TextButton(
                      onPressed: launchURL,
                      child: Text(
                        widget.data[3],
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onPrimary),
                      )),
            ]),
          ),
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          child: OpenContainer(
              openElevation: 3,
              closedElevation: 3,
              transitionDuration: const Duration(milliseconds: 500),
              transitionType: ContainerTransitionType.fadeThrough,
              closedBuilder: (context, action) => closeContainer(),
              openBuilder: (context, action) => openContainer()),
        ),
      ),
    );
  }
}
