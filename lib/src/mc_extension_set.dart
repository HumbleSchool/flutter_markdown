import 'package:markdown/markdown.dart' as md;

/// Include this extension set to enable Madam Curious specific syntax.
final md.ExtensionSet mcExtensionSet = md.ExtensionSet(
  [],
  [SubscriptSyntax(), SuperscriptSyntax()],
);

class SubscriptSyntax extends md.InlineSyntax {
  SubscriptSyntax() : super(r'<sub>.+</sub>');

  bool onMatch(md.InlineParser parser, Match match) {
    var innerText = match[0].substring(5, match[0].length - 6);
    var element = new md.Element.text('sub', innerText);
    parser.addNode(element);
    return true;
  }
}

class SuperscriptSyntax extends md.InlineSyntax {
  SuperscriptSyntax() : super(r'<sup>.+</sup>');

  bool onMatch(md.InlineParser parser, Match match) {
    var innerText = match[0].substring(5, match[0].length - 6);
    var element = new md.Element.text('sup', innerText);
    parser.addNode(element);
    return true;
  }
}
