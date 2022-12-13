// modules are defined as an array
// [ module function, map of requires ]
//
// map of requires is short require name -> numeric require
//
// anything defined in a previous bundle is accessed via the
// orig method which is the require for previous bundles
parcelRequire = (function (modules, cache, entry, globalName) {
  // Save the require from previous bundle to this closure if any
  var previousRequire = typeof parcelRequire === 'function' && parcelRequire;
  var nodeRequire = typeof require === 'function' && require;

  function newRequire(name, jumped) {
    if (!cache[name]) {
      if (!modules[name]) {
        // if we cannot find the module within our internal map or
        // cache jump to the current global require ie. the last bundle
        // that was added to the page.
        var currentRequire = typeof parcelRequire === 'function' && parcelRequire;
        if (!jumped && currentRequire) {
          return currentRequire(name, true);
        }

        // If there are other bundles on this page the require from the
        // previous one is saved to 'previousRequire'. Repeat this as
        // many times as there are bundles until the module is found or
        // we exhaust the require chain.
        if (previousRequire) {
          return previousRequire(name, true);
        }

        // Try the node require function if it exists.
        if (nodeRequire && typeof name === 'string') {
          return nodeRequire(name);
        }

        var err = new Error('Cannot find module \'' + name + '\'');
        err.code = 'MODULE_NOT_FOUND';
        throw err;
      }

      localRequire.resolve = resolve;
      localRequire.cache = {};

      var module = cache[name] = new newRequire.Module(name);

      modules[name][0].call(module.exports, localRequire, module, module.exports, this);
    }

    return cache[name].exports;

    function localRequire(x){
      return newRequire(localRequire.resolve(x));
    }

    function resolve(x){
      return modules[name][1][x] || x;
    }
  }

  function Module(moduleName) {
    this.id = moduleName;
    this.bundle = newRequire;
    this.exports = {};
  }

  newRequire.isParcelRequire = true;
  newRequire.Module = Module;
  newRequire.modules = modules;
  newRequire.cache = cache;
  newRequire.parent = previousRequire;
  newRequire.register = function (id, exports) {
    modules[id] = [function (require, module) {
      module.exports = exports;
    }, {}];
  };

  var error;
  for (var i = 0; i < entry.length; i++) {
    try {
      newRequire(entry[i]);
    } catch (e) {
      // Save first error but execute all entries
      if (!error) {
        error = e;
      }
    }
  }

  if (entry.length) {
    // Expose entry point to Node, AMD or browser globals
    // Based on https://github.com/ForbesLindesay/umd/blob/master/template.js
    var mainExports = newRequire(entry[entry.length - 1]);

    // CommonJS
    if (typeof exports === "object" && typeof module !== "undefined") {
      module.exports = mainExports;

    // RequireJS
    } else if (typeof define === "function" && define.amd) {
     define(function () {
       return mainExports;
     });

    // <script>
    } else if (globalName) {
      this[globalName] = mainExports;
    }
  }

  // Override the current require with this new one
  parcelRequire = newRequire;

  if (error) {
    // throw error from earlier, _after updating parcelRequire_
    throw error;
  }

  return newRequire;
})({"../../node_modules/parcel-bundler/src/builtins/bundle-url.js":[function(require,module,exports) {
var bundleURL = null;

function getBundleURLCached() {
  if (!bundleURL) {
    bundleURL = getBundleURL();
  }

  return bundleURL;
}

function getBundleURL() {
  // Attempt to find the URL of the current script and use that as the base URL
  try {
    throw new Error();
  } catch (err) {
    var matches = ('' + err.stack).match(/(https?|file|ftp|chrome-extension|moz-extension):\/\/[^)\n]+/g);

    if (matches) {
      return getBaseURL(matches[0]);
    }
  }

  return '/';
}

function getBaseURL(url) {
  return ('' + url).replace(/^((?:https?|file|ftp|chrome-extension|moz-extension):\/\/.+)?\/[^/]+(?:\?.*)?$/, '$1') + '/';
}

exports.getBundleURL = getBundleURLCached;
exports.getBaseURL = getBaseURL;
},{}],"../../node_modules/parcel-bundler/src/builtins/css-loader.js":[function(require,module,exports) {
var bundle = require('./bundle-url');

function updateLink(link) {
  var newLink = link.cloneNode();

  newLink.onload = function () {
    link.remove();
  };

  newLink.href = link.href.split('?')[0] + '?' + Date.now();
  link.parentNode.insertBefore(newLink, link.nextSibling);
}

var cssTimeout = null;

function reloadCSS() {
  if (cssTimeout) {
    return;
  }

  cssTimeout = setTimeout(function () {
    var links = document.querySelectorAll('link[rel="stylesheet"]');

    for (var i = 0; i < links.length; i++) {
      if (bundle.getBaseURL(links[i].href) === bundle.getBundleURL()) {
        updateLink(links[i]);
      }
    }

    cssTimeout = null;
  }, 50);
}

module.exports = reloadCSS;
},{"./bundle-url":"../../node_modules/parcel-bundler/src/builtins/bundle-url.js"}],"../scss/main.scss":[function(require,module,exports) {
var reloadCSS = require('_css_loader');

module.hot.dispose(reloadCSS);
module.hot.accept(reloadCSS);
},{"./../images/icons/icon-video.svg":[["icon-video.7d535ffe.svg","../images/icons/icon-video.svg"],"../images/icons/icon-video.svg"],"./../images/logos/Logotype-blue.svg":[["Logotype-blue.0ab2090d.svg","../images/logos/Logotype-blue.svg"],"../images/logos/Logotype-blue.svg"],"./../images/icons/caret-right.svg":[["caret-right.ffde763f.svg","../images/icons/caret-right.svg"],"../images/icons/caret-right.svg"],"./../images/textures/pattern.png":[["pattern.ebcbf18a.png","../images/textures/pattern.png"],"../images/textures/pattern.png"],"./../images/icons/tag-icon.svg":[["tag-icon.f710f8de.svg","../images/icons/tag-icon.svg"],"../images/icons/tag-icon.svg"],"./../images/icons/icon-caret-circle-next.svg":[["icon-caret-circle-next.7a229255.svg","../images/icons/icon-caret-circle-next.svg"],"../images/icons/icon-caret-circle-next.svg"],"./../images/icons/icon-caret-circle-prev.svg":[["icon-caret-circle-prev.1761510c.svg","../images/icons/icon-caret-circle-prev.svg"],"../images/icons/icon-caret-circle-prev.svg"],"./../images/icons/scroll-right.svg":[["scroll-right.e23900f8.svg","../images/icons/scroll-right.svg"],"../images/icons/scroll-right.svg"],"./../images/icons/scroll-right-ghost.svg":[["scroll-right-ghost.77757f03.svg","../images/icons/scroll-right-ghost.svg"],"../images/icons/scroll-right-ghost.svg"],"./../images/icons/scroll-left.svg":[["scroll-left.abe536cc.svg","../images/icons/scroll-left.svg"],"../images/icons/scroll-left.svg"],"./../images/icons/scroll-left-ghost.svg":[["scroll-left-ghost.08e858ba.svg","../images/icons/scroll-left-ghost.svg"],"../images/icons/scroll-left-ghost.svg"],"./../images/icons/question-mark.svg":[["question-mark.b9624f05.svg","../images/icons/question-mark.svg"],"../images/icons/question-mark.svg"],"./../images/icons/facebook-icon.svg":[["facebook-icon.3ac52770.svg","../images/icons/facebook-icon.svg"],"../images/icons/facebook-icon.svg"],"./../images/icons/instagram-icon.svg":[["instagram-icon.63158606.svg","../images/icons/instagram-icon.svg"],"../images/icons/instagram-icon.svg"],"./../images/icons/twitter-icon.svg":[["twitter-icon.285fab8a.svg","../images/icons/twitter-icon.svg"],"../images/icons/twitter-icon.svg"],"./../images/icons/google-icon.svg":[["google-icon.8872da3e.svg","../images/icons/google-icon.svg"],"../images/icons/google-icon.svg"],"./../images/icons/youtube-icon.svg":[["youtube-icon.fcd9594d.svg","../images/icons/youtube-icon.svg"],"../images/icons/youtube-icon.svg"],"./../images/icons/facebook-icon-blue.svg":[["facebook-icon-blue.ff3cce44.svg","../images/icons/facebook-icon-blue.svg"],"../images/icons/facebook-icon-blue.svg"],"./../images/icons/instagram-icon-blue.svg":[["instagram-icon-blue.169929b7.svg","../images/icons/instagram-icon-blue.svg"],"../images/icons/instagram-icon-blue.svg"],"./../images/icons/twitter-icon-blue.svg":[["twitter-icon-blue.8cdff31a.svg","../images/icons/twitter-icon-blue.svg"],"../images/icons/twitter-icon-blue.svg"],"./../images/icons/google-icon-blue.svg":[["google-icon-blue.f784e19a.svg","../images/icons/google-icon-blue.svg"],"../images/icons/google-icon-blue.svg"],"./../images/icons/youtube-icon-blue.svg":[["youtube-icon-blue.bf4db216.svg","../images/icons/youtube-icon-blue.svg"],"../images/icons/youtube-icon-blue.svg"],"./../images/icons/linkedin.svg":[["linkedin.fd8dd8e5.svg","../images/icons/linkedin.svg"],"../images/icons/linkedin.svg"],"./../images/icons/mail.svg":[["mail.3495ae31.svg","../images/icons/mail.svg"],"../images/icons/mail.svg"],"./../images/icons/call.svg":[["call.2d2a2d50.svg","../images/icons/call.svg"],"../images/icons/call.svg"],"./../images/icons/icon-quote.svg":[["icon-quote.99c8bc7b.svg","../images/icons/icon-quote.svg"],"../images/icons/icon-quote.svg"],"./../images/logos/kea.png":[["kea.42695924.png","../images/logos/kea.png"],"../images/logos/kea.png"],"./../images/logos/kea-white.png":[["kea-white.4378ca6e.png","../images/logos/kea-white.png"],"../images/logos/kea-white.png"],"./../images/icons/arrow-up-plain.svg":[["arrow-up-plain.79023230.svg","../images/icons/arrow-up-plain.svg"],"../images/icons/arrow-up-plain.svg"],"./../images/logos/Logotype-white.svg":[["Logotype-white.45c53672.svg","../images/logos/Logotype-white.svg"],"../images/logos/Logotype-white.svg"],"./../images/textures/rice-paper.png":[["rice-paper.34803ebf.png","../images/textures/rice-paper.png"],"../images/textures/rice-paper.png"],"./../images/logos/Logotype-green.svg":[["Logotype-green.6f61bdf3.svg","../images/logos/Logotype-green.svg"],"../images/logos/Logotype-green.svg"],"_css_loader":"../../node_modules/parcel-bundler/src/builtins/css-loader.js"}],"common.js":[function(require,module,exports) {
"use strict";

require("../scss/main.scss");
},{"../scss/main.scss":"../scss/main.scss"}],"../../node_modules/parcel-bundler/src/builtins/hmr-runtime.js":[function(require,module,exports) {
var global = arguments[3];
var OVERLAY_ID = '__parcel__error__overlay__';
var OldModule = module.bundle.Module;

function Module(moduleName) {
  OldModule.call(this, moduleName);
  this.hot = {
    data: module.bundle.hotData,
    _acceptCallbacks: [],
    _disposeCallbacks: [],
    accept: function (fn) {
      this._acceptCallbacks.push(fn || function () {});
    },
    dispose: function (fn) {
      this._disposeCallbacks.push(fn);
    }
  };
  module.bundle.hotData = null;
}

module.bundle.Module = Module;
var checkedAssets, assetsToAccept;
var parent = module.bundle.parent;

if ((!parent || !parent.isParcelRequire) && typeof WebSocket !== 'undefined') {
  var hostname = "" || location.hostname;
  var protocol = location.protocol === 'https:' ? 'wss' : 'ws';
  var ws = new WebSocket(protocol + '://' + hostname + ':' + "59327" + '/');

  ws.onmessage = function (event) {
    checkedAssets = {};
    assetsToAccept = [];
    var data = JSON.parse(event.data);

    if (data.type === 'update') {
      var handled = false;
      data.assets.forEach(function (asset) {
        if (!asset.isNew) {
          var didAccept = hmrAcceptCheck(global.parcelRequire, asset.id);

          if (didAccept) {
            handled = true;
          }
        }
      }); // Enable HMR for CSS by default.

      handled = handled || data.assets.every(function (asset) {
        return asset.type === 'css' && asset.generated.js;
      });

      if (handled) {
        console.clear();
        data.assets.forEach(function (asset) {
          hmrApply(global.parcelRequire, asset);
        });
        assetsToAccept.forEach(function (v) {
          hmrAcceptRun(v[0], v[1]);
        });
      } else if (location.reload) {
        // `location` global exists in a web worker context but lacks `.reload()` function.
        location.reload();
      }
    }

    if (data.type === 'reload') {
      ws.close();

      ws.onclose = function () {
        location.reload();
      };
    }

    if (data.type === 'error-resolved') {
      console.log('[parcel] ✨ Error resolved');
      removeErrorOverlay();
    }

    if (data.type === 'error') {
      console.error('[parcel] 🚨  ' + data.error.message + '\n' + data.error.stack);
      removeErrorOverlay();
      var overlay = createErrorOverlay(data);
      document.body.appendChild(overlay);
    }
  };
}

function removeErrorOverlay() {
  var overlay = document.getElementById(OVERLAY_ID);

  if (overlay) {
    overlay.remove();
  }
}

function createErrorOverlay(data) {
  var overlay = document.createElement('div');
  overlay.id = OVERLAY_ID; // html encode message and stack trace

  var message = document.createElement('div');
  var stackTrace = document.createElement('pre');
  message.innerText = data.error.message;
  stackTrace.innerText = data.error.stack;
  overlay.innerHTML = '<div style="background: black; font-size: 16px; color: white; position: fixed; height: 100%; width: 100%; top: 0px; left: 0px; padding: 30px; opacity: 0.85; font-family: Menlo, Consolas, monospace; z-index: 9999;">' + '<span style="background: red; padding: 2px 4px; border-radius: 2px;">ERROR</span>' + '<span style="top: 2px; margin-left: 5px; position: relative;">🚨</span>' + '<div style="font-size: 18px; font-weight: bold; margin-top: 20px;">' + message.innerHTML + '</div>' + '<pre>' + stackTrace.innerHTML + '</pre>' + '</div>';
  return overlay;
}

function getParents(bundle, id) {
  var modules = bundle.modules;

  if (!modules) {
    return [];
  }

  var parents = [];
  var k, d, dep;

  for (k in modules) {
    for (d in modules[k][1]) {
      dep = modules[k][1][d];

      if (dep === id || Array.isArray(dep) && dep[dep.length - 1] === id) {
        parents.push(k);
      }
    }
  }

  if (bundle.parent) {
    parents = parents.concat(getParents(bundle.parent, id));
  }

  return parents;
}

function hmrApply(bundle, asset) {
  var modules = bundle.modules;

  if (!modules) {
    return;
  }

  if (modules[asset.id] || !bundle.parent) {
    var fn = new Function('require', 'module', 'exports', asset.generated.js);
    asset.isNew = !modules[asset.id];
    modules[asset.id] = [fn, asset.deps];
  } else if (bundle.parent) {
    hmrApply(bundle.parent, asset);
  }
}

function hmrAcceptCheck(bundle, id) {
  var modules = bundle.modules;

  if (!modules) {
    return;
  }

  if (!modules[id] && bundle.parent) {
    return hmrAcceptCheck(bundle.parent, id);
  }

  if (checkedAssets[id]) {
    return;
  }

  checkedAssets[id] = true;
  var cached = bundle.cache[id];
  assetsToAccept.push([bundle, id]);

  if (cached && cached.hot && cached.hot._acceptCallbacks.length) {
    return true;
  }

  return getParents(global.parcelRequire, id).some(function (id) {
    return hmrAcceptCheck(global.parcelRequire, id);
  });
}

function hmrAcceptRun(bundle, id) {
  var cached = bundle.cache[id];
  bundle.hotData = {};

  if (cached) {
    cached.hot.data = bundle.hotData;
  }

  if (cached && cached.hot && cached.hot._disposeCallbacks.length) {
    cached.hot._disposeCallbacks.forEach(function (cb) {
      cb(bundle.hotData);
    });
  }

  delete bundle.cache[id];
  bundle(id);
  cached = bundle.cache[id];

  if (cached && cached.hot && cached.hot._acceptCallbacks.length) {
    cached.hot._acceptCallbacks.forEach(function (cb) {
      cb();
    });

    return true;
  }
}
},{}]},{},["../../node_modules/parcel-bundler/src/builtins/hmr-runtime.js","common.js"], null)
//# sourceMappingURL=/dist/common.js.map