// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:js/js.dart';

/** Direct mapping to our own js function from test.js */
@JS('jsAlert')
external jsAlert(String msg);

/** Use dart getter for accessing published js objects,
 * hljs object from highlightjs lib in this case
 */
@JS('hljs')
external Hljs get hljs;

/** Mapping to highlightjs API, see http://highlightjs.readthedocs.org/en/latest/api.html
 * Must be marked as anonymous, as js methods are exposed using hljs object literal.
 * Note that subset of js API can be mapped.
 */
@JS()
@anonymous
class Hljs {

  /** Note that external keyword must be used and signatutes must match, try it! */

  external void initHighlighting();

  external List<String> listLanguages();

}


void main() {

  ButtonElement highlighter = querySelector('#highlight');
  ButtonElement showLanguages = querySelector('#showLanguages');

  // highlight by calling into jshl library
  highlighter.onClick.listen((evt) {
    hljs.initHighlighting();
  });

  // show jshl supported languages, combination of js interop calls
  showLanguages.onClick.listen((evt) {
    jsAlert('Default supported languages: ${hljs.listLanguages().join(', ')}');
  });

}
