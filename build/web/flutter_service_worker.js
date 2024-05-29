'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "72e158a3ffd963df21e4266bc264e3c1",
"assets/AssetManifest.bin.json": "c75dab6a31e10e9574f346eb6dfef42f",
"assets/AssetManifest.json": "9027b6ddc267d889dba946edfc2e6711",
"assets/assets/logo/404.png": "596f521a8677c1d0ba6334e230501105",
"assets/assets/logo/artache.jfif": "03e402c5172d71c0d24e79d9b7b56c0f",
"assets/assets/logo/gdsc.webp": "681f51279a13eeb22e1106992d7bc901",
"assets/assets/logo/gdsc1.webp": "0581eeb1b9a19e21cccfd7cdeffd04a2",
"assets/assets/logo/pel.png": "9f49839b4e1fe0597ece620fb0c5a255",
"assets/assets/logo/pel1.png": "2a43d235cb7cda8dddf4fbf2c4166acb",
"assets/assets/logo/pieas.jpg": "7b41589e0132593f3c9f5a1c704ea03c",
"assets/assets/logo/pieas1.jpg": "379cd049875fbfd555b0214f8b84f77e",
"assets/assets/logo/soloinsight.jpeg": "09ce55b6269058426f60e22ad3f775c5",
"assets/assets/logo/wordpress.png": "eec53f7dea87f403ac9b1f926745c749",
"assets/assets/my_tools_icons/adobe.png": "842533422827512f38fae8b04a8feaa3",
"assets/assets/my_tools_icons/adobexd.png": "7ce15d6bda9230121566e618455d288c",
"assets/assets/my_tools_icons/adobexd_colored.png": "27a4d258eaf3211543867d78f4c6e1d5",
"assets/assets/my_tools_icons/adobe_colored.png": "fa7b7577ebafb6e8bb3505793cbf6adb",
"assets/assets/my_tools_icons/androidstudio.png": "393d97ce65c4369459980d96cfb784a6",
"assets/assets/my_tools_icons/anydesk.png": "4a7b6ae6d508fd6109bd63867c37c3db",
"assets/assets/my_tools_icons/appstore.png": "5acac271c8111416a0e3302e2e367892",
"assets/assets/my_tools_icons/appstore_colored.png": "aa0b66b3646c3da114f1123f6f493579",
"assets/assets/my_tools_icons/behance.png": "523ed57cf97e302bbad753ccf8424092",
"assets/assets/my_tools_icons/behance_colored.png": "776dca77001c0d6372a5228cdaa256cf",
"assets/assets/my_tools_icons/bitbucket.png": "7938ccf9efec9c64eaadde442d289827",
"assets/assets/my_tools_icons/bitbucket_colored.png": "b11909e448d9bc324d48c08d5f00a1dd",
"assets/assets/my_tools_icons/canva.png": "8fb00df9c5f495a96d70b5d54cd6734d",
"assets/assets/my_tools_icons/chatgpt.png": "7b8903fa444fa02c20fca17b5eb48d3d",
"assets/assets/my_tools_icons/chrome.png": "daf3f174586c960c264309433c6d5d83",
"assets/assets/my_tools_icons/chrome_colored.png": "714a2240a483b577826ada7ea889e5b8",
"assets/assets/my_tools_icons/dart.png": "0d43ed63a2db1e632bcbd5d00fb04ee5",
"assets/assets/my_tools_icons/dart_colored.png": "24cfa3cbb823d73ccf412cca2a108ea7",
"assets/assets/my_tools_icons/discord.png": "cf5527333d0cb76631c2fe973cbd70bb",
"assets/assets/my_tools_icons/dribble.png": "b9603aa1058c0d06872b31e720313d0b",
"assets/assets/my_tools_icons/dribble_colored.png": "39c29d037b5293fa0fc30c0723f20ee9",
"assets/assets/my_tools_icons/dropbox.png": "b872c8aa6b7d4c1e37da54612fda550d",
"assets/assets/my_tools_icons/dropbox_colored.png": "c4d88b1e0d8fed1bc781f744140b22b7",
"assets/assets/my_tools_icons/edge.png": "b1c8c434ee2e851012c10f9679b4b71d",
"assets/assets/my_tools_icons/edge_colored.png": "8138a3b1dcb98e7c9551cde6623d9af8",
"assets/assets/my_tools_icons/elementor.png": "8be31156d34cc8161abe858dfc54f620",
"assets/assets/my_tools_icons/facebook.png": "88b25861cd5f4680c4e73ee180c7dba7",
"assets/assets/my_tools_icons/facebook_colored.png": "7561cfdf8465bb9571680e75e89ff2bf",
"assets/assets/my_tools_icons/figma.png": "867884808a06c411cd082d1b105e3d7d",
"assets/assets/my_tools_icons/figma_colored.png": "b8fc8086692986d19c22eb5e45fd5993",
"assets/assets/my_tools_icons/firebase.png": "b98d372461ccb526cb4351811e4133cb",
"assets/assets/my_tools_icons/firebase_colored.png": "d3eef6de1a3e342a785eb9de2bddc16b",
"assets/assets/my_tools_icons/firefox.png": "800d31b9cd75bc2197c65e6898b46f5a",
"assets/assets/my_tools_icons/firefox_colored.png": "4789e629596d86cc904aecf39e7e542f",
"assets/assets/my_tools_icons/fiverr.png": "2d13554af293f20d48041771347731f6",
"assets/assets/my_tools_icons/flutter.png": "7f66fae2bc69ca7542aa19f7dd358325",
"assets/assets/my_tools_icons/flutter_colored.png": "f9e46c90269779579cd9b2fb29cfe234",
"assets/assets/my_tools_icons/git.png": "5d476209919b61b5d37dba254087f2d2",
"assets/assets/my_tools_icons/github.png": "f8f00c0df0c3f20329ece83bc8fffcc5",
"assets/assets/my_tools_icons/gitoutlined.png": "9fc2b16b747b949ea0bae9dbe2b5f841",
"assets/assets/my_tools_icons/git_colored.png": "800b6c9d2b88cb04682739e32a256afe",
"assets/assets/my_tools_icons/gmail.png": "2d958e5dc9df4fcafc820aafd492c3f0",
"assets/assets/my_tools_icons/gmail_colored.png": "ef4781f8773016c75b51d5015889d563",
"assets/assets/my_tools_icons/instagram.png": "e47d7fc23d6d67e0b74aa0948b8795c1",
"assets/assets/my_tools_icons/instagram_colored.png": "dcb75774ab67a75450556504ede48173",
"assets/assets/my_tools_icons/javascript.png": "062ba209560ac87f17493b0c07288f58",
"assets/assets/my_tools_icons/javascript_colored.png": "29cff886d0798e5829ca865823edaad7",
"assets/assets/my_tools_icons/jira.png": "2a28bf9813a4b6a21c262a5b6f1b9d4f",
"assets/assets/my_tools_icons/jira_colored.png": "dd1f6c4b5bb16b183c2ae47f1a34c048",
"assets/assets/my_tools_icons/linkedin.png": "764ad2b84fd31d298b260c86222964c4",
"assets/assets/my_tools_icons/linkedin_colored.png": "ba1b9110cefd84cc65c2787d49d3b10f",
"assets/assets/my_tools_icons/macos.png": "0d6fc67a1b3353464ef60fdddb9d8fd2",
"assets/assets/my_tools_icons/medium.png": "0a794141882cbe2b8d8f51ae9d6f8f1f",
"assets/assets/my_tools_icons/nodejs.png": "cc00ea3dbfcd11e91c5bfd4c74577bb2",
"assets/assets/my_tools_icons/nodejs_colored.png": "646a0116bcdbacb135feaf46a871a1d9",
"assets/assets/my_tools_icons/notion.png": "69294d0c9b4bb345aa6bb0627e4b5e3e",
"assets/assets/my_tools_icons/outlook.png": "9775c6c23ccaaad4b0d6025eeeef6054",
"assets/assets/my_tools_icons/outlook_colored.png": "61f74b76c9984c3698e296eddaf48c1f",
"assets/assets/my_tools_icons/photoshop.png": "e322c75d410030a4bc1ea09d530861b3",
"assets/assets/my_tools_icons/photoshop_colored.png": "217dc1442bd25b74e78b90976868684d",
"assets/assets/my_tools_icons/playstore.png": "387a9b5925ba18ce225dfa76579f2141",
"assets/assets/my_tools_icons/playstore_colored.png": "eddf5810f9de0026c7370b62084d5f3e",
"assets/assets/my_tools_icons/postman.png": "9257d114d199f38e7d89402660728d40",
"assets/assets/my_tools_icons/postman_colored.png": "23ccaf8c8009a506a494d55218f7e226",
"assets/assets/my_tools_icons/skype.png": "c97cfa02eb7997e3f7a111bcadc2ebf3",
"assets/assets/my_tools_icons/skype_colored.png": "0f4bc2d507db00ed12fc27473c010e3d",
"assets/assets/my_tools_icons/slack.png": "4b652a83c6247e2e00fe617fc9a9ba22",
"assets/assets/my_tools_icons/slack_colored.png": "d80eadcb69d8a5fcaa2eec02ae12706a",
"assets/assets/my_tools_icons/sqlite.png": "f6145429bc2794d3da723db1ba0124f8",
"assets/assets/my_tools_icons/sqlite_colored.png": "356cca93b964f9a70ea7691d72b99c99",
"assets/assets/my_tools_icons/stackoverflow.png": "f9330a6fcea7ebeb9e35a50a4abe8401",
"assets/assets/my_tools_icons/stackoverflow_colored.png": "88435a66d0d290b3618d42cf65300282",
"assets/assets/my_tools_icons/teams.png": "8ecfcf34e8e8314d1c375647e3928195",
"assets/assets/my_tools_icons/teams_colored.png": "f93fba78b4445d2fac27ed0998b8fd8e",
"assets/assets/my_tools_icons/teamviewer.png": "b00046d3046e7ab3e6387be1be8e933c",
"assets/assets/my_tools_icons/upwork.png": "78e83ed14dd803a3b138ba416ef4628a",
"assets/assets/my_tools_icons/visualstudio.png": "d0c5e9f0a862767b6656c49acac99a93",
"assets/assets/my_tools_icons/visualstudio_colored.png": "64a6da0b9028db4f49e5e6b2563fc040",
"assets/assets/my_tools_icons/vscode.png": "71523ef45bd205d2f776c9116ae3613d",
"assets/assets/my_tools_icons/vscode_colored.png": "8c88d358423cedbe3a18f2f3bb550da6",
"assets/assets/my_tools_icons/whatsapp.png": "31c364d2421fb37eeb1f80d6ea7684eb",
"assets/assets/my_tools_icons/windows.png": "ddd1e9551b76e72f4a7d1571b5feb76b",
"assets/assets/my_tools_icons/windows_colored.png": "cb229f54e51af6627f7e986f1a1c2553",
"assets/assets/my_tools_icons/wordpress.png": "f27a4400ed889b9a662920c912722aee",
"assets/assets/my_tools_icons/wordpress_colored.png": "e9488ed6a7bf1512ec3b11cc8b4c8d1b",
"assets/assets/my_tools_icons/xcode.png": "7e5dae2ca188ecc6e64ee55a128a9922",
"assets/assets/my_tools_icons/zoom.png": "f3e4554bb05c77b37adc28d257502990",
"assets/assets/profiles/anna_del.jfif": "c23662a43d2ac42ea657d63440f8d46e",
"assets/assets/profiles/faisal.png": "097a7c3e3388e166b857a004227479f9",
"assets/assets/profiles/flutter.png": "1bab7ac707fc822dd2eab5c301ccd2fa",
"assets/assets/profiles/kender_john.jpg": "146cd706f13b1b81576f9f0636a4ef0f",
"assets/assets/profiles/mark_lupher.jfif": "2b4102843cdc6ccaa8d0fe7e5c21d061",
"assets/assets/profiles/steve_jon.jfif": "c4defa73359475052aee06034351d35a",
"assets/assets/profiles/umar_ayyaz.jpeg": "cffe00c6561ab73f716bf8078e94c44b",
"assets/assets/showcase/art1.png": "e3691947fd4b27169c09b9481b24e5fc",
"assets/assets/showcase/art2.png": "bc835c75f89be23996e5e0e885ed02e1",
"assets/assets/showcase/barak1.png": "a693a6c2ca67bff3013715ff46456221",
"assets/assets/showcase/barak2.png": "709175619af85776c7cb348f32e9f3c2",
"assets/assets/showcase/bridges1.png": "6e725097b8e34afd292be21b12c102eb",
"assets/assets/showcase/bridges2.png": "31ec04c9da76112dd64f3a20fced1c70",
"assets/assets/showcase/hmk1.png": "73891681863d6f3c4b837f253215fe8c",
"assets/assets/showcase/hmk2.png": "09569d4a754ebf86d42b216faac9cead",
"assets/FontManifest.json": "66b71d2bcd2b436ab06cceee43157084",
"assets/fonts/MaterialIcons-Regular.otf": "63c72302b2b3eb76c487e1221a67089f",
"assets/NOTICES": "a51fb22b647e6fd1a3187576dd0f7946",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "5a27c4fa77370c545af71f1a21817c20",
"assets/packages/ionicons/assets/fonts/Ionicons.ttf": "757f33cf07178f986e73b03f8c195bd6",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"faisal.png": "cc1fccd928c5bd08133f0b47dad1f8fe",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "f218293a5dee5a54b6b04a033321b861",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "4845acdc0f13da34fe6d032347ab527f",
"/": "4845acdc0f13da34fe6d032347ab527f",
"main.dart.js": "2b58a2885be2064d6f9589a3b855b282",
"manifest.json": "49e21a4f07b8fc113bedf2d514008ac5",
"version.json": "9b818ca9511483c901bed1545384376c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
