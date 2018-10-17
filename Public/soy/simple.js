// This file was automatically generated from simple.soy.
// Please don't edit this file by hand.

/**
 * @fileoverview Templates in namespace soy.examples.simple.
 * @public
 */

goog.provide('soy.examples.simple');

goog.require('goog.soy.data.UnsanitizedText');
goog.require('soy');
goog.require('soy.asserts');
goog.require('soydata.VERY_UNSAFE');


/**
 * @param {Object<string, *>=} opt_data
 * @param {Object<string, *>=} opt_ijData
 * @param {Object<string, *>=} opt_ijData_deprecated
 * @return {!goog.soy.data.SanitizedHtml}
 * @suppress {checkTypes}
 */
soy.examples.simple.helloWorld = function(opt_data, opt_ijData, opt_ijData_deprecated) {
  opt_ijData = opt_ijData_deprecated || opt_ijData;
  return soydata.VERY_UNSAFE.ordainSanitizedHtml('Hello world!');
};
if (goog.DEBUG) {
  soy.examples.simple.helloWorld.soyTemplateName = 'soy.examples.simple.helloWorld';
}


/**
 * @param {soy.examples.simple.helloName.Params} opt_data
 * @param {Object<string, *>=} opt_ijData
 * @param {Object<string, *>=} opt_ijData_deprecated
 * @return {!goog.soy.data.SanitizedHtml}
 * @suppress {checkTypes}
 */
soy.examples.simple.helloName = function(opt_data, opt_ijData, opt_ijData_deprecated) {
  opt_ijData = opt_ijData_deprecated || opt_ijData;
  opt_data = opt_data || {};
  /** @type {!goog.soy.data.UnsanitizedText|null|string|undefined} */
  var name = soy.asserts.assertType(opt_data.name == null || (goog.isString(opt_data.name) || opt_data.name instanceof goog.soy.data.UnsanitizedText), 'name', opt_data.name, '!goog.soy.data.UnsanitizedText|null|string|undefined');
  return soydata.VERY_UNSAFE.ordainSanitizedHtml(name ? 'Hello ' + soy.$$escapeHtml(name) + '!' : soy.examples.simple.helloWorld(null, opt_ijData));
};
/**
 * @typedef {{
 *  name: (!goog.soy.data.UnsanitizedText|null|string|undefined),
 * }}
 */
soy.examples.simple.helloName.Params;
if (goog.DEBUG) {
  soy.examples.simple.helloName.soyTemplateName = 'soy.examples.simple.helloName';
}


/**
 * @param {soy.examples.simple.helloNames.Params} opt_data
 * @param {Object<string, *>=} opt_ijData
 * @param {Object<string, *>=} opt_ijData_deprecated
 * @return {!goog.soy.data.SanitizedHtml}
 * @suppress {checkTypes}
 */
soy.examples.simple.helloNames = function(opt_data, opt_ijData, opt_ijData_deprecated) {
  opt_ijData = opt_ijData_deprecated || opt_ijData;
  /** @type {!Array<!goog.soy.data.UnsanitizedText|string>} */
  var names = soy.asserts.assertType(goog.isArray(opt_data.names), 'names', opt_data.names, '!Array<!goog.soy.data.UnsanitizedText|string>');
  var output = '';
  var name30List = names;
  var name30ListLen = name30List.length;
  if (name30ListLen > 0) {
    for (var name30Index = 0; name30Index < name30ListLen; name30Index++) {
      var name30Data = name30List[name30Index];
      output += soy.examples.simple.helloName({name: name30Data}, opt_ijData) + (!(name30Index == name30ListLen - 1) ? '<br' + (goog.DEBUG && soy.$$debugSoyTemplateInfo ? ' data-debug-soy="soy.examples.simple.helloNames ./Resources/SoyTemplates/examples/simple.soy:56"' : '') + '>' : '');
    }
  } else {
    output += soy.examples.simple.helloWorld(null, opt_ijData);
  }
  return soydata.VERY_UNSAFE.ordainSanitizedHtml(output);
};
/**
 * @typedef {{
 *  names: !Array<!goog.soy.data.UnsanitizedText|string>,
 * }}
 */
soy.examples.simple.helloNames.Params;
if (goog.DEBUG) {
  soy.examples.simple.helloNames.soyTemplateName = 'soy.examples.simple.helloNames';
}
