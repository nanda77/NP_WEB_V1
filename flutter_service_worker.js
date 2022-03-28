'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "d4960b3b46d103862db9726c4d637f4e",
"4f2a58af27abc49ecf55570043bbf938.cache.dill.track.dill": "9e1939a69f7017c47dca07917102759a",
"index.html": "6d81fde2f2e6e25ef6f89f2881f99342",
"/": "6d81fde2f2e6e25ef6f89f2881f99342",
"main.dart.js": "51bd82bd4a00b18c13a81f8703300fdf",
"favicon.png": "64ee809a1f0aaecd3ffb6aaebc8505f3",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "4f7272c0cc2f63d5da2e2274c5673cb4",
"assets/AssetManifest.json": "0dfe03de9ae617ea0fe5e562b158983b",
"assets/NOTICES": "da77a69ce036c9ac4d1ddfd1d01fd639",
"assets/FontManifest.json": "24636421a941e1a973ed7962700ca341",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "aa1ec80f1b30a51d64c72f669c1326a7",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "5178af1d278432bec8fc830d50996d6f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "b37ae0f14cbc958316fac4635383b6e8",
"assets/packages/flutter_feather_icons/fonts/feather.ttf": "c96dc22ca29a082af83cce866d35cebc",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/images/t1.png": "37981416f85395f4226a814def18d56f",
"assets/assets/images/Img_1.png": "8737b19ca2018ab533c0ea38926d307d",
"assets/assets/images/Logo%2520Outlook.png": "b30d7f8d436a715920f5766a8f4f590c",
"assets/assets/images/Img_2.png": "50bf76bfe52288249408bfe76af6c02d",
"assets/assets/images/bg1.1.png": "0d8789fc8cfc1e13101096ce0bfa930b",
"assets/assets/images/ic_logo_4x.png": "cba144303330e323d19ce3ab2518798d",
"assets/assets/images/login.png": "44f77c7bab1e20d4ceaefd685f58a5bf",
"assets/assets/images/hero.png": "8c1caa1065dab52cb089d1d9addcf796",
"assets/assets/images/logo_txt.png": "a5fb474fa40bb1f58408eb2e51422404",
"assets/assets/images/f5.png": "e8cd9a41e60f9c8d688bceb7a351ac67",
"assets/assets/images/s4.png": "90484a6135e3dd6bfe4e6e0c4fadfb8c",
"assets/assets/images/f1.png": "adabefa711e3e01a234e6265153ecca1",
"assets/assets/images/img_ninja_pay_text.svg": "7da38ada6d03155b54813960c039bc50",
"assets/assets/images/t1.1.png": "5c72c1791a85a2002f5510a30f880168",
"assets/assets/images/s1.png": "3ce97a44aa1c7fe70408e745202eddd5",
"assets/assets/images/s3.png": "1153ed83fd0a03846cdaf98439ecc517",
"assets/assets/images/f3.png": "3669941a8156950b74f206727319375c",
"assets/assets/images/s2.png": "f88fc4fb146c72d0f900e56cd7d7aec6",
"assets/assets/images/user_2.png": "7eccb0a70693054530486c9faf4a27dd",
"assets/assets/images/user_3.png": "4175bf553052bdd6e1f3e93b71aab1b5",
"assets/assets/images/img_profile.svg": "04e3357eb97411627918a4674b81cb7d",
"assets/assets/images/s5.1.png": "6c2a8265933e5726a14eabbbca46d265",
"assets/assets/images/user_1.png": "b27e4014918be9067acf17512520f699",
"assets/assets/images/user_4.png": "bc10492e902061e17e16fd406be2c328",
"assets/assets/images/google_logo.png": "3e26049d9396f49912688a986b4027b8",
"assets/assets/images/bg1.png": "c48fd018f6d604a200c8f7b0c14256f9",
"assets/assets/images/user_5.png": "8e98aa502e33de2e867686b60507a8c7",
"assets/assets/images/profile.png": "057d526daa4cfcbadc8e574c2dfbaa28",
"assets/assets/images/s3.1.png": "da75b84896a3acdc280e35483aeef7a2",
"assets/assets/images/bg3.png": "a79566d9cb2d46a3fd9bfb538a634043",
"assets/assets/images/ic_logo.png": "dae5734e5105701c3b408884639616de",
"assets/assets/images/play_store.png": "0fb2fca7343b3696f77318ec9781f836",
"assets/assets/images/contact_us.png": "ecf3349ba9973335b4ec21f1c5148578",
"assets/assets/images/bg1.svg": "a4e938853d0e5a2aecb52b5e0206ce36",
"assets/assets/images/app_store.png": "a6e344e7a14d3ecea169446264c584b1",
"assets/assets/icons/t1.2.svg": "9a7acf5db0b07fe8b91f16b75b2bc9f6",
"assets/assets/icons/ic_accept.png": "1c302948bcf7e2e207eea52fe83377de",
"assets/assets/icons/t1.1.svg": "3b973d54436ccbc81ea8f43cf0fa2f7c",
"assets/assets/icons/ic_delete.svg": "e0736c5db8c6a697edda75cd17d0073a",
"assets/assets/icons/s4.svg": "f6883c228d82cfc6028255384ca28063",
"assets/assets/icons/logo_txt.svg": "98c75f519973945d9c7fdd21d5f6c4c8",
"assets/assets/icons/s6.svg": "c8b56d3403ef930ad0e1cc6933ec2769",
"assets/assets/icons/logo_txt1.svg": "7d4b0d2baadd4e85b436159a69fdfbe2",
"assets/assets/icons/t5.svg": "2565c7ae79d39c66442a506c5dedb46a",
"assets/assets/icons/b_tools1.1.svg": "a9da1b0a02d5c472dbc2577f559d135a",
"assets/assets/icons/t4.svg": "8ae0f1deae562870094ebc084ef2022e",
"assets/assets/icons/download_store.svg": "7dda5ceed59582f629ca36dfec2b142e",
"assets/assets/icons/t6.svg": "b8db1e206b4a677212a24cf082e063f7",
"assets/assets/icons/b_tools1.3.svg": "37cbc21f28facaf0526c900074a705d5",
"assets/assets/icons/upi_ic.png": "ae11585f4e4ef769ac228f0ab285c6ee",
"assets/assets/icons/Download.svg": "0605a445a2241a5f4d8039cbe62deb65",
"assets/assets/icons/t2.1.svg": "774f9b54a545fc50d713099600d593ec",
"assets/assets/icons/b_tools1.2.svg": "5db6d5753bd83bc556e6c5908d28efb0",
"assets/assets/icons/t7.svg": "06d55051037379d9e9aa608a5b5362f3",
"assets/assets/icons/ic_pending.svg": "6822476d08c088405ea7f76885ff519f",
"assets/assets/icons/t3.svg": "e2568f12772f4e2ebdf582a969a72739",
"assets/assets/icons/t6.1.svg": "d85118cff53f29d3d9b661447416c492",
"assets/assets/icons/girl_shopping.svg": "1f5f08701effaa49520dd8f4379ca05c",
"assets/assets/icons/t2.svg": "d3486fdbaf6dbcd8e8d67725ff8fa1e4",
"assets/assets/icons/t1.svg": "c2d07707ddcf394cd524c699f59f1cd3",
"assets/assets/icons/menu.png": "818fb64aec8411ae081c161efb1ce81f",
"assets/assets/icons/contact_us1.svg": "97f34f4344f87e060ba6684dda3a5963",
"assets/assets/icons/ic_whats_app.svg": "4f81caf065743ced1ddf5b9a0ece3e34",
"assets/assets/icons/bt_ic.png": "fd184afb398345a38894572e3c42a2e4",
"assets/assets/icons/contact_us.svg": "3163091e1ad45546d6478af8456e90da",
"assets/assets/icons/ic_logo.svg": "ae6c3af4a1b7263e5202a3467d82364d",
"assets/assets/icons/qr.png": "4a0951636c6b67a46e9550889950ed06",
"assets/assets/icons/b_tools.svg": "7b1069937dfb42ae19c8dbf9f76c6aab",
"assets/assets/icons/bw_text.svg": "d8c2d50aa13466543bcd6b68028259ea",
"assets/assets/icons/ic_decline.png": "9e18b25a76fddf3b26cd517cd26e94a4",
"assets/assets/icons/plogo.svg": "cc92f69e9e8e4b3089c21db280be9ba1",
"assets/assets/icons/ic_copy.svg": "d2c2d3b6d5428775511ca84af95822ef",
"assets/assets/icons/learnmore.svg": "86ed1ed4b75539148a56ff27d76f1d64",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
