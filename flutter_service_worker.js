'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "a0c9c41b861dc2f41f03d5bb74e17b0b",
"icons/Icon-maskable-512.png": "3bae7716c8af2af752f138b8fb0c054b",
"icons/Icon-192.png": "7a5d9963745d4a022c535d3ab7c5ce92",
"icons/Icon-maskable-192.png": "659f5ae6c77794fabe4341ff368bf27b",
"manifest.json": "c8403a8c3e327413d748cccf0878bfd8",
"index.html": "84e8a96c4f870f0fa006a0f80eb98b28",
"/": "84e8a96c4f870f0fa006a0f80eb98b28",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "895f2446a4bbe2b49a1ce2ecc3cdd701",
"assets/assets/images/svgs/instagram.svg.vec": "331dfe814e3c7e88fa74a6d8589d2239",
"assets/assets/images/svgs/signal.svg.vec": "ec1fade120f42d276090008b513039d5",
"assets/assets/images/svgs/x.svg.vec": "6a1b5ca9fd2d8b76afa258e395384b61",
"assets/assets/images/svgs/facebook.svg.vec": "f667a49e2efc5b8e464439c550bf9f67",
"assets/assets/images/svgs/github.svg.vec": "aa098f400f27f38f272a0780fe04d227",
"assets/assets/images/svgs/cv.svg.vec": "ba5cafc1a2fcb97ad50fb16e528331f3",
"assets/assets/images/svgs/bluesky.svg.vec": "9735d52d4719d4c29af8a6968ee4e867",
"assets/assets/images/svgs/telegram.svg.vec": "a2be96183e7fa786fd587b7de995c635",
"assets/assets/images/svgs/linkedin.svg.vec": "640b7123cb90c1e3f5ee9d7ed03d1a4c",
"assets/assets/images/svgs/whatsapp.svg.vec": "e4c89f3e720d43efce4afef4776fbb24",
"assets/assets/images/svgs/playstore.svg.vec": "5b77d4a64f03541ca908eceede3e2e30",
"assets/assets/images/svgs/threads.svg.vec": "59d08a888fb27afa282bc836ae344052",
"assets/assets/images/svgs/youtube.svg.vec": "7fb520f5d0c73dd38d0f505d1600a069",
"assets/assets/images/svgs/appstore.svg.vec": "852b50ca8e82095e05b3b209a9148e8a",
"assets/assets/images/svgs/figma.svg.vec": "5c7928ced963a0481234531032b49c43",
"assets/assets/images/avatar.webp": "ed8d85fdf497b31b8f1b954ff66cc7bb",
"assets/assets/images/previews/adas.webp": "e11ffa62a58da5ae89cb7141a929f52a",
"assets/assets/images/previews/colorful.webp": "927fb9d5a9775875d13aeb31e8ad56b7",
"assets/assets/images/previews/sorter.webp": "32cb948938dafae128570a9e12bc3717",
"assets/assets/images/previews/otex.webp": "7aadf64708bee813c2d4eda91f5edbde",
"assets/assets/images/previews/fakestore.webp": "e68c2418e7d684936fbe3b3b16394685",
"assets/assets/images/previews/freud.webp": "08cc6a4bc352b0c05f1e7dd63be4a3ce",
"assets/assets/images/previews/pills.webp": "b4a16786faf8201e809f79fa2f53395e",
"assets/assets/images/previews/snake.webp": "5b076d456554ef60220979ad54396a39",
"assets/assets/images/previews/tmdb.webp": "90a473c171676c5a4980d9eb0bbab4d9",
"assets/assets/fonts/Barlow/Barlow-ExtraLight.ttf": "f7e57760641fada9e5bbab93c12e3614",
"assets/assets/fonts/Barlow/Barlow-Thin.ttf": "72e9db32bda6dbdfd6da0e9d74420ad0",
"assets/assets/fonts/Barlow/Barlow-Medium.ttf": "bdffb48240a3383080812d6830ff6f54",
"assets/assets/fonts/Barlow/Barlow-ExtraBold.ttf": "12075155b398a9e6cc43cb03300e00de",
"assets/assets/fonts/Barlow/Barlow-Light.ttf": "2f88cf8762c53a8be3c3ec53b8e01edf",
"assets/assets/fonts/Barlow/Barlow-SemiBold.ttf": "29527ab52af2334e2bcb6290c8692f70",
"assets/assets/fonts/Barlow/Barlow-Regular.ttf": "9373fb661b5c2954ab84d1b7f42774fe",
"assets/assets/fonts/Barlow/Barlow-Bold.ttf": "72871854aabdd7a79c4fc5038cb4faaf",
"assets/assets/fonts/Barlow/Barlow-Black.ttf": "3259b9d5da281613ed918c9d165c20a5",
"assets/fonts/MaterialIcons-Regular.otf": "fc7cb798cc4c00131728ef6b0229cc6d",
"assets/NOTICES": "109c2dd78150db95c3f2d54054effaa3",
"assets/FontManifest.json": "54e6f26fedffc190c014efc115064c48",
"assets/AssetManifest.bin": "3aba44c8f064e81396efbd47f0ca2aeb",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"favicon.png": "ab2580d006989509b131ee86ebcba46d",
"flutter_bootstrap.js": "0e70c1e227240a32439fd5a06d6013d6",
"version.json": "009c9e65172e010890f7f65fde438006",
"main.dart.js": "f16870451c07015bb5279891a795e920"};
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
