'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "79974c09f42f7f14bd9f87add2ba1305",
"index.html": "4b48b591dbf62b1b32b2c5d99c4ab4f2",
"/": "4b48b591dbf62b1b32b2c5d99c4ab4f2",
"main.dart.js": "28bf83718c9047049ccf8f3cd878b4bd",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "b9ca20d8221a7e3352478c02064a8ac3",
"assets/asset/images/link_icon.png": "2630129fb440ceea948f5304badb3edc",
"assets/asset/images/mail.png": "6a5edb26af59e124904cf4b21cb88419",
"assets/asset/images/tab_bar/subscription.png": "06ae3e0adf8287a60dd27510b3014357",
"assets/asset/images/tab_bar/sub_login.png": "f4f38f021d09a26c2bb9b0cd09a5ecc5",
"assets/asset/images/tab_bar/dashboard.png": "c3bcecf89dc6a1fb5b65d9b53f3904c4",
"assets/asset/images/tab_bar/forth.png": "1033307bc4295bc5f7d13bd6e2f4adb9",
"assets/asset/images/tab_bar/emptySub.png": "bab7cc7df8175aab4499f25f7c18f65d",
"assets/asset/images/tab_bar/report1.png": "c49d01d16408e2cedd403d525e8a65ac",
"assets/asset/images/tab_bar/report3.png": "f95c6d4b0c7b361e4797e7e9e2443054",
"assets/asset/images/tab_bar/order.png": "28c3eae9c27d6d7c56bb8f5e59213f89",
"assets/asset/images/tab_bar/report2.png": "9e676db0f510fb159b55fea434587d67",
"assets/asset/images/tab_bar/yello_star.png": "2132dc4d21a3d7aff2db98ce236aa316",
"assets/asset/images/tab_bar/user.png": "825e9774784b821e25151f5bcc1ec78d",
"assets/asset/images/tab_bar/content.png": "c6c0a0b8c9f2a2ce0c637dce1bd3ee88",
"assets/asset/images/tab_bar/eight.png": "aac7e0995aeb8638642f95b9ba2e952c",
"assets/asset/images/tab_bar/sixth.png": "f9a5c8451c204a618f84475af3988b82",
"assets/asset/images/tab_bar/coupen.png": "079995050e283ce3105ae8be237a14ad",
"assets/asset/images/tab_bar/filter.png": "42d9358b00ccf3eb0ef24ebcf86a18ea",
"assets/asset/images/tab_bar/second.png": "a32779b4a68688d05ca6ef73b8709835",
"assets/asset/images/tab_bar/pdf.png": "8bb837f920532c0df76a78ecb413e14d",
"assets/asset/images/tab_bar/seven.png": "88ff3baf60e1094ba7755ba637907169",
"assets/asset/images/tab_bar/star.png": "472e17fbf2349d7e483a5c5f10214036",
"assets/asset/images/tab_bar/camera.png": "36ed6ca591c56718907c9117b937b522",
"assets/asset/images/tab_bar/feedback.png": "503e8fe866abca3164170ddc8e75063d",
"assets/asset/images/tab_bar/notification.png": "28206757353c378fbb4d143f3ec669e9",
"assets/asset/images/tab_bar/third.png": "c1d2da47986c89e526c538d5cafd7d9c",
"assets/asset/images/tab_bar/report.png": "42dd7474c949ab1dc40b4f51e8828603",
"assets/asset/images/tab_bar/setting.png": "11b168031abcee19d551b4d6e18841fb",
"assets/asset/images/tab_bar/nine.png": "910ddc44147d0c38936a13c513d3efeb",
"assets/asset/images/tab_bar/fifth.png": "9dca0ca3c55c661b98238b482e9fd053",
"assets/asset/images/tab_bar/first.png": "d08f7f38025eaac6bd70e742add020e6",
"assets/asset/images/edit_icon.png": "5f91345610cbc84cb0b106d957624229",
"assets/asset/images/delete_icon.png": "db6ee67989d4922d7acc90fbc50467c9",
"assets/asset/images/upload_img.png": "adb2e8acb250e876fdb3b21e3ae59554",
"assets/asset/images/clear_icon.png": "5fa5f92269ef9e381e1b856b9e31213e",
"assets/asset/images/dashboard/ecom.png": "e70f50c7501d05212af869ad6a48b789",
"assets/asset/images/dashboard/book.png": "837037ff88ff0bb6c45905d3567de38d",
"assets/asset/images/dashboard/sales.png": "e5fefceff35f171c1fa3683402e423c6",
"assets/asset/images/dashboard/paid_sub.png": "59559fddbca84bb53eea259ae4b6a6ad",
"assets/asset/images/dashboard/user_list.png": "4bd48123e660fbc3fb2304f15900f5c7",
"assets/asset/images/dashboard/notification.png": "bc40a409276f4f0b407e50f854f9ef6c",
"assets/asset/images/login_screen.png": "447f211cd0e784d43c54bb0da3e17da1",
"assets/asset/images/logo.png": "51f73e3d080566576e9f7d88791365f0",
"assets/asset/images/push_notification.png": "8302bbdb8c50bc75aa54f4d7e65721ca",
"assets/asset/demo.jpg": "70762d82e1a2e08163d239b3a5f6b8db",
"assets/asset/font/Genos-Regular.ttf": "aa9ad1f6df3fa099c314c67eb17ce886",
"assets/asset/font/Genos-Light.ttf": "759645a7b1d8902c7a280bf1f222475d",
"assets/asset/font/Genos-Medium.ttf": "0d660eca4691b3ce1e0f141430864a50",
"assets/asset/font/AudioWide-Regular.ttf": "b32da0c186225df40f7e9dc2d5bccc38",
"assets/AssetManifest.json": "96fadd06ac75f0c2d86e40d261da54f7",
"assets/NOTICES": "e29bd52ddc5a2b5896ddf22bd99006a3",
"assets/FontManifest.json": "c9716a1e446eed624d19bee48afa907d",
"assets/AssetManifest.bin.json": "f79aabfa7e3afd173991e0f221c063ee",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/fluttertoast/assets/toastify.js": "18cfdd77033aa55d215e8a78c090ba89",
"assets/packages/fluttertoast/assets/toastify.css": "910ddaaf9712a0b0392cf7975a3b7fb5",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "cb7175945b8a96a2d267c8b236fa5db9",
"assets/fonts/MaterialIcons-Regular.otf": "134c590a0132957360b7a7c2715f0a36",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
