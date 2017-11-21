var ___sogouNamespaceName = "StarNamespace";
(function () {
    var c = ___sogouNamespaceName;
    var g = window, a = 0, f = false, b = false;
    while ((g != window.top || g != g.parent) && a < 10) {
        f = true;
        try {
            g.parent.location.toString()
        } catch (e) {
            b = true;
            break
        }
        a++;
        g = g.parent
    }
    if (a >= 10) {
        b = true
    }
    var d = function (h, j, i) {
        h.baseName = c;
        h.isInIframe = j;
        h.isCrossDomain = i;
        h.needInitTop = j && !i;
        h.buildInObject = {
            "[object Function]": 1,
            "[object RegExp]": 1,
            "[object Date]": 1,
            "[object Error]": 1,
            "[object Window]": 1
        };
        h.clone = function (o) {
            var l = o, m, k;
            if (!o || o instanceof Number || o instanceof String || o instanceof Boolean) {
                return l
            } else {
                if (o instanceof Array) {
                    l = [];
                    var n = 0;
                    for (m = 0, k = o.length; m < k; m++) {
                        l[n++] = this.clone(o[m])
                    }
                } else {
                    if ("object" === typeof o) {
                        if (this.buildInObject[Object.prototype.toString.call(o)]) {
                            return l
                        }
                        l = {};
                        for (m in o) {
                            if (o.hasOwnProperty(m)) {
                                l[m] = this.clone(o[m])
                            }
                        }
                    }
                }
            }
            return l
        };
        h.create = function (m, p) {
            var l = Array.prototype.slice.call(arguments, 0);
            l.shift();
            var n = function (q) {
                this.initialize = this.initialize || function () {
                    };
                this.initializeDOM = this.initializeDOM || function () {
                    };
                this.initializeEvent = this.initializeEvent || function () {
                    };
                this.initialize.apply(this, q);
                this.initializeDOM.apply(this, q);
                this.initializeEvent.apply(this, q)
            };
            n.prototype = m;
            var k = new n(l);
            for (var o in m) {
                if (k[o] && typeof k[o] === "object" && k[o].modifier && k[o].modifier.indexOf("dynamic") > -1) {
                    k[o] = this.clone(k[o])
                }
            }
            k.instances = null;
            m.instances = m.instances || [];
            m.instances.push(k);
            return k
        };
        h.registerMethod = function (o, k) {
            var p = {};
            var l = {};
            var s, q, r;
            for (q in k) {
                s = k[q];
                if (!q || !s) {
                    continue
                }
                if (typeof s === "object" && s.modifier && s.modifier === "dynamic") {
                    this.registerMethod(o[q], s)
                } else {
                    if (typeof s === "function") {
                        p[q] = s
                    } else {
                        l[q] = s
                    }
                }
            }
            for (q in p) {
                s = p[q];
                if (q && s) {
                    o[q] = s
                }
            }
            if (o.instances && o.instances.length && o.instances.length > 0) {
                for (var m = 0, n = o.instances.length; m < n; m++) {
                    r = o.instances[m];
                    this.registerMethod(r, k)
                }
            }
        };
        h.registerObj = function (m, o) {
            var l = Array.prototype.slice.call(arguments, 0);
            l.shift();
            var n = function (p) {
                this.register = this.register || function () {
                    };
                this.register.apply(this, p)
            };
            n.prototype = m;
            n.prototype.instances = null;
            var k = new n(l);
            return k
        };
        h.registerNamespaceByWin = function (m, o) {
            var o = m.win = o || window;
            var l = m.fullName.replace("$baseName", this.baseName);
            namespaceNames = l.split(".");
            var p = namespaceNames.length;
            var s = o;
            var r;
            for (var n = 0; n < p - 1; n++) {
                var k = namespaceNames[n];
                if (s == o) {
                    s[k] = o[k] = o[k] || {};
                    r = k;
                    m.baseName = r
                } else {
                    s[k] = s[k] || {}
                }
                s = s[k]
            }
            var q = s[namespaceNames[p - 1]] || {};
            if (q.fullName && q.version) {
                this.registerMethod(q, m)
            } else {
                q = this.registerObj(m);
                q.instances = null;
                s[namespaceNames[p - 1]] = q
            }
        };
        h.registerNamespace = function (k) {
            if (!k || !k.fullName || !k.version) {
                return
            }
            this.registerNamespaceByWin(k, window);
            if (this.needInitTop) {
                this.registerNamespaceByWin(k, window.top)
            }
        };
        h.registerClass = h.registerNamespace;
        h.using = function (m, p) {
            var k;
            if (!p && this.isInIframe && !this.isCrossDomain && top && typeof top === "object" && top.document && "setInterval" in top) {
                p = top
            } else {
                p = p || window
            }
            m = m.replace("$baseName", this.baseName);
            var l = m.split(".");
            k = p[l[0]];
            for (var n = 1, o = l.length; n < o; n++) {
                if (k && k[l[n]]) {
                    k = k[l[n]]
                } else {
                    k = null
                }
            }
            return k
        }
    };
    window[c] = window[c] || {};
    d(window[c], f, b);
    if (f && !b) {
        window.top[c] = window.top[c] || {};
        d(window.top[c], f, b)
    }
})();
(function (b) {
    var a = {
        fullName: "$baseName.Utility", version: "1.0.0", register: function () {
            this.browser = this.browser || {};
            if (/msie (\d+\.\d)/i.test(navigator.userAgent)) {
                this.browser.ie = document.documentMode || +RegExp["\x241"]
            }
            if (/opera\/(\d+\.\d)/i.test(navigator.userAgent)) {
                this.browser.opera = +RegExp["\x241"]
            }
            if (/firefox\/(\d+\.\d)/i.test(navigator.userAgent)) {
                this.browser.firefox = +RegExp["\x241"]
            }
            if (/(\d+\.\d)?(?:\.\d)?\s+safari\/?(\d+\.\d+)?/i.test(navigator.userAgent) && !/chrome/i.test(navigator.userAgent)) {
                this.browser.safari = +(RegExp["\x241"] || RegExp["\x242"])
            }
            if (/chrome\/(\d+\.\d)/i.test(navigator.userAgent)) {
                this.browser.chrome = +RegExp["\x241"]
            }
            try {
                if (/(\d+\.\d)/.test(external.max_version)) {
                    this.browser.maxthon = +RegExp["\x241"]
                }
            } catch (c) {
            }
            this.browser.isWebkit = /webkit/i.test(navigator.userAgent);
            this.browser.isGecko = /gecko/i.test(navigator.userAgent) && !/like gecko/i.test(navigator.userAgent);
            this.browser.isStrict = document.compatMode == "CSS1Compat"
        }, browser: {}, isWindow: function (e) {
            var c = false;
            try {
                if (e && typeof e === "object" && e.document && "setInterval" in e) {
                    c = true
                }
            } catch (d) {
                c = false
            }
            return c
        }, isInIframe: function (c) {
            c = c || window;
            return c != window.top && c != c.parent
        }, isInCrossDomainIframe: function (g, d) {
            var c = false;
            g = g || window;
            d = d || window.top;
            parentWin = g.parent;
            var f = 0;
            while ((g != d || g != g.parent) && f < 10) {
                f++;
                if (this.isWindow(g) && this.isWindow(g.parent)) {
                    try {
                        g.parent.location.toString()
                    } catch (e) {
                        c = true;
                        break
                    }
                } else {
                    c = true;
                    break
                }
                g = g.parent
            }
            if (f >= 10) {
                c = true
            }
            return c
        }, g: function (d, c) {
            c = c || window;
            if ("string" === typeof d || d instanceof String) {
                return c.document.getElementById(d)
            } else {
                if (d && d.nodeName && (d.nodeType == 1 || d.nodeType == 9)) {
                    return d
                }
            }
            return d
        }, sendRequestViaImage: function (d, e) {
            var c = new Image();
            var f = "cx_log_" + Math.floor(Math.random() * 2147483648).toString(36);
            e = e || window;
            e[f] = c;
            c.onload = c.onerror = c.onabort = function () {
                c.onload = c.onerror = c.onabort = null;
                e[f] = null;
                c = null
            };
            c.src = d
        }, getDocument: function (c) {
            if (!c) {
                return document
            }
            c = this.g(c);
            return c.nodeType == 9 ? c : c.ownerDocument || c.document
        }, getWindow: function (c) {
            c = this.g(c);
            var d = this.getDocument(c);
            return d.parentWindow || d.defaultView || null
        }, getTopWindow: function (c) {
            c = c || window;
            if (this.isInIframe(c) && !this.isInCrossDomainIframe(c, c.top) && this.isWindow(c.top)) {
                return c.top
            }
            return c
        }, bind: function (c, d, e) {
            c = this.g(c);
            d = d.replace(/^on/i, "").toLowerCase();
            if (c.addEventListener) {
                c.addEventListener(d, e, false)
            } else {
                if (c.attachEvent) {
                    c.attachEvent("on" + d, e)
                }
            }
            return c
        }, proxy: function (d, c) {
            var f = d;
            var e = c;
            return function () {
                return f.apply(e || {}, arguments)
            }
        }, getStyle: function (e, d) {
            var c;
            e = this.g(e);
            var g = this.getDocument(e);
            var h = "";
            if (d.indexOf("-") > -1) {
                h = d.replace(/[-_][^-_]{1}/g, function (i) {
                    return i.charAt(1).toUpperCase()
                })
            } else {
                h = d.replace(/[A-Z]{1}/g, function (i) {
                    return "-" + i.charAt(0).toLowerCase()
                })
            }
            var f;
            if (g && g.defaultView && g.defaultView.getComputedStyle) {
                f = g.defaultView.getComputedStyle(e, null);
                if (f) {
                    c = f.getPropertyValue(d)
                }
                if (typeof c !== "boolean" && !c) {
                    c = f.getPropertyValue(h)
                }
            } else {
                if (e.currentStyle) {
                    f = e.currentStyle;
                    if (f) {
                        c = f[d]
                    }
                    if (typeof c !== "boolean" && !c) {
                        c = f[h]
                    }
                }
            }
            return c
        }, getPositionCore: function (c) {
            c = this.g(c);
            var k = this.getDocument(c), f = this.browser, d = f.isGecko > 0 && k.getBoxObjectFor && this.getStyle(c, "position") == "absolute" && (c.style.top === "" || c.style.left === ""), i = {
                left: 0,
                top: 0
            }, h = (f.ie && !f.isStrict) ? k.body : k.documentElement, l, e;
            if (c == h) {
                return i
            }
            if (c.getBoundingClientRect) {
                e = c.getBoundingClientRect();
                i.left = Math.floor(e.left) + Math.max(k.documentElement.scrollLeft, k.body.scrollLeft);
                i.top = Math.floor(e.top) + Math.max(k.documentElement.scrollTop, k.body.scrollTop);
                i.left -= k.documentElement.clientLeft;
                i.top -= k.documentElement.clientTop;
                var j = k.body, m = parseInt(this.getStyle(j, "borderLeftWidth")), g = parseInt(this.getStyle(j, "borderTopWidth"));
                if (f.ie && !f.isStrict) {
                    i.left -= isNaN(m) ? 2 : m;
                    i.top -= isNaN(g) ? 2 : g
                }
            } else {
                l = c;
                do {
                    i.left += l.offsetLeft;
                    i.top += l.offsetTop;
                    if (f.isWebkit > 0 && this.getStyle(l, "position") == "fixed") {
                        i.left += k.body.scrollLeft;
                        i.top += k.body.scrollTop;
                        break
                    }
                    l = l.offsetParent
                } while (l && l != c);
                if (f.opera > 0 || (f.isWebkit > 0 && this.getStyle(c, "position") == "absolute")) {
                    i.top -= k.body.offsetTop
                }
                l = c.offsetParent;
                while (l && l != k.body) {
                    i.left -= l.scrollLeft;
                    if (!f.opera || l.tagName != "TR") {
                        i.top -= l.scrollTop
                    }
                    l = l.offsetParent
                }
            }
            return i
        }, getPosition: function (h, g) {
            g = g || window;
            var e = this.g(h, g);
            if (!e) {
                return
            }
            var c = this.getPositionCore(e);
            var d;
            var f = 10;
            count = 0;
            while (g != g.parent && count < f) {
                count++;
                d = {top: 0, left: 0};
                if (!this.isInCrossDomainIframe(g, g.parent) && g.frameElement) {
                    d = this.getPositionCore(g.frameElement)
                } else {
                    break
                }
                c.left += d.left;
                c.top += d.top;
                g = g.parent
            }
            return c
        }, getOuterWidth: function (e, d) {
            e = this.g(e);
            d = d || false;
            var c = e.offsetWidth;
            if (d) {
                var g = this.getStyle(e, "marginLeft").toString().toLowerCase().replace("px", "").replace("auto", "0");
                var f = this.getStyle(e, "marginRight").toString().toLowerCase().replace("px", "").replace("auto", "0");
                c = c + parseInt(g || 0) + parseInt(f || 0)
            }
            return c
        }, getOuterHeight: function (e, d) {
            e = this.g(e);
            d = d || false;
            var c = e.offsetHeight;
            if (d) {
                var f = this.getStyle(e, "marginTop").toString().toLowerCase().replace("px", "").replace("auto", "0");
                var g = this.getStyle(e, "marginBottom").toString().toLowerCase().replace("px", "").replace("auto", "0");
                c = c + parseInt(f || 0) + parseInt(g || 0)
            }
            return c
        }, getTopIframe: function (f) {
            var c = this.g(f);
            var d = this.getWindow(c);
            var e = 0;
            if (this.isInIframe(window) && !this.isInCrossDomainIframe(window)) {
                while (d.parent != window.top && e < 10) {
                    e++;
                    d = d.parent
                }
                if (e < 10) {
                    c = d.frameElement || c
                }
            }
            return c
        }, getOpacityInWin: function (k) {
            var j = this.g(k);
            var h = this.getWindow(j);
            var c = 100;
            var f = j;
            var i;
            try {
                while (f && f.tagName) {
                    i = 100;
                    if (this.browser.ie) {
                        if (this.browser.ie > 5) {
                            try {
                                i = f.filters.alpha.opacity || 100
                            } catch (g) {
                            }
                        }
                        c = c > i ? i : c
                    } else {
                        try {
                            i = (h.getComputedStyle(f, null).opacity || 1) * 100
                        } catch (g) {
                        }
                        c = c * (i / 100)
                    }
                    f = f.parentNode
                }
            } catch (d) {
            }
            return c || 100
        }, getOpacity: function (i) {
            var h = this.g(i);
            var g = this.getWindow(h);
            var c = this.getOpacityInWin(h);
            var d = 100;
            var e = 0, f = 10;
            while (this.isInIframe(g)) {
                e++;
                if (!this.isInCrossDomainIframe(g, g.parent)) {
                    d = 100;
                    if (g.frameElement) {
                        d = this.getOpacityInWin(g.frameElement)
                    }
                    c = c * (d / 100)
                } else {
                    break
                }
                g = g.parent
            }
            return c
        }, dateToString: function (d, c) {
            var g = {
                "M+": d.getMonth() + 1,
                "d+": d.getDate(),
                "h+": d.getHours() % 12 == 0 ? 12 : d.getHours() % 12,
                "H+": d.getHours(),
                "m+": d.getMinutes(),
                "s+": d.getSeconds(),
                "q+": Math.floor((d.getMonth() + 3) / 3),
                S: d.getMilliseconds()
            };
            var f = {
                "0": "\u65e5",
                "1": "\u4e00",
                "2": "\u4e8c",
                "3": "\u4e09",
                "4": "\u56db",
                "5": "\u4e94",
                "6": "\u516d"
            };
            if (/(y+)/.test(c)) {
                c = c.replace(RegExp.$1, (d.getFullYear() + "").substr(4 - RegExp.$1.length))
            }
            if (/(E+)/.test(c)) {
                c = c.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "\u661f\u671f" : "\u5468") : "") + f[d.getDay() + ""])
            }
            for (var e in g) {
                if (new RegExp("(" + e + ")").test(c)) {
                    c = c.replace(RegExp.$1, (RegExp.$1.length == 1) ? (g[e]) : (("00" + g[e]).substr(("" + g[e]).length)))
                }
            }
            return c
        }, param: function (h, i) {
            var c = new Array(), g, f, d;
            for (var e in h) {
                d = true;
                if (i) {
                    g = i[e] ? i[e] : e;
                    d = i[e] ? true : false
                }
                if (!d) {
                    continue
                }
                var f = h[e];
                switch (typeof f) {
                    case"string":
                    case"number":
                        c.push(g + "=" + f.toString());
                        break;
                    case"boolean":
                        c.push(g + "=" + (f ? "1" : "0"));
                        break;
                    case"object":
                        if (f instanceof Date) {
                            c.push(g + "=" + this.dateToString(f, "yyyyMMddhhmmssS"))
                        }
                        break;
                    default:
                        break
                }
            }
            return c.join("&")
        }, getLength: function (e) {
            var c = 0;
            if (typeof e === "object") {
                if (e instanceof Array) {
                    c = e.length
                } else {
                    var d;
                    for (d in e) {
                        if (d) {
                            c++
                        }
                    }
                }
            }
            return c
        }, md5: function (s) {
            function N(d, c) {
                return (d << c) | (d >>> (32 - c))
            }

            function M(F, d) {
                var H, c, x, G, k;
                x = (F & 2147483648);
                G = (d & 2147483648);
                H = (F & 1073741824);
                c = (d & 1073741824);
                k = (F & 1073741823) + (d & 1073741823);
                if (H & c) {
                    return (k ^ 2147483648 ^ x ^ G)
                }
                if (H | c) {
                    if (k & 1073741824) {
                        return (k ^ 3221225472 ^ x ^ G)
                    } else {
                        return (k ^ 1073741824 ^ x ^ G)
                    }
                } else {
                    return (k ^ x ^ G)
                }
            }

            function r(c, k, d) {
                return (c & k) | ((~c) & d)
            }

            function q(c, k, d) {
                return (c & d) | (k & (~d))
            }

            function p(c, k, d) {
                return (c ^ k ^ d)
            }

            function n(c, k, d) {
                return (k ^ (c | (~d)))
            }

            function u(G, F, ac, ab, k, H, I) {
                G = M(G, M(M(r(F, ac, ab), k), I));
                return M(N(G, H), F)
            }

            function g(G, F, ac, ab, k, H, I) {
                G = M(G, M(M(q(F, ac, ab), k), I));
                return M(N(G, H), F)
            }

            function J(G, F, ac, ab, k, H, I) {
                G = M(G, M(M(p(F, ac, ab), k), I));
                return M(N(G, H), F)
            }

            function t(G, F, ac, ab, k, H, I) {
                G = M(G, M(M(n(F, ac, ab), k), I));
                return M(N(G, H), F)
            }

            function e(F) {
                var I;
                var x = F.length;
                var k = x + 8;
                var d = (k - (k % 64)) / 64;
                var H = (d + 1) * 16;
                var ab = Array(H - 1);
                var c = 0;
                var G = 0;
                while (G < x) {
                    I = (G - (G % 4)) / 4;
                    c = (G % 4) * 8;
                    ab[I] = (ab[I] | (F.charCodeAt(G) << c));
                    G++
                }
                I = (G - (G % 4)) / 4;
                c = (G % 4) * 8;
                ab[I] = ab[I] | (128 << c);
                ab[H - 2] = x << 3;
                ab[H - 1] = x >>> 29;
                return ab
            }

            function D(k) {
                var d = "", x = "", F, c;
                for (c = 0; c <= 3; c++) {
                    F = (k >>> (c * 8)) & 255;
                    x = "0" + F.toString(16);
                    d = d + x.substr(x.length - 2, 2)
                }
                return d
            }

            function L(k) {
                k = k.replace(/\r\n/g, "\n");
                var d = "";
                for (var F = 0; F < k.length; F++) {
                    var x = k.charCodeAt(F);
                    if (x < 128) {
                        d += String.fromCharCode(x)
                    } else {
                        if ((x > 127) && (x < 2048)) {
                            d += String.fromCharCode((x >> 6) | 192);
                            d += String.fromCharCode((x & 63) | 128)
                        } else {
                            d += String.fromCharCode((x >> 12) | 224);
                            d += String.fromCharCode(((x >> 6) & 63) | 128);
                            d += String.fromCharCode((x & 63) | 128)
                        }
                    }
                }
                return d
            }

            var E = Array();
            var R, i, K, v, h, aa, Z, Y, X;
            var U = 7, S = 12, P = 17, O = 22;
            var B = 5, A = 9, z = 14, y = 20;
            var o = 4, m = 11, l = 16, j = 23;
            var W = 6, V = 10, T = 15, Q = 21;
            s = L(s);
            E = e(s);
            aa = 1732584193;
            Z = 4023233417;
            Y = 2562383102;
            X = 271733878;
            for (R = 0; R < E.length; R += 16) {
                i = aa;
                K = Z;
                v = Y;
                h = X;
                aa = u(aa, Z, Y, X, E[R + 0], U, 3614090360);
                X = u(X, aa, Z, Y, E[R + 1], S, 3905402710);
                Y = u(Y, X, aa, Z, E[R + 2], P, 606105819);
                Z = u(Z, Y, X, aa, E[R + 3], O, 3250441966);
                aa = u(aa, Z, Y, X, E[R + 4], U, 4118548399);
                X = u(X, aa, Z, Y, E[R + 5], S, 1200080426);
                Y = u(Y, X, aa, Z, E[R + 6], P, 2821735955);
                Z = u(Z, Y, X, aa, E[R + 7], O, 4249261313);
                aa = u(aa, Z, Y, X, E[R + 8], U, 1770035416);
                X = u(X, aa, Z, Y, E[R + 9], S, 2336552879);
                Y = u(Y, X, aa, Z, E[R + 10], P, 4294925233);
                Z = u(Z, Y, X, aa, E[R + 11], O, 2304563134);
                aa = u(aa, Z, Y, X, E[R + 12], U, 1804603682);
                X = u(X, aa, Z, Y, E[R + 13], S, 4254626195);
                Y = u(Y, X, aa, Z, E[R + 14], P, 2792965006);
                Z = u(Z, Y, X, aa, E[R + 15], O, 1236535329);
                aa = g(aa, Z, Y, X, E[R + 1], B, 4129170786);
                X = g(X, aa, Z, Y, E[R + 6], A, 3225465664);
                Y = g(Y, X, aa, Z, E[R + 11], z, 643717713);
                Z = g(Z, Y, X, aa, E[R + 0], y, 3921069994);
                aa = g(aa, Z, Y, X, E[R + 5], B, 3593408605);
                X = g(X, aa, Z, Y, E[R + 10], A, 38016083);
                Y = g(Y, X, aa, Z, E[R + 15], z, 3634488961);
                Z = g(Z, Y, X, aa, E[R + 4], y, 3889429448);
                aa = g(aa, Z, Y, X, E[R + 9], B, 568446438);
                X = g(X, aa, Z, Y, E[R + 14], A, 3275163606);
                Y = g(Y, X, aa, Z, E[R + 3], z, 4107603335);
                Z = g(Z, Y, X, aa, E[R + 8], y, 1163531501);
                aa = g(aa, Z, Y, X, E[R + 13], B, 2850285829);
                X = g(X, aa, Z, Y, E[R + 2], A, 4243563512);
                Y = g(Y, X, aa, Z, E[R + 7], z, 1735328473);
                Z = g(Z, Y, X, aa, E[R + 12], y, 2368359562);
                aa = J(aa, Z, Y, X, E[R + 5], o, 4294588738);
                X = J(X, aa, Z, Y, E[R + 8], m, 2272392833);
                Y = J(Y, X, aa, Z, E[R + 11], l, 1839030562);
                Z = J(Z, Y, X, aa, E[R + 14], j, 4259657740);
                aa = J(aa, Z, Y, X, E[R + 1], o, 2763975236);
                X = J(X, aa, Z, Y, E[R + 4], m, 1272893353);
                Y = J(Y, X, aa, Z, E[R + 7], l, 4139469664);
                Z = J(Z, Y, X, aa, E[R + 10], j, 3200236656);
                aa = J(aa, Z, Y, X, E[R + 13], o, 681279174);
                X = J(X, aa, Z, Y, E[R + 0], m, 3936430074);
                Y = J(Y, X, aa, Z, E[R + 3], l, 3572445317);
                Z = J(Z, Y, X, aa, E[R + 6], j, 76029189);
                aa = J(aa, Z, Y, X, E[R + 9], o, 3654602809);
                X = J(X, aa, Z, Y, E[R + 12], m, 3873151461);
                Y = J(Y, X, aa, Z, E[R + 15], l, 530742520);
                Z = J(Z, Y, X, aa, E[R + 2], j, 3299628645);
                aa = t(aa, Z, Y, X, E[R + 0], W, 4096336452);
                X = t(X, aa, Z, Y, E[R + 7], V, 1126891415);
                Y = t(Y, X, aa, Z, E[R + 14], T, 2878612391);
                Z = t(Z, Y, X, aa, E[R + 5], Q, 4237533241);
                aa = t(aa, Z, Y, X, E[R + 12], W, 1700485571);
                X = t(X, aa, Z, Y, E[R + 3], V, 2399980690);
                Y = t(Y, X, aa, Z, E[R + 10], T, 4293915773);
                Z = t(Z, Y, X, aa, E[R + 1], Q, 2240044497);
                aa = t(aa, Z, Y, X, E[R + 8], W, 1873313359);
                X = t(X, aa, Z, Y, E[R + 15], V, 4264355552);
                Y = t(Y, X, aa, Z, E[R + 6], T, 2734768916);
                Z = t(Z, Y, X, aa, E[R + 13], Q, 1309151649);
                aa = t(aa, Z, Y, X, E[R + 4], W, 4149444226);
                X = t(X, aa, Z, Y, E[R + 11], V, 3174756917);
                Y = t(Y, X, aa, Z, E[R + 2], T, 718787259);
                Z = t(Z, Y, X, aa, E[R + 9], Q, 3951481745);
                aa = M(aa, i);
                Z = M(Z, K);
                Y = M(Y, v);
                X = M(X, h)
            }
            var w = function (x) {
                var c = x;
                for (var d = 0, k = 8 - x.length; d < k; d++) {
                    c = "0" + c
                }
                return c
            };
            var C = ((parseInt("0x" + D(aa), 16) + parseInt("0x" + D(Z), 16)) % 4294967296).toString(16);
            var f = ((parseInt("0x" + D(Y), 16) + parseInt("0x" + D(X), 16)) % 4294967296).toString(16);
            if (C.length < 8) {
                C = w(C)
            }
            if (f.length < 8) {
                f = w(f)
            }
            return C + f
        }, getScrollWidth: function (d) {
            try {
                d = d || window;
                if (d.document.compatMode === "BackCompat") {
                    return d.document.body.scrollWidth
                } else {
                    return d.document.documentElement.scrollWidth
                }
            } catch (c) {
                return 0
            }
        }, getScrollHeight: function (d) {
            try {
                d = d || window;
                if (d.document.compatMode === "BackCompat") {
                    return d.document.body.scrollHeight
                } else {
                    return d.document.documentElement.scrollHeight
                }
            } catch (c) {
                return 0
            }
        }, getClientWidth: function (d) {
            try {
                d = d || window;
                if (d.document.compatMode === "BackCompat") {
                    return d.document.body.clientWidth
                } else {
                    return d.document.documentElement.clientWidth
                }
            } catch (c) {
                return 0
            }
        }, getClientHeight: function (d) {
            try {
                d = d || window;
                if (d.document.compatMode === "BackCompat") {
                    return d.document.body.clientHeight
                } else {
                    return d.document.documentElement.clientHeight
                }
            } catch (c) {
                return 0
            }
        }, getScrollTop: function (c) {
            c = c || window;
            var e = c.document;
            return c.pageYOffset || e.documentElement.scrollTop || e.body.scrollTop
        }, getScrollLeft: function (c) {
            c = c || window;
            var e = c.document;
            return c.pageXOffset || e.documentElement.scrollLeft || e.body.scrollLeft
        }, escapeToEncode: function (d) {
            var c = d || "";
            if (c) {
                c = c.replace(/%u[\d|\w]{4}/g, function (e) {
                    return encodeURIComponent(unescape(e))
                })
            }
            return c
        }, template: function (e, d) {
            var c = /{(.*?)}/g;
            return e.replace(c, function (h, g, f, i) {
                return d[g] || ""
            })
        }, extend: function (e, c) {
            for (var d in c) {
                if (c.hasOwnProperty(d)) {
                    e[d] = c[d]
                }
            }
            return e
        }, log: function (f, d) {
            d = typeof d === "undefined" ? true : false;
            if (!this.logMsg) {
                this.logMsg = document.getElementById("baiduCproLogMsg");
                if (!this.logMsg) {
                    return
                }
            }
            var c = new Array();
            if (typeof(f) === "object") {
                for (var e in f) {
                    if (e !== "analysisUrl") {
                        c.push(e + ":" + f[e])
                    }
                }
            } else {
                c.push("" + f)
            }
            this.logMsg.innerHTML = d ? this.logMsg.innerHTML : "";
            this.logMsg.innerHTML += c.join("<br/>") + "<br/>"
        }, getCookieRaw: function (d, h) {
            var c;
            var h = h || window;
            var g = h.document;
            var e = new RegExp("(^| )" + d + "=([^;]*)(;|\x24)");
            var f = e.exec(g.cookie);
            if (f) {
                c = f[2]
            }
            return c
        }, setCookieRaw: function (e, f, d) {
            d = d || {};
            var c = d.expires;
            if ("number" == typeof d.expires) {
                c = new Date();
                c.setTime(c.getTime() + d.expires)
            }
            document.cookie = e + "=" + f + (d.path ? "; path=" + d.path : "") + (c ? "; expires=" + c.toGMTString() : "") + (d.domain ? "; domain=" + d.domain : "") + (d.secure ? "; secure" : "")
        }, jsonToObj: function (c) {
            return (new Function("return " + c))()
        }, getUrlQueryValue: function (d, e) {
            var f = new RegExp("(^|&|\\?|#)" + e + "=([^&]*)(&|\x24)", "");
            var c = d.match(f);
            if (c) {
                return c[2]
            }
            return null
        }, ready: function (h, d, g) {
            g = g || this.win || window;
            var f = g.document;
            d = d || 0;
            this.domReadyMonitorRunTimes = 0;
            this.readyFuncArray = this.readyFuncArray || [];
            this.readyFuncArray.push({func: h, delay: d, done: false});
            var c = this.proxy(function () {
                var n = false;
                this.domReadyMonitorRunTimes++;
                var r = false;
                try {
                    if (g.frameElement) {
                        r = true
                    }
                } catch (s) {
                    r = true
                }
                if (this.browser.ie && this.browser.ie < 9 && !r) {
                    try {
                        f.documentElement.doScroll("left");
                        n = true
                    } catch (q) {
                    }
                } else {
                    if (f.readyState === "complete" || this.domContentLoaded) {
                        n = true
                    } else {
                        if (this.domReadyMonitorRunTimes > 300000) {
                            if (this.domReadyMonitorId) {
                                g.clearInterval(this.domReadyMonitorId);
                                this.domReadyMonitorId = null
                            }
                            return
                        }
                    }
                }
                if (n) {
                    try {
                        if (this.readyFuncArray && this.readyFuncArray.length) {
                            for (var k = 0, m = this.readyFuncArray.length; k < m; k++) {
                                var l = this.readyFuncArray[k];
                                if (!l || !l.func || l.done) {
                                    continue
                                }
                                if (!l.delay) {
                                    l.done = true;
                                    l.func()
                                } else {
                                    l.done = true;
                                    g.setTimeout(l.func, l.delay)
                                }
                            }
                        }
                    } catch (j) {
                        throw j
                    } finally {
                        if (this.domReadyMonitorId) {
                            g.clearInterval(this.domReadyMonitorId);
                            this.domReadyMonitorId = null
                        }
                    }
                }
            }, this);
            var e = this.proxy(function () {
                this.domContentLoaded = true;
                c()
            }, this);
            if (!this.domReadyMonitorStarted) {
                this.domReadyMonitorStarted = true;
                this.domReadyMonitorId = g.setInterval(c, 50);
                if (f.addEventListener) {
                    f.addEventListener("DOMContentLoaded", e, false);
                    g.addEventListener("load", e, false)
                } else {
                    if (f.attachEvent) {
                        g.attachEvent("onload", e, false)
                    }
                }
            }
        }, canFixed: function () {
            var c = true;
            if (this.browser.ie && (this.browser.ie < 7 || document.compatMode === "BackCompat")) {
                c = false
            }
            return c
        }, getPara: function (k) {
            var j = {};
            if (k && typeof k == "string" && k.indexOf("?") > -1) {
                var f = k.split("?")[1].split("&");
                for (var g = 0, c = f.length; g < c; g++) {
                    var d = f[g].split("=");
                    var e = d[0];
                    var h = d[1];
                    j[e] = h
                }
            }
            return j
        }, ajaxLoad: function (e, j, h, d, i, g) {
            if (!e) {
                return null
            }
            h = h || "";
            if (typeof(d) !== "boolean") {
                d = false
            }
            if (!d) {
                if (e.indexOf("?") < 0) {
                    e += "?"
                }
                e += "&_nocache_=" + Math.random()
            }
            var c = ["GET", "POST", "get", "post"];
            if (c.indexOf(i) < 0) {
                i = "GET"
            }
            if (typeof g !== "boolean") {
                g = true
            }
            var f = null;
            if (window.XMLHttpRequest) {
                f = new XMLHttpRequest()
            } else {
                f = new ActiveXObject("Microsoft.XMLHTTP")
            }
            if (f) {
                f.onreadystatechange = function () {
                    if (f.readyState == 4) {
                        if (typeof(j) == "function") {
                            j(f.responseText, f.status, f)
                        }
                    }
                };
                f.open(i, e, g);
                f.send(h)
            }
        }, getOffset: function (g, h) {
            if (!g || typeof(g) !== "object") {
                return null
            }
            h = h || window;
            var k = h.document;
            var j = g.getBoundingClientRect();
            var e = {
                top: j.top,
                right: j.right,
                bottom: j.bottom,
                left: j.left,
                width: j.right - j.left,
                height: j.bottom - j.top
            };
            var f = k.documentElement.clientTop || k.body.clientTop || 0;
            var i = k.documentElement.clientLeft || k.body.clientLeft || 0;
            var c = h.pageYOffset || k.documentElement.scrollTop || k.body.scrollTop || 0;
            var d = h.pageXOffset || k.documentElement.scrollLeft || k.body.scrollLeft || 0;
            e.top = e.top + c - f;
            e.bottom = e.bottom + c - f;
            e.left = e.left + d - i;
            e.right = e.right + d - i;
            return e
        }
    };
    b.registerNamespace(a)
})(window[___sogouNamespaceName]);
(function (a) {
    var b = {
        fullName: "$baseName.Business",
        version: "1.0.0",
        register: function () {
            this.G = a.using("$baseName", this.win);
            this.U = a.using("$baseName.Utility", this.win)
        },
        randomArray: [],
        clientTree: {},
        displayCounter: 1,
        displayTypeCounter: {},
        adsArray: [],
        adsWrapStore: {},
        winFocused: true,
        starServiceUrl: "http://inte.sogou.com/ct",
        starServiceUrlLu: "http://lu.sogou.com/kwd",
        iframeIdPrefix: "starIframe",
        iframeWrapperIdPrefix: "starIframe_wrapper_",
        isAsyn: false,
        getSlotDataFromUnion: function (e, i, g) {
            if (!e || !i || !window[i]) {
                return null
            }
            if (e instanceof Array) {
                e = e.join(",")
            }
            var h = "http://pos.sogou.com/ecom?di={slotId}&tm=SOGOU_STAR_SETJSONADSLOT&fn={callbackName}&baidu_id={baiduId}";
            var c = this.U.getCookieRaw("BAIDUID") || "";
            var f = this.U.template(h, {slotId: e, callbackName: i, baiduId: c});
            if (/u\d+/.test(e)) {
                if (g) {
                    var d = document.createElement("script");
                    d.setAttribute("type", "text/javascript");
                    d.setAttribute("src", f);
                    document.getElementsByTagName("head")[0].appendChild(d)
                } else {
                    document.write('<script type="text/javascript" charset="utf-8" src="' + f + '"><\/script>')
                }
            } else {
                window[i](null, {_html: e})
            }
        },
        getSlotDataFromStar: function (c, g) {
            if (typeof(c) == "undefined" || !g || !window[g]) {
                return null
            }
            var f = "http://inte.sogou.com/ask?id={slotId}&cb={callbackName}&cxid={cxId}";
            var d = this.U.getCookieRaw("CXID") || "";
            var e = this.U.template(f, {slotId: c, callbackName: g, cxId: d});
            if (/\d+/.test(c)) {
                document.write('<script type="text/javascript" charset="utf-8" src="' + e + '"><\/script>')
            } else {
                window[g](null)
            }
        },
        getSlotDataFromLU: function (d, h, f) {
            if (!d || !h || !window[h]) {
                return null
            }
            if (d instanceof Array) {
                d = d.join(",")
            }
            if (/u\d+/.test(d)) {
                d = d.replace(/u/i, "")
            }
            var g = "http://lu.sogou.com/pg?id={slotId}&callback={callbackName}";
            var e = this.U.template(g, {slotId: d, callbackName: h});
            if (typeof(d) === "number" || /\d+/.test(d)) {
                if (f) {
                    var c = document.createElement("script");
                    c.setAttribute("type", "text/javascript");
                    c.setAttribute("src", e);
                    document.getElementsByTagName("head")[0].appendChild(c)
                } else {
                    document.write('<script type="text/javascript" charset="utf-8" src="' + e + '"><\/script>')
                }
            } else {
                window[h](null, {_html: d})
            }
        },
        getSlotDataFromCB: function (e, d) {
            var c = null;
            e = e || window.tempClbCproAdSlotId;
            d = d || window.tempClbCproAdObj;
            if (e && d) {
                c = {};
                c[e] = {_html: d._html}
            }
            return c
        },
        clearSlotDataFromCB: function () {
            window.tempClbCproAdSlotId = null;
            window.tempClbCproAdObj = null
        },
        parseSlotDataFromUnion: function (d) {
            var l = {};
            var e = "";
            for (var c in d) {
                if (c && d.hasOwnProperty(c)) {
                    e = c;
                    break
                }
            }
            l.slotId = e;
            var f = d[e]._html.split("|");
            var j, k;
            for (var g = 0, h = f.length; g < h; g++) {
                j = f[g];
                if (j) {
                    k = j.split("=");
                    l[k[0]] = k[1]
                }
            }
            return l
        },
        parseSlotDataFromStar: function (d) {
            var c = {};
            for (var e in d) {
                if (e && d.hasOwnProperty(e)) {
                    return d[e]
                }
            }
            return null
        },
        getTrafficDiversion: function (e) {
            var d = e || "";
            if (d.length > 4) {
                d = d.substr((d.length - 4), 4)
            }
            var g = Number(d);
            var f = "inte";
            this.starServiceUrl = "http://inte.sogou.com/ct";
            var c = g % 100;
            if (c >= 70) {
                f = "inte1";
                this.starServiceUrl = "http://inte1.sogou.com/ct"
            }
            return f
        },
        getTrafficDiversionLu: function () {
            var c = "lu";
            this.starServiceUrlLu = "http://lu.sogou.com/kwd";
            if (Math.random() < 0) {
                c = "inte1";
                this.starServiceUrlLu = "http://inte1.sogou.com/kwd"
            }
            return c
        },
        getSlotDataFromUserOpenApi: function () {
            var c = null;
            if (window.starApi && typeof window.starApi === "object" && (this.U.getLength(window.starApi) > 0)) {
                var e = window.starApi;
                c = {};
                window.starApi = null;
                for (var d in e) {
                    if (d && e[d]) {
                        c["star_" + d] = e[d]
                    }
                }
            }
            return c
        },
        getAdsDomId: function (c) {
            c = c || 1;
            return this.iframeIdPrefix + c
        },
        getAdsWrapperDomId: function (c) {
            c = c || 1;
            return this.iframeWrapperIdPrefix + c
        },
        checkAdsCounter: function (e, g, d) {
            var c = false;
            var f;
            switch (e.toLowerCase()) {
                case"inlay":
                    f = 5;
                    break;
                case"float":
                    f = 1;
                    break;
                case"ui":
                    f = 3;
                    if (d == "sogouDEFINE") {
                        f = 4
                    }
                    break;
                default:
                    f = 3;
                    break
            }
            g.__star__displayTypeCounter = g.__star__displayTypeCounter || {};
            g.__star__displayTypeCounter[e] = g.__star__displayTypeCounter[e] || 0;
            if (g.__star__displayTypeCounter[e] >= f) {
                c = true
            }
            return c
        },
        addAdsCounter: function (c, d) {
            d.__star__displayTypeCounter = d.__star__displayTypeCounter || {};
            d.__star__displayTypeCounter[c] = d.__star__displayTypeCounter[c] || 0;
            d.__star__displayTypeCounter[c]++;
            return true
        },
        checkAdsCounterLu: function (e, g, d) {
            var c = false;
            var f;
            switch (e.toLowerCase()) {
                case"inlay":
                    f = 5;
                    break;
                case"photo":
                    f = 100;
                    break;
                default:
                    f = 3;
                    break
            }
            g.__linkunit__displayTypeCounter = g.__linkunit__displayTypeCounter || {};
            g.__linkunit__displayTypeCounter[e] = g.__linkunit__displayTypeCounter[e] || 0;
            if (g.__linkunit__displayTypeCounter[e] >= f) {
                c = true
            }
            return c
        },
        addAdsCounterLu: function (c, d) {
            d.__linkunit__displayTypeCounter = d.__linkunit__displayTypeCounter || {};
            d.__linkunit__displayTypeCounter[c] = d.__linkunit__displayTypeCounter[c] || 0;
            d.__linkunit__displayTypeCounter[c]++;
            return true
        },
        getAdsWrapArray: function (d) {
            var c = [];
            if (d && typeof d == "string") {
                var h = d.split(",");
                var f = 0;
                for (var e = 0, g = h.length; e < g; e++) {
                    if (/u\d+/.test(h[e]) && !this.adsWrapStore[h[e]]) {
                        c[f] = h[e];
                        f++;
                        this.adsWrapStore[h[e]] = true
                    }
                }
            }
            return c
        }
    };
    a.registerNamespace(b)
})(window[___sogouNamespaceName]);
(function (b) {
    var a = {
        fullName: "$baseName.Business.Param",
        version: "1.0.0",
        register: function () {
            this.G = b.using("$baseName", this.win);
            this.U = b.using("$baseName.Utility", this.win);
            this.BL = b.using("$baseName.Business", this.win)
        },
        initialize: function (c) {
            this.currentWindow = c.currentWindow;
            this.doc = this.win.document;
            this.nav = this.win.navigator;
            this.scr = this.win.screen;
            this.displayType = c.displayType || "inlay";
            this.startTime = (new Date());
            this.BL.pnTypeArray = this.BL.pnTypeArray || [];
            this.BL.pnTypeArray[this.displayType] = this.BL.pnTypeArray[this.displayType] || [];
            this.timeStamp = c.timeStamp || (new Date()).getTime()
        },
        getSlot2UIMapping: function (e) {
            var d = {};
            var c;
            for (c in e) {
                if (c && e[c] && e[c].slotParamName) {
                    d[e[c].slotParamName] = c
                }
            }
            return d
        },
        getCust2UIMapping: function (e) {
            var d = {};
            var c;
            for (c in e) {
                if (c && e[c] && e[c].custParamName) {
                    d[e[c].custParamName] = c
                }
            }
            return d
        },
        mergeSlot2UI: function (f, e, d) {
            if (!f || !e || !d) {
                return null
            }
            var c, g;
            for (g in e) {
                if (g && e[g] && e.hasOwnProperty(g)) {
                    c = d[g];
                    f.set(c, e[g])
                }
            }
            return f
        },
        serialize: function (f) {
            var e = [];
            var d, c;
            for (d in f) {
                if (d && f[d] && (typeof f[d] === "object") && f[d].isUIParam && f[d].isUIParam[f.displayType]) {
                    c = f.get(d);
                    if (c == null) {
                        continue
                    }
                    if (f[d].encode || f.displayType == "ui") {
                        c = encodeURIComponent(c)
                    }
                    e.push(d + "=" + c)
                }
            }
            return e.join("&")
        },
        snap: function (f) {
            var e = {};
            var d, c;
            for (d in f) {
                if (d && f[d] && (typeof f[d] === "object") && f[d].defaultValue) {
                    c = f.get(d);
                    if (c == null) {
                        continue
                    }
                    if (f[d].encode || f.displayType == "ui") {
                        c = encodeURIComponent(c)
                    }
                    e[d] = c
                }
            }
            return e
        },
        get: function (e) {
            var c;
            if (this[e].get && this[e].get !== "default") {
                var d = Array.prototype.slice.call(arguments, 0);
                d.shift();
                if (!this[e]._init) {
                    this[e]._value = this[e].defaultValue[this.displayType]
                }
                c = this.U.proxy(this[e].get, this, d)()
            } else {
                if (!this[e]._init) {
                    c = this[e].defaultValue[this.displayType]
                } else {
                    c = this[e]._value
                }
            }
            return c
        },
        set: function (e, f) {
            var c = false;
            if (this[e].set && this[e].set !== "default") {
                var d = Array.prototype.slice.call(arguments, 0);
                d.shift();
                c = this.U.proxy(this[e].set, this, (d))()
            } else {
                this[e]._value = f;
                this[e]._init = true;
                c = true
            }
            return c
        },
        pid: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: "default",
            set: "default"
        },
        id: {
            slotParamName: "slotId",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": ""},
            encode: false,
            isUIParam: {inlay: true, "float": true},
            get: "default",
            set: "default"
        },
        h: {
            slotParamName: "star_h",
            custParamName: "h",
            modifier: "dynamic",
            defaultValue: {inlay: "125", "float": "270", ui: null},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true},
            get: "default",
            set: "default"
        },
        w: {
            slotParamName: "star_w",
            custParamName: "w",
            modifier: "dynamic",
            defaultValue: {inlay: "125", "float": "120", ui: null},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true},
            get: "default",
            set: "default"
        },
        fv: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "0", "float": "0", ui: "", post: ""},
            encode: true,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                var c = "ShockwaveFlash.ShockwaveFlash", g = this.nav, d, h;
                if (this.nav.plugins && g.mimeTypes.length) {
                    d = g.plugins["Shockwave Flash"];
                    if (d && d.description) {
                        return d.description.replace(/[^\d\.]/g, "").split(".")[0]
                    }
                } else {
                    if (this.U.browser.ie) {
                        h = ActiveXObject;
                        try {
                            d = new h(c + ".7")
                        } catch (f) {
                            try {
                                d = new h(c + ".6");
                                d.AllowScriptAccess = "always";
                                return 6
                            } catch (f) {
                            }
                            try {
                                d = new h(c)
                            } catch (f) {
                            }
                        }
                        if (d != null) {
                            try {
                                return d.GetVariable("$version").split(" ")[1].split(",")[0]
                            } catch (f) {
                            }
                        }
                    }
                }
                return 0
            },
            set: "default"
        },
        "if": {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "0", "float": "0", ui: "0", post: "0"},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                var d = 0;
                if (this.U.isInIframe()) {
                    d += 1
                }
                if (this.U.isInCrossDomainIframe()) {
                    d += 2
                }
                var c = this.get("w");
                var f = this.get("h");
                var e = this.U.getClientWidth(this.currentWindow);
                var g = this.U.getClientHeight(this.currentWindow);
                if (e < 40 || g < 10) {
                    d += 4
                } else {
                    if (e < c || g < f) {
                        d += 8
                    }
                }
                if ((e >= 2 * c) || (g >= 2 * f)) {
                    d += 16
                }
                return d
            },
            set: "default"
        },
        sohuurl: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: true,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                var h = this.currentWindow;
                var o, l = 10, e = 0;
                var f = this.get("w") || 0;
                var m = this.get("h") || 0;
                o = h.document.location.href;
                if (this.U.isInIframe(h)) {
                    for (e = 0; e < l; e++) {
                        if (!this.U.isInCrossDomainIframe(h, h.parent)) {
                            h = h.parent;
                            if (!this.U.isInIframe(h, h.parent)) {
                                o = h.location.href;
                                break
                            }
                        } else {
                            try {
                                o = h.document.referrer || h.document.location
                            } catch (j) {
                                var i = null;
                                try {
                                    i = window.top.location.href
                                } catch (k) {
                                    i = o
                                }
                                var n = document.location;
                                if (n != i) {
                                    o = n
                                } else {
                                    o = i
                                }
                                return o
                            }
                            var g = o.toString();
                            var d = null;
                            if (this.U.isWindow(h.parent)) {
                                try {
                                    d = h.parent.location.toString()
                                } catch (j) {
                                    d = null
                                }
                            }
                            if (d != null && (g != d || h != h.parent)) {
                                h = h.parent;
                                continue
                            }
                            h = h.parent;
                            if (!this.U.isInCrossDomainIframe(h, h.parent)) {
                                break
                            }
                        }
                    }
                    if (e >= 10) {
                        o = h.document.referrer || h.document.location
                    }
                }
                return o
            },
            set: "default"
        },
        refer: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: true,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                return this.U.escapeToEncode(this.doc.referrer || "")
            },
            set: "default"
        },
        ti: {
            slotParamName: "",
            custParamName: "",
            modifer: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: true,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                var d = "";
                if (top == self) {
                    d = document.title
                } else {
                    try {
                        return window.top.document.title.substring(0, 60)
                    } catch (c) {
                    }
                }
                return d.substring(0, 60)
            },
            set: "default"
        },
        rnd: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                if (!this["rnd"]._value) {
                    if (b.page_id) {
                        this["rnd"]._value = b.page_id
                    } else {
                        this["rnd"]._value = this.U.md5(this.BL.randomArray.join("") + Math.random() * 1000000 + this.doc.location.href);
                        b.page_id = this["rnd"]._value
                    }
                    this["rnd"]._init = true
                }
                return this["rnd"]._value
            },
            set: function () {
                this["rnd"]._value = ""
            }
        },
        z: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                if (!this["z"]._value) {
                    this["z"]._value = this.U.md5(this.BL.randomArray.join("") + Math.random() * 1000000 + this.doc.location.href);
                    this["z"]._init = true
                }
                return this["z"]._value
            },
            set: function () {
                this["z"]._value = ""
            }
        },
        js: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "c", "float": "f", ui: "ui", post: "post"},
            encode: false,
            isUIParam: {inlay: false, "float": false, ui: true, post: true},
            get: "default",
            set: "default"
        },
        lmt: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                return Date.parse(this.doc.lastModified) / 1000
            },
            set: "default"
        },
        bs: {
            slotParamName: "",
            custParamName: "",
            modifer: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                try {
                    if (document.documentElement.clientHeight == 0) {
                        return document.body.clientWidth + "," + document.body.clientHeight
                    } else {
                        return document.documentElement.clientWidth + "," + document.documentElement.clientHeight
                    }
                } catch (c) {
                }
                return ""
            },
            set: "default"
        },
        srp: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                return this.scr.width + "," + this.scr.height
            },
            set: "default"
        },
        srn: {
            slotParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": ""},
            encode: false,
            isUIParam: {inlay: false, "float": false},
            get: function () {
                return this.scr.availWidth + "," + this.scr.availHeight
            },
            set: "default"
        },
        ccd: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                return this.scr.colorDepth || 0
            },
            set: "default"
        },
        lhi: {
            slotParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": ""},
            encode: false,
            isUIParam: {inlay: true, "float": true},
            get: function () {
                return this.win.history.length || 0
            },
            set: "default"
        },
        eja: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                return this.nav.javaEnabled().toString()
            },
            set: "default"
        },
        npl: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                return this.nav.plugins.length || 0
            },
            set: "default"
        },
        nmi: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                return this.nav.mimeTypes.length || 0
            },
            set: "default"
        },
        ece: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                return this.nav.cookieEnabled || 0
            },
            set: "default"
        },
        lan: {
            uuserApiName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                return this.nav.systemLanguage || this.nav.language
            },
            set: "default"
        },
        bi: {
            uuserApiName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "1", "float": "1", ui: "1", post: "1"},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                return this.BL.displayCounter || 1
            },
            set: function () {
                this.BL.displayCounter = this.BL.displayCounter || 1;
                this.BL.displayCounter++;
                return true
            }
        },
        t1: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                var c = 0;
                if (this.startTime) {
                    c = (new Date()).getTime() - this.startTime.getTime()
                }
                return c
            },
            set: "default"
        },
        t2: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "", "float": "", ui: "", post: ""},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                return Math.round((new Date).getTime() / 1000)
            },
            set: "default"
        },
        pvt: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "0", "float": "0", ui: "0", post: "0"},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                if (!this.BL.pageFirstRequestTime) {
                    this.BL.pageFirstRequestTime = (new Date()).getTime()
                }
                return this.BL.pageFirstRequestTime || ""
            },
            set: "default"
        },
        ssi0: {
            slotParamName: "",
            custParamName: "",
            modifier: "dynamic",
            defaultValue: {inlay: "0", "float": "0", ui: "0", post: "0"},
            encode: false,
            isUIParam: {inlay: true, "float": true, ui: true, post: true},
            get: function () {
                var f = navigator.userAgent.toLowerCase();
                var g = 0;
                if (f.indexOf("windows") > -1) {
                    g = 1
                } else {
                    if (f.indexOf("mac") > -1) {
                        g = 2
                    } else {
                        if (f.indexOf("linux") > -1) {
                            g = 3
                        } else {
                            if (f.indexOf("solaris") > -1) {
                                g = 4
                            } else {
                                if (f.indexOf("x11") > -1) {
                                    g = 5
                                }
                            }
                        }
                    }
                }
                if (!!f.match(/AppleWebKit.*Mobile.*/) || !!f.match(/AppleWebKit/)) {
                    g = 6
                } else {
                    if (f.indexOf("ios") > -1) {
                        g = 6
                    } else {
                        if (f.indexOf("app") > -1) {
                            g = 7
                        } else {
                            if (f.indexOf("iphone") > -1) {
                                g = 8
                            } else {
                                if (f.indexOf("ipad") > -1) {
                                    g = 9
                                }
                            }
                        }
                    }
                }
                var d = 0;
                try {
                    if (f.indexOf("msie") > -1) {
                        d = 1
                    } else {
                        if (f.indexOf("firefox") > -1) {
                            d = 2
                        } else {
                            if (f.indexOf("chrome") > -1) {
                                d = 3
                            } else {
                                if (window.opera) {
                                    d = 4
                                } else {
                                    if (window.openDatabase) {
                                        d = 5
                                    }
                                }
                            }
                        }
                    }
                } catch (h) {
                }
                if (f.indexOf("360ee") > -1) {
                    d = 6
                } else {
                    if (f.indexOf("360se") > -1) {
                        d = 7
                    } else {
                        if (f.indexOf("se ") > -1) {
                            d = 8
                        } else {
                            if (f.indexOf("aoyou") > -1 || f.indexOf("maxthon") > -1) {
                                d = 9
                            } else {
                                if (f.indexOf("theworld") > -1) {
                                    d = 10
                                } else {
                                    if (f.indexOf("worldchrome") > -1) {
                                        d = 11
                                    } else {
                                        if (f.indexOf("greenbrowser") > -1) {
                                            d = 12
                                        } else {
                                            if (f.indexOf("qqbrowser") > -1) {
                                                d = 13
                                            } else {
                                                if (f.indexOf("baidu") > -1 || f.indexOf("bidu") > -1) {
                                                    d = 14
                                                } else {
                                                    if (f.indexOf("maxthon") > -1) {
                                                        d = 9
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                try {
                    if (d == 3) {
                        var i = navigator.mimeTypes["application/x-shockwave-flash"].description.toLowerCase();
                        if (i.indexOf("adobe") > -1 && d == 0) {
                            d = 6
                        }
                    }
                    window.external.twGetRunPath().toLowerCase().indexOf("360se") > -1 && (d = 7)
                } catch (c) {
                }
                try {
                    if (/(\d+\.\d)/.test(external.max_version)) {
                        d = 9
                    }
                } catch (h) {
                }
                return ((g & 255) << 8) | (d & 255)
            },
            set: "default"
        },
        enc: {
            custParamName: "charset",
            modifier: "dynamic",
            defaultValue: {ui: null},
            encode: true,
            isUIParam: {ui: true},
            get: function () {
                if (typeof(this["enc"]._value) == "string") {
                    switch (this["enc"]._value.toLowerCase()) {
                        case"gb2312":
                        case"gbk":
                            return "0";
                            break;
                        case"utf8":
                        case"utf-8":
                            return "1";
                            break;
                        default:
                            return null;
                            break
                    }
                }
            },
            set: "default"
        }
    };
    b.registerClass(a)
})(window[___sogouNamespaceName]);
(function (b) {
    var a = {
        fullName: "$baseName.Business.ViewWatch",
        version: "1.0.0",
        register: function () {
            this.G = b.using("$baseName", this.win);
            this.U = b.using("$baseName.Utility", this.win);
            this.BL = b.using("$baseName.Business", this.win)
        },
        analysisUrl: "http://eff.inte.sogou.com/answer",
        longTime: 7200000,
        uiParamMapping: {
            pid: "pid",
            id: "id",
            bi: "bi",
            sohuurl: "sohuurl",
            rnd: "rnd",
            "if": "if",
            w: "w",
            h: "h",
            js: "js",
            z: "z"
        },
        viewContextParamMapping: {
            pageStayTime: "pt",
            pageStayTimeStamp: "ps",
            inViewTime: "it",
            inViewTimeStamp: false,
            currViewStatus: "vs",
            focusTime: "ft",
            adViewTime: "vt",
            currAdViewStatus: false,
            adViewTimeStamp: false,
            offlineConditionIndex: 0
        },
        clientParamMapping: {
            opacity: "op",
            desktopResolution: "csp",
            browserRegion: "bcl",
            pageRegion: "pof",
            top: "top",
            left: "left",
            focusSwitch: "fs"
        },
        isIEWatchFocus: true,
        focusSwitch: true,
        watchArrayPointer: null,
        intervalId: null,
        intervalTimeSpan: 500,
        intervalStatus: "wait",
        initialize: function () {
            this.watchArrayPointer = this.BL.adsArray
        },
        initializeDOM: function () {
        },
        initializeEvent: function () {
            this.windowOnLoad();
            var c = this.U.proxy(this.windowOnLoadDelay, this);
            this.U.ready(c, 2000);
            this.U.bind(this.win, "beforeunload", this.U.proxy(this.windowOnUnload, this))
        },
        calculateClientParam: function (f, g, e) {
            f.clientParam = f.clientParam || {};
            var d = this.U.getPosition(g);
            f.clientParam.left = d.left || 0;
            f.clientParam.top = d.top || 0;
            f.clientParam.opacity = this.U.getOpacity(g);
            var h = e.screen.availWidth;
            var c = e.screen.availHeight;
            if (h > 10000) {
                h = 0
            }
            if (c > 10000) {
                c = 0
            }
            f.clientParam.desktopResolution = h + "," + c;
            f.clientParam.browserRegion = this.U.getClientWidth(e) + "," + this.U.getClientHeight(e);
            f.clientParam.pageRegion = this.U.getScrollWidth(e) + "," + this.U.getScrollHeight(e);
            f.clientParam.focusSwitch = this.focusSwitch
        },
        updateViewStatus: function (d, c, h) {
            var g = new Date();
            var e = pageTimeSpan = this.intervalTimeSpan;
            var f = e;
            if (this.intervalStatus === "load") {
                this.intervalStatus = "run";
                e = pageTimeSpan = 0;
                f = 0
            }
            if (d.currViewStatus) {
                if (this.intervalStatus === "unload") {
                    e = parseInt(g.getTime() - d.inViewTimeStamp.getTime());
                    if (e < 0) {
                        e = 0
                    } else {
                        if (e > this.intervalTimeSpan) {
                            e = this.intervalTimeSpan
                        }
                    }
                }
                d.inViewTime += e;
                d.inViewTimeStamp = g;
                if (d.inViewTime > this.longTime) {
                    d.inViewTime = this.longTime
                }
            } else {
                if (c) {
                    d.inViewTimeStamp = g;
                    d.currViewStatus = c
                }
            }
            if (d.currAdViewStatus) {
                if (this.intervalStatus === "unload") {
                    f = parseInt(g.getTime() - d.adViewTimeStamp.getTime());
                    if (f < 0) {
                        f = 0
                    } else {
                        if (f > this.intervalTimeSpan) {
                            f = this.intervalTimeSpan
                        }
                    }
                }
                d.adViewTime += f;
                d.adViewTimeStamp = g;
                if (d.adViewTime > this.longTime) {
                    d.adViewTime = this.longTime
                }
            } else {
                if (h) {
                    d.adViewTimeStamp = g;
                    d.currAdViewStatus = h
                }
            }
            d.pageStayTime = d.pageStayTime || 0;
            if (this.intervalStatus === "unload") {
                pageTimeSpan = parseInt(g.getTime() - d.pageStayTimeStamp.getTime());
                if (pageTimeSpan < 0) {
                    pageTimeSpan = 0
                } else {
                    if (pageTimeSpan > this.intervalTimeSpan) {
                        pageTimeSpan = this.intervalTimeSpan
                    }
                }
            }
            d.pageStayTime += pageTimeSpan;
            if (this.BL.winFocused) {
                d.focusTime += pageTimeSpan
            }
            d.pageStayTimeStamp = g;
            if (d.pageStayTime > this.longTime) {
                d.pageStayTime = this.longTime
            }
            return d
        },
        viewableCompute: function () {
            var t, g;
            for (t = 0, g = this.watchArrayPointer.length; t < g; t++) {
                var u = this.watchArrayPointer[t];
                var c, m = u.win, l = u.domId;
                if (m && l) {
                    c = m.document.getElementById(l)
                }
                if (!c) {
                    continue
                }
                if (!u.viewContext) {
                    var h = new Date();
                    u.viewContext = {
                        pageStayTime: 0,
                        pageStayTimeStamp: h,
                        inViewTime: 0,
                        inViewTimeStamp: h,
                        currViewStatus: false,
                        focusTime: 0,
                        adViewTime: 0,
                        currAdViewStatus: false,
                        adViewTimeStamp: false,
                        offlineConditionIndex: 0
                    }
                }
                var y = false;
                var f = false;
                if (!this.BL.winFocused) {
                    y = false;
                    f = false
                } else {
                    try {
                        var p = this.U.getClientWidth(this.win);
                        var e = this.U.getClientHeight(this.win);
                        var x = this.U.getPosition(l, m);
                        var d = this.U.getScrollTop(this.win);
                        var s = this.U.getScrollLeft(this.win);
                        var n = this.U.getOuterWidth(c);
                        var o = this.U.getOuterHeight(c);
                        var j = x.top - d + o * 0.35;
                        var k = x.left - s + n * 0.35;
                        y = j > 0 && j < e;
                        y = y && (k > 0 && k < p);
                        j = x.top - d;
                        k = x.left - s;
                        var w = n * o;
                        var q = (e - j) > o ? o : (e - j);
                        var r = (p - k) > n ? n : (p - k);
                        f = q * r > 0.5 * w ? true : false
                    } catch (v) {
                        y = false;
                        f = false;
                        continue
                    }
                }
                u.viewContext = this.updateViewStatus(u.viewContext, y, f);
                u.analysisUrl = this.buildAnalysisUrl(this.analysisUrl, u, c)
            }
        },
        buildAnalysisUrl: function (e, h, g) {
            if (!e || !h) {
                return
            }
            var c = e + "?";
            var d = h.uiParamSnap, j = [];
            for (var f in this.uiParamMapping) {
                if (f && this.uiParamMapping[f] && d[f]) {
                    j.push(this.uiParamMapping[f] + "=" + d[f])
                }
            }
            c += j.join("&");
            c += "&" + this.U.param(h.viewContext, this.viewContextParamMapping);
            if (!h.clientParam || !h.clientParam.pageRegion) {
                try {
                    this.calculateClientParam(h, g, h.win)
                } catch (i) {
                }
            }
            if (h.clientParam) {
                c += "&" + this.U.param(h.clientParam, this.clientParamMapping)
            } else {
                for (var k in this.clientParamMapping) {
                    if (k && this.clientParamMapping[k]) {
                        c += "&" + this.clientParamMapping[k] + "="
                    }
                }
            }
            return c
        },
        viewOnChange: function () {
            this.viewableCompute();
            if (this.watchArrayPointer[0].viewContext.pageStayTime >= this.longTime) {
                this.windowOnUnload(false)
            }
        },
        windowOnLoad: function (g) {
            var c, d, f = new Date();
            for (c = 0, d = this.watchArrayPointer.length; c < d; c++) {
                this.watchArrayPointer[c].viewContext = {
                    pageStayTime: 0,
                    pageStayTimeStamp: f,
                    inViewTime: 0,
                    inViewTimeStamp: f,
                    currViewStatus: false,
                    focusTime: 0,
                    adViewTime: 0,
                    currAdViewStatus: false,
                    adViewTimeStamp: false,
                    offlineConditionIndex: 0
                }
            }
            this.intervalStatus = "load";
            this.focusSwitch = this.winFocusBlurOnChange(this.win, this.isIEWatchFocus);
            if (!this.U.browser.ie || (this.U.browser.ie && this.U.browser.ie > 6)) {
                this.viewOnChange()
            }
            this.intervalId = setInterval(this.U.proxy(this.viewOnChange, this), this.intervalTimeSpan)
        },
        windowOnLoadDelay: function (l) {
            var d, h, k = new Date(), g, j, f, c;
            for (d = 0, h = this.watchArrayPointer.length; d < h; d++) {
                var g = this.watchArrayPointer[d];
                if (!g) {
                    continue
                }
                f = g.win;
                c = g.domId;
                if (f && c) {
                    j = f.document.getElementById(c)
                }
                if (!j) {
                    continue
                }
                g.clientParam = g.clientParam || {};
                this.calculateClientParam(g, j, f)
            }
        },
        windowOnUnload: function (l) {
            try {
                clearInterval(this.viewIntervalID);
                if (this.intervalStatus !== "run") {
                    this.intervalStatus = "unload";
                    return
                }
                this.intervalStatus = "unload";
                this.viewableCompute();
                var g, f, j, o, m, c;
                for (g = 0, j = this.watchArrayPointer.length; g < j; g++) {
                    o = this.watchArrayPointer[g];
                    if (o && o.analysisUrl && !o.isSended) {
                        o.isSended = true;
                        if (g == 0) {
                            o.analysisUrl += "&total=" + this.watchArrayPointer.length
                        }
                        this.U.sendRequestViaImage(o.analysisUrl, this.win)
                    }
                }
                var h = 200;
                var k = (new Date()).getTime();
                var d;
                if (this.U.browser.ie) {
                    d = k + h;
                    while (d > k) {
                        k = (new Date()).getTime()
                    }
                } else {
                    var j = 1000000;
                    for (var g = 0; g < j; g++) {
                    }
                    d = (new Date()).getTime();
                    j = 1000000 * h / (d - k);
                    j = j > 100000000 ? 100000000 : j;
                    for (var g = 0; g < j; g++) {
                    }
                }
            } catch (n) {
                console.log(n)
            }
        },
        winFocusBlurOnChange: function (e) {
            var c = false, e = e || this.win;
            this.BL.winFocused = true;
            var f = this.U.proxy(function (g) {
                this.BL.winFocused = true
            }, this);
            var d = this.U.proxy(function (g) {
                this.BL.winFocused = false
            }, this);
            if (this.U.browser.ie || this.U.browser.maxthon) {
                this.U.bind(e, "focusin", f);
                this.U.bind(e, "focusout", d);
                c = true
            } else {
                this.U.bind(e, "focus", f);
                this.U.bind(e, "blur", d);
                c = true
            }
            return c
        },
        getInstance: function () {
            if (!this.instances || this.instances.length < 1) {
                this.instances = [];
                var c = this.G.create(this);
                this.instances.push(c)
            }
        }
    };
    b.registerClass(a)
})(window[___sogouNamespaceName]);
(function (n) {
    var n = n;
    var e = n.using("$baseName.Utility");
    var q = n.using("$baseName.Business");
    var o;
    var b = "c";
    var m = "inlay";
    var s = "SOGOU_STAR_SETJSONADSLOT";
    var p = null;
    var a = null;
    q.randomArray.push(Math.random() * 1000000);
    var g = function () {
        if (top == self) {
            return 0
        } else {
            if (top == window.parent) {
                return 1
            } else {
                return 2
            }
        }
    };
    var r = function (u) {
        var t = u.split(".");
        if (t.length <= 2) {
            return u
        }
        var v = 2;
        if (t[t.length - 2] == "com" || t[t.length - 2] == "net" || t[t.length - 2] == "org") {
            v += 1
        }
        t.splice(0, t.length - v);
        return t.join(".")
    };
    var j = function () {
        if (g() == 1) {
            var u = function (w) {
                var v = document.createElement("a");
                v.href = w;
                return v
            };
            var t = u(document.referrer);
            if (t.hostname.lastIndexOf(r(document.location.hostname)) == -1) {
                return 1
            } else {
                if (t.hostname != document.location.hostname) {
                    return 2
                }
            }
        }
        return 0
    };

    function d(t) {
        var u = t.getBoundingClientRect();
        var x = {
            top: u.top,
            right: u.right,
            bottom: u.bottom,
            left: u.left,
            width: u.right - u.left,
            height: u.bottom - u.top
        };
        var z = document.documentElement.clientTop || document.body.clientTop || 0;
        var y = document.documentElement.clientLeft || document.body.clientLeft || 0;
        var v = window.pageYOffset || document.documentElement.scrollTop;
        var w = window.pageXOffset || document.documentElement.scrollLeft;
        x.top = x.top + v - z;
        x.bottom = x.bottom + v - z;
        x.left = x.left + w - y;
        x.right = x.right + w - y;
        return x
    }

    function i() {
        return window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
    }

    var l = function (F, I, t) {
        var K = {};
        var L = {};
        q.randomArray.push(Math.random() * 1000000);
        K = q.parseSlotDataFromStar(F);
        if (F == null) {
            document.write('<div style="display:none">code id is not valid</div>');
            return
        }
        L = n.create(q.Param, {displayType: m, currentWindow: window, timeStamp: (new Date()).getTime()});
        L.set("js", b);
        if (q.checkAdsCounter(m, window)) {
            return
        }
        L.set("w", I);
        L.set("h", t);
        var J = L.get("w");
        var D = L.get("h");
        L.set("id", K.id);
        L.set("pid", null);
        var z;
        if (K.st == 1) {
            z = q.starServiceUrl
        } else {
            if (K.st == 2) {
                z = q.starServiceUrlLu
            } else {
                if (K.st == 3) {
                    z = ""
                } else {
                    return
                }
            }
        }
        var w = L.get("bi");
        var x = '<div style="display:none">-</div> <div id="{wrapperId}" style="height:{iframeHeight}px;"><iframe id="{iframeId}" onload="document.sogou_ads{bi}_loaded=true;" src="{starServiceUrl}?{paramString}" width="{iframeWidth}" height="{iframeHeight}" align="center,center" marginwidth="0"  marginheight="0" scrolling="no" frameborder="0" allowtransparency="true" ></iframe></div>';
        var G = q.getAdsDomId(L.get("bi"));
        var v = q.getAdsWrapperDomId(L.get("bi"));
        var C = q.Param.serialize(L);
        C += "&tmp_cdif=" + String(j());
        C += "&m=" + K.m;
        var A = {iframeId: G, wrapperId: v, bi: w, paramString: C, iframeWidth: J, iframeHeight: D, starServiceUrl: z};
        var u = e.g("star_" + L.get("id"));
        if (u) {
            u.innerHTML = e.template(x, A)
        } else {
            document.write(e.template(x, A))
        }
        if (K.isf == "1") {
            var H = document.getElementById(v);
            var E = document.getElementById(G);
            var y = function () {
                var M = i();
                var N = d(H);
                if (M > N.top) {
                    E.style.position = "fixed";
                    E.style.top = 0;
                    E.style.left = N.left + "px"
                } else {
                    E.style.position = "";
                    E.style.top = "";
                    E.style.left = ""
                }
            };
            if (window.addEventListener) {
                window.addEventListener("scroll", y, false)
            } else {
                window.attachEvent("onscroll", y)
            }
        }
        var B = q.Param.snap(L);
        q.adsArray.push({domId: G, uiParamSnap: B, win: window, js: b});
        q.addAdsCounter(m, window);
        L.set("bi");
        q.ViewWatch.getInstance();
        if (typeof(document.wb_pb) == "undefined") {
            document.wb_pb = new Array()
        }
        window.setTimeout("(function(){if(!document.sogou_ads" + w + '_loaded){var a=new Image();a.src = "http://wb.brand.sogou.com/ct_pv?asid=' + K.id + "&r=" + L.get("rnd") + '";document.wb_pb.push(a);}}())', 6000)
    };
    var f = window[s] = function (t) {
        l(t, p, a)
    };
    if (b === "c") {
        if (typeof(window.sogou_ad_id) == "undefined" || typeof(window.sogou_ad_width) == "undefined" || typeof(window.sogou_ad_height) == "undefined") {
            return
        }
        var c = document.getElementsByTagName("script");
        var k = c[c.length - 1].src;
        var h = e.getPara(k);
        q.isAsyn = h.asyn;
        p = window.sogou_ad_width;
        a = window.sogou_ad_height;
        if (window.sogou_ad_id) {
            q.getSlotDataFromStar(sogou_ad_id, s)
        }
    }
})(window[___sogouNamespaceName]);
(function (d, g) {
    var c = "SOGOU_STAR_URL_CALLBACK";
    var b = "SOGOU_STAR_URL_DATA";
    var e = "http://dsp.brand.sogou.com/ask_service";
    var j = "http://images.sohu.com/cs/jsfile/js/pe.js";
    var i = function (n) {
        var m = n;
        while (m.parent != m.self) {
            try {
                var o = m.parent.document.title;
                m = m.parent
            } catch (l) {
                break
            }
        }
        return m
    };
    var f = function (o) {
        var n = o;
        var l = "";
        try {
            l = n.document.location;
            if (n.parent != n.self) {
                l = n.document.referrer || n.document.location
            }
        } catch (m) {
            l = ""
        }
        return l
    };
    var h = function (l, n) {
        var m = e + "?callback=" + l + "&url=" + n;
        g.write('<script type="text/javascript" charset="utf-8" src="' + m + '"><\/script>')
    };
    var k = d[c] = function (l) {
        if (l == null || l.want != "1") {
            return
        }
        d[b] = l;
        var m = g.createElement("script");
        m.src = j;
        g.body.appendChild(m)
    };

    function a() {
        var l = i(d) || d;
        if (l.pe_has_loaded) {
            return
        } else {
            l.pe_has_loaded = true
        }
        if (Math.random() > 0.2) {
            return
        }
        var m = f(l);
        m = encodeURIComponent(m);
        h(c, m)
    }

    a()
})(window, document);