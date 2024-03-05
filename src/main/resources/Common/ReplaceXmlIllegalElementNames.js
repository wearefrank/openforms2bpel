function _typeof(obj) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) { return typeof obj; } : function (obj) { return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }, _typeof(obj); }
function validateAndReplaceKeys(obj, parentKey) {
    for (var key in obj) {
      if (obj.hasOwnProperty(key)) {
        if (_typeof(obj[key]) === 'object' && !Array.isArray(obj[key])) {
          parent = key;
          validateAndReplaceKeys(obj[key], parent);
        }
        if (/^\d/.test(key)) {
          if (parentKey === '') {
            newItemKey = "item".concat(key);
          } else {
            newItemKey = "".concat(parentKey).concat(key);
          }
          obj[newItemKey] = obj[key];
          delete obj[key];
        }
      }
    }
  }

function replaceXmlIllegalElementNames(obj) {
    json = JSON.parse(obj);
    validateAndReplaceKeys(json, '');
    return JSON.stringify(json);
}
