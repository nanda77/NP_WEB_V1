'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "e766b3ae2926a29d94af67bfe46ea5eb",
"index.html": "e643a3f7f33b5f5739d4e3a760117feb",
"/": "e643a3f7f33b5f5739d4e3a760117feb",
"main.dart.js": "d6d11a5558c69c57335f9ad4a898033a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "2fcd6516c653ff1524f66b0fce1518bc",
"assets/AssetManifest.json": "630520b514d57acc234925bdae14f38e",
"assets/NOTICES": "9a60b0d7b0ed02e48b623edb1790bf0e",
"assets/FontManifest.json": "ad1a2b33dc8645a9ec31ed1b1f6b573a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_feather_icons/fonts/feather.ttf": "c96dc22ca29a082af83cce866d35cebc",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/assets/images/Img_1.png": "8737b19ca2018ab533c0ea38926d307d",
"assets/assets/images/Img_0.png": "afbe6d2666c4766da1192ed32c81e379",
"assets/assets/images/Logo%2520Outlook.png": "b30d7f8d436a715920f5766a8f4f590c",
"assets/assets/images/add_work_title.gif": "128f18deef7639ddf4e8386294f82471",
"assets/assets/images/Img_2.png": "50bf76bfe52288249408bfe76af6c02d",
"assets/assets/images/bg1.1.png": "0d8789fc8cfc1e13101096ce0bfa930b",
"assets/assets/images/ic_logo_4x.png": "cba144303330e323d19ce3ab2518798d",
"assets/assets/images/login.png": "44f77c7bab1e20d4ceaefd685f58a5bf",
"assets/assets/images/add_material.gif": "f9f902612b9875cd327f1c7b5e5f76c5",
"assets/assets/images/material_wt.gif": "637acac1cf1a1c42185b66fb356a094b",
"assets/assets/images/location.gif": "adb398edfe337d3c1ae63ddf438f7f30",
"assets/assets/images/quick_update.gif": "b656a42916cef5039fa402d9eb6340d1",
"assets/assets/images/add_project.gif": "2f5f47764b02ac764bf09b0642ceaea8",
"assets/assets/images/add_update.gif": "ed18fbfa74fa33120c2e0174236485dd",
"assets/assets/images/s1.png": "3ce97a44aa1c7fe70408e745202eddd5",
"assets/assets/images/s3.png": "1153ed83fd0a03846cdaf98439ecc517",
"assets/assets/images/material.gif": "3ce19832b22cb0a22fb6c14c5e309af6",
"assets/assets/images/360.gif": "8b25a3bb907a3624e864def11e0be83a",
"assets/assets/images/user_2.png": "7eccb0a70693054530486c9faf4a27dd",
"assets/assets/images/user_3.png": "4175bf553052bdd6e1f3e93b71aab1b5",
"assets/assets/images/user_1.png": "b27e4014918be9067acf17512520f699",
"assets/assets/images/landing_footer.png": "c32123093cf618f3040adbd96a77150c",
"assets/assets/images/360_add.gif": "bdab08e10578a5337540de57d7a47fb7",
"assets/assets/images/user_4.png": "bc10492e902061e17e16fd406be2c328",
"assets/assets/images/bg1.png": "c48fd018f6d604a200c8f7b0c14256f9",
"assets/assets/images/user_5.png": "8e98aa502e33de2e867686b60507a8c7",
"assets/assets/images/profile.png": "057d526daa4cfcbadc8e574c2dfbaa28",
"assets/assets/images/bg3.png": "a79566d9cb2d46a3fd9bfb538a634043",
"assets/assets/images/ic_logo.png": "dae5734e5105701c3b408884639616de",
"assets/assets/images/project_creation.gif": "a13104d5fa1e0ab5f8f245873e8e1713",
"assets/assets/images/play_store.png": "0fb2fca7343b3696f77318ec9781f836",
"assets/assets/images/add_work.gif": "a093d91d0a34e825f3e2e4f235fd9ad3",
"assets/assets/images/add_usage.gif": "3126258d775447dcc2ec789b0156f2bc",
"assets/assets/images/bg1.svg": "a4e938853d0e5a2aecb52b5e0206ce36",
"assets/assets/images/attendance.gif": "06e1329c43ba80fc94aea11784a02be2",
"assets/assets/images/normal_update.gif": "95c26e56644156e46b28988e054d4f63",
"assets/assets/images/app_store.png": "a6e344e7a14d3ecea169446264c584b1",
"assets/assets/images/reports_signed.gif": "3235d2d7b3b5bdb7c4efea55db3b79a7",
"assets/assets/Icons/Transfer.svg": "afc6001cc5d53124ffac78b68ad0ecbe",
"assets/assets/Icons/Search.svg": "c7155466276712980bdf822025286c58",
"assets/assets/Icons/PlusCircle.svg": "3c91d58c6c9dd9d724c7f417d421f0ea",
"assets/assets/Icons/Add_members.svg": "5bfd4ddea559936c039ec6ccb6aa81d5",
"assets/assets/Icons/Works.svg": "32bdfbccaa34caebe97879c162305727",
"assets/assets/Icons/Reply.svg": "378c21add4d4219e7969f647a2ea15be",
"assets/assets/Icons/Markup%2520filled.svg": "40d059b79ceb381a4fff5cf4f94d7717",
"assets/assets/Icons/edit_work.svg": "8a5963375dc06e5e38ab410519f27e1b",
"assets/assets/Icons/Members.svg": "3243b2b1e695539e5e5f0ca616672131",
"assets/assets/Icons/Reply%2520all.svg": "cbeaee2532b1f864de2a7fb44c3da9dd",
"assets/assets/Icons/Inbox.svg": "a4777c9e21a6fbd3802c164237a59b0e",
"assets/assets/Icons/File.svg": "6ebd5cba586daf5f6a8cd2ae69974d01",
"assets/assets/Icons/works_filled.svg": "34b983f781a671844078dface9d6365e",
"assets/assets/Icons/Markup.svg": "2a0f37b8f81e85e200239f26c8295718",
"assets/assets/Icons/plus_square.svg": "745f3ae70d8f4b0ee31e1d6dcd1478af",
"assets/assets/Icons/Reports.svg": "94cc0ab3d218f39ac80f51c773b63c95",
"assets/assets/Icons/Rename.svg": "18cda1d599b534e37925dcf5b69f32dc",
"assets/assets/Icons/settings.svg": "6e5ad839e66edc2e3224234182f03f3b",
"assets/assets/Icons/Download.svg": "0605a445a2241a5f4d8039cbe62deb65",
"assets/assets/Icons/Plus1.svg": "d41552489a5a24990b32366c52c1c602",
"assets/assets/Icons/Plus.svg": "db9e94598d5272bad2ed4d0095d3feb5",
"assets/assets/Icons/Paperclip.svg": "d7e7dec5e3b15d70d1cc543902e3e3b8",
"assets/assets/Icons/Angle%2520down.svg": "a0e3ff9e10cbd5a20fd4b3af570bb403",
"assets/assets/Icons/Send.svg": "f29a3dd14ca59dec3c9cd1fe18cb8b4b",
"assets/assets/Icons/bar.svg": "c7436f553d8c1d051bc4657eea61073e",
"assets/assets/Icons/contact_us1.svg": "97f34f4344f87e060ba6684dda3a5963",
"assets/assets/Icons/Printer.svg": "4984ba164d6a117030f2066d5aa59e1f",
"assets/assets/Icons/truck.svg": "8631088eebc7dc19aa3a2aa1f8488ab8",
"assets/assets/Icons/Trash.svg": "4a2cbcd29c9e345be576fc644b154810",
"assets/assets/Icons/More%2520vertical.svg": "23720f8fc4d7e46f590006947dd30b42",
"assets/assets/Icons/Edit.svg": "b4342990aa20448ca5c23e421217b76a",
"assets/assets/Icons/dots3.svg": "c693bb6af18b4e74b44ba8538a827a8e",
"assets/assets/Icons/plus_circle.svg": "3ff4b4f04a2a1367d3833795f5f15710",
"assets/assets/Icons/contact_us.svg": "c08cdc3aa5df9bbec92298c37f21f7e7",
"assets/assets/Icons/truck_filled.svg": "49477364a802991a0baf6b1c79feeaa2",
"assets/assets/Icons/ic_logo.svg": "ae6c3af4a1b7263e5202a3467d82364d",
"assets/assets/Icons/bw_text.svg": "d8c2d50aa13466543bcd6b68028259ea",
"assets/assets/Icons/Delete.svg": "d20ab81b35f071d2901de660b6d9fc1a",
"assets/assets/Icons/Angle%2520right.svg": "aae36377adfd82ebde3949fdcfd7d383",
"assets/assets/Icons/Sort.svg": "d3cfa59524245d5533c0ab4a5fc9d443",
"assets/assets/Icons/Add_member.svg": "5bfd4ddea559936c039ec6ccb6aa81d5",
"assets/assets/Icons/reports_filled.svg": "f2b40e6b5cdfd2267de2c0c0d8a65bfa",
"assets/assets/Icons/work_sel.svg": "f0cc5d940de14c944bbc6b9e5dd54df1"
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
