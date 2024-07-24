'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "abfec8a79b050ec333674608a14e034f",
"assets/AssetManifest.bin.json": "a12cccf80453d933a71e2ce051d68550",
"assets/AssetManifest.json": "253997c8997e3c8ec3dc7a4b7fea3acf",
"assets/assets/backgrounds/login_background.jpg": "70a458da84f9f538f36222b9f8015b51",
"assets/assets/logo/404.png": "596f521a8677c1d0ba6334e230501105",
"assets/assets/logo/artache.jfif": "03e402c5172d71c0d24e79d9b7b56c0f",
"assets/assets/logo/flutter.png": "1bab7ac707fc822dd2eab5c301ccd2fa",
"assets/assets/logo/gdsc.webp": "0581eeb1b9a19e21cccfd7cdeffd04a2",
"assets/assets/logo/gdscColored.webp": "681f51279a13eeb22e1106992d7bc901",
"assets/assets/logo/pel.png": "2a43d235cb7cda8dddf4fbf2c4166acb",
"assets/assets/logo/pieas.jpg": "379cd049875fbfd555b0214f8b84f77e",
"assets/assets/logo/pieasColored.jpg": "7b41589e0132593f3c9f5a1c704ea03c",
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
"assets/assets/my_tools_icons/unsplash.png": "467a7b503e639e51ab996e26667d223f",
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
"assets/assets/profiles/kender_john.jpg": "146cd706f13b1b81576f9f0636a4ef0f",
"assets/assets/profiles/mark_lupher.jfif": "2b4102843cdc6ccaa8d0fe7e5c21d061",
"assets/assets/profiles/steve_jon.jfif": "c4defa73359475052aee06034351d35a",
"assets/assets/profiles/umar_ayyaz.jpeg": "cffe00c6561ab73f716bf8078e94c44b",
"assets/assets/resume/resume.pdf": "db24078daa8cc014f32fd3b54aa3f699",
"assets/assets/showcase/andres_steinkogler/as1.png": "0b1f32a3d583e0096384701fc544b9a0",
"assets/assets/showcase/andres_steinkogler/as2.png": "72fa60d7eca4b4f8dbd4d0c57e5be796",
"assets/assets/showcase/andres_steinkogler/as3.png": "0da5c80e18c8fdc50490aaedee9f0f7b",
"assets/assets/showcase/andres_steinkogler/as4.png": "d2f1dd3b62f54bcb635f92fd8bc125a3",
"assets/assets/showcase/andres_steinkogler/as5.png": "8de776b21c03a0923822577543676e74",
"assets/assets/showcase/andres_steinkogler/as6.png": "e70fab32bfe152447f00160fda70afaa",
"assets/assets/showcase/andres_steinkogler/as7.png": "b48de00d47c0aa1e4ffb6680c15e7f67",
"assets/assets/showcase/artache/art1.png": "819e06cce62bd10b646e34836340bcc8",
"assets/assets/showcase/artache/art10.png": "8d49194592a7d294c24e01a00543e1d4",
"assets/assets/showcase/artache/art11.png": "3c786766fae7403cc9ecbaba2ee99687",
"assets/assets/showcase/artache/art2.png": "2b4013dca5a943c79f9801a588e3a09f",
"assets/assets/showcase/artache/art3.png": "3b3b2ad83263b65d1ad6f6153526ff36",
"assets/assets/showcase/artache/art4.png": "a0825892cc6d04e3a01d83c07f6b4d5f",
"assets/assets/showcase/artache/art5.png": "fb34a75f3abeda0946cbeda677891b62",
"assets/assets/showcase/artache/art6.png": "498882c3a5886b7b874bd959ecf14b6e",
"assets/assets/showcase/artache/art7.png": "fbd79897fa2a61145f059ee19fa6fa25",
"assets/assets/showcase/artache/art8.png": "5edf1764077f638497a0e033f98f429b",
"assets/assets/showcase/artache/art9.png": "10d579ab10e7925cad1c4d9909806926",
"assets/assets/showcase/barak/barak1.png": "d77dd6472d2a0d2b9093f11879f5932f",
"assets/assets/showcase/barak/barak2.png": "4180b2ab4b994813216119325a39df2b",
"assets/assets/showcase/barak/barak3.png": "82ee97e2a8fd8c1c023ed0dd4227d80e",
"assets/assets/showcase/barak/barak4.png": "5403c80b4100f50e61d1bdbf0fa3f76f",
"assets/assets/showcase/barak/barak5.png": "90337f05a192ca90dcfda1633f92207b",
"assets/assets/showcase/barak/barak6.png": "9bd32ef7644cf5c15104584833a6d21c",
"assets/assets/showcase/barak/barak7.png": "a74f276c4106df33d1a72f7d96160036",
"assets/assets/showcase/bridges/bridges1.png": "b76d6aac2628eb7228fe3e12ca609d27",
"assets/assets/showcase/bridges/bridges2.png": "d770335e8165d1c3275a5f1316399216",
"assets/assets/showcase/bridges/bridges3.png": "5f389f26584227504f32537b8d1f4c1d",
"assets/assets/showcase/bridges/bridges4.png": "b62a1bdaa13b19ce89a265e1d4451dbf",
"assets/assets/showcase/calculator/calculator1.png": "6f004fe096b6c6c128795c9e5b467f6e",
"assets/assets/showcase/calorie_counter/calorie1.png": "41a84cb70e8a02067d466ee8c5be3ce3",
"assets/assets/showcase/calorie_counter/calorie10.png": "4dd3c2b63b8400bae683aff7aa9d2d0a",
"assets/assets/showcase/calorie_counter/calorie11.png": "547ebbd38da93319a39a5fa639dc1904",
"assets/assets/showcase/calorie_counter/calorie12.png": "354b04004cd469e52c2fedecd0129fb0",
"assets/assets/showcase/calorie_counter/calorie13.png": "0989ccb8584640e893790c66b22e14ff",
"assets/assets/showcase/calorie_counter/calorie14.png": "6ff6abd950341d1fc68ab8fb1752204a",
"assets/assets/showcase/calorie_counter/calorie2.png": "08106d00f6f48a84adb25cdf255d5c51",
"assets/assets/showcase/calorie_counter/calorie3.png": "d2d3831f011e448dd801a1f9b8712d50",
"assets/assets/showcase/calorie_counter/calorie4.png": "35cb452cc478fe9f6bac78a708d146f7",
"assets/assets/showcase/calorie_counter/calorie5.png": "836e8aa76921d2e57f4d9b25c3038548",
"assets/assets/showcase/calorie_counter/calorie6.png": "b84bc7b45ceb817830948b0e53ce71e4",
"assets/assets/showcase/calorie_counter/calorie7.png": "2058300793a523e025b7ab2b90b7c9bb",
"assets/assets/showcase/calorie_counter/calorie8.png": "0c5d3dee990495e55b67fda4b99f717f",
"assets/assets/showcase/calorie_counter/calorie9.png": "a7a1941103f4d2a2668d6e7daa95b132",
"assets/assets/showcase/climate/climate1.PNG": "6518078389ff47b3fa107824c3dd5acf",
"assets/assets/showcase/climate/climate2.png": "a59cd9c7c3c2c15853ef67594ec11915",
"assets/assets/showcase/climate/climate3.png": "efc50557fb916fed09ca1436e811b9dd",
"assets/assets/showcase/climate/climate4.png": "34f32a7d78157ccecd79b0bd808bf09f",
"assets/assets/showcase/climate/climate_logo.png": "5b1d16aeffe6d7d164d10f0e6dc6afc0",
"assets/assets/showcase/counter/counter1.png": "91fae1b7855c76a6c612ac5a0486c158",
"assets/assets/showcase/counter/counter2.png": "a4b584a6ad5ae06327287638d2e431b0",
"assets/assets/showcase/counter/counter3.png": "07d20ccfa691aa531097a885cafa648c",
"assets/assets/showcase/counter/counter_logo.jpg": "d863565e4d3fbe0c76b255bab3da5b3f",
"assets/assets/showcase/dock_management/dock1.PNG": "61df9667d20f07d5586082b9dae239ad",
"assets/assets/showcase/dock_management/dock2.PNG": "689fa1faa0b2e9ba512d61aaf2ea11b7",
"assets/assets/showcase/gdsc/gdsc1.png": "dadc3eff2f1ceb133bb71c79cb41f657",
"assets/assets/showcase/gdsc/gdsc2.png": "62a6351dfaf8cfff871c767dd6c1d95f",
"assets/assets/showcase/gdsc/gdsc3.png": "0a52e085573b96fd98e3289e102128c4",
"assets/assets/showcase/gdsc/gdsc4.png": "d6ea88dd9f891648ce498e0ac2252588",
"assets/assets/showcase/gdsc/gdsc5.png": "aeb1ab6b5247ddd6eee49d7709f29af0",
"assets/assets/showcase/gdsc/gdsc6.png": "0373ecc26330fc37a2d01607835ad6a5",
"assets/assets/showcase/gdsc/gdsc_logo.png": "82d2a2a00a61e7441ccef43155f59674",
"assets/assets/showcase/hmk/hmk1.png": "5240212d8fd94e0e2ada95e1c09f15d8",
"assets/assets/showcase/hmk/hmk2.png": "7a4f152624e9f97cbed64de4a63d896e",
"assets/assets/showcase/hmk/hmk3.png": "5e5fb9090753062d149931a54bb3c7d8",
"assets/assets/showcase/hmk/hmk4.png": "3ebd17434643af417bc9bb19968a4aef",
"assets/assets/showcase/hmk/hmk5.png": "784e7481ff05c24618620b44b741d6a6",
"assets/assets/showcase/language_translator/translator1.png": "7fcc0b3b1f10c23ff95249f9ea0b3b83",
"assets/assets/showcase/language_translator/translator2.png": "7c3c9917ace15019fb8773fe9a98defb",
"assets/assets/showcase/language_translator/translator3.png": "ab66fccef500e24dd81ebc5ca7a8a631",
"assets/assets/showcase/language_translator/translator4.png": "ebc97f2a98e473c4757af9b6d9d50eeb",
"assets/assets/showcase/language_translator/translator5.png": "18715e4443f2a594e531c582cab6719e",
"assets/assets/showcase/language_translator/translator6.png": "7152cf5c1674de379b0466ded03d19f6",
"assets/assets/showcase/language_translator/translator7.png": "6abe8fc3bfa48e57cae8f016bc36aeff",
"assets/assets/showcase/language_translator/translator8.png": "ed51918ed97ef68d079059ee06a30f76",
"assets/assets/showcase/language_translator/translator9.png": "af0475b023624611198e3b033e4795d9",
"assets/assets/showcase/language_translator/translator_logo.jpg": "2ec0a8658208129c264a7b11f7570dd9",
"assets/assets/showcase/mask_reminder/mask1.png": "fca905359bd2e2ccac1f235b3bfebd3e",
"assets/assets/showcase/mask_reminder/mask10.png": "1c408fe6b8bb39c39eda83d1f590dfaf",
"assets/assets/showcase/mask_reminder/mask11.png": "2f7935aabfd273e565686a1dfe912a8a",
"assets/assets/showcase/mask_reminder/mask12.png": "5b851715a110b1f2b606b7226bbfae5d",
"assets/assets/showcase/mask_reminder/mask13.png": "8536cc615bc690b2a3e60a169690159e",
"assets/assets/showcase/mask_reminder/mask14.png": "037c2dee713d339ce58b02a01a68691a",
"assets/assets/showcase/mask_reminder/mask15.png": "1047d6b1c2eecc0e24a454d00febe778",
"assets/assets/showcase/mask_reminder/mask16.png": "ab13935d18de0734e54df79a645156af",
"assets/assets/showcase/mask_reminder/mask17.png": "2d9f739e06bd57c0990c443fa498f7e0",
"assets/assets/showcase/mask_reminder/mask18.png": "e14a311f230d7943582a517038a6f41c",
"assets/assets/showcase/mask_reminder/mask19.png": "33a343e8d982ee8fc95d032f873e65ff",
"assets/assets/showcase/mask_reminder/mask2.png": "0cd32c6669080b4ff1989417c53b04fb",
"assets/assets/showcase/mask_reminder/mask20.png": "698ca39d74a0d1c0eb7a22da23f0d826",
"assets/assets/showcase/mask_reminder/mask3.png": "fe253a0a1d0e7ae1a989b47287cd9d25",
"assets/assets/showcase/mask_reminder/mask4.png": "690e0a5bc2302265a1dd105ed3a5ff61",
"assets/assets/showcase/mask_reminder/mask5.png": "2830c376eb273921b7cf368f354bd02c",
"assets/assets/showcase/mask_reminder/mask6.png": "f9b25dc43804b828bac4304e5f4fce3e",
"assets/assets/showcase/mask_reminder/mask7.png": "418a4b7e66986e92e3e85aaab6589f10",
"assets/assets/showcase/mask_reminder/mask8.png": "2a336fbcff407df7ef31400782163c34",
"assets/assets/showcase/mask_reminder/mask9.png": "86133c552e2a6f8dab9e21b27bd82b43",
"assets/assets/showcase/restofe/restofe1.png": "18d9110be784101a838ab62e33a2dfd8",
"assets/assets/showcase/restofe/restofe10.png": "7879edad16e8f265bfff6ebc22d771a5",
"assets/assets/showcase/restofe/restofe11.png": "1824242402cf762d37954d939fac5de6",
"assets/assets/showcase/restofe/restofe12.png": "64349f8d5d2da340c33748fd8b9f5b5b",
"assets/assets/showcase/restofe/restofe13.png": "fdc0c51a7fb5fd8ca9fa0fac6d758c5c",
"assets/assets/showcase/restofe/restofe14.png": "1c920a5ab93a74e8755d35ee1f703873",
"assets/assets/showcase/restofe/restofe2.png": "e5761157799cfc9c031d2915b6774a72",
"assets/assets/showcase/restofe/restofe3.png": "a66335ac0aa3a1fe320ba70fd9845ffa",
"assets/assets/showcase/restofe/restofe4.png": "48b5e8afa851963240d48a8cc84b48c3",
"assets/assets/showcase/restofe/restofe5.png": "9e260393045181e1ac27db42589b4c45",
"assets/assets/showcase/restofe/restofe6.png": "7591a36e8c2f8a287033c0cae78297e8",
"assets/assets/showcase/restofe/restofe7.png": "ff03f7e65285178812ee8bae171bbe6e",
"assets/assets/showcase/restofe/restofe8.png": "2d43aaae1c8372eecc813dc877b3febb",
"assets/assets/showcase/restofe/restofe9.png": "1f919786a7ce70d2e8ebc4b7a56a225a",
"assets/assets/showcase/sceo_ap/ap1.png": "4af494a79a883fe365dfa3bb99830b82",
"assets/assets/showcase/sceo_ap/ap2.png": "4786fee10f026b2d2bd53f8a62b100d4",
"assets/assets/showcase/sceo_ap/ap3.png": "edf8172e901548c71cad7521485b1f1b",
"assets/assets/showcase/sceo_ap/ap4.png": "5f953c551535236f297a2d60643207b6",
"assets/assets/showcase/sceo_ap/ap5.png": "088dd316be8c7909e9c669408b9561b1",
"assets/assets/showcase/sceo_ap/ap6.png": "de1b68f1e935acc389d1101151a683b5",
"assets/assets/showcase/sceo_ap/ap7.png": "ea56ac641f693ff0d0dddd6f13dd42ac",
"assets/assets/showcase/sceo_ap/ap_logo.png": "af6aa9395ee7e66d4af592d0932b9b5c",
"assets/assets/showcase/sceo_sms/sms1.png": "45d157c54a2587ff0c9c695959dcca8e",
"assets/assets/showcase/sceo_sms/sms2.png": "858e4aca391504f2e21f6e7a6f0dffd0",
"assets/assets/showcase/sceo_sms/sms3.png": "511307045be84b7d9b5fcd0f349125b6",
"assets/assets/showcase/sceo_sms/sms4.png": "d5a5241e8e6f5928bd30ca29ab9cf5b5",
"assets/assets/showcase/sceo_sms/sms5.png": "7cd7958eac760053d20c2a0aed0864d6",
"assets/assets/showcase/sceo_sms/sms_logo.png": "1b86ae8631d380c4c5b090fc531550e7",
"assets/assets/showcase/sceo_vp/vp1.png": "d61ee9b57e67fefa7099f7691715e7a0",
"assets/assets/showcase/sceo_vp/vp2.png": "a0c9f73986cb49a2998699cd8bf0c064",
"assets/assets/showcase/sceo_vp/vp3.png": "e55c70270600339b9390fe50b898512f",
"assets/assets/showcase/sceo_vp/vp4.png": "1024186b068db31a1986a0adbfb7fe8a",
"assets/assets/showcase/sceo_vp/vp5.png": "ad8f5de81e64b83bd6aa528ebb45eb0b",
"assets/assets/showcase/sceo_vp/vp6.png": "7aaa3dcc6a22fb4a38018c889d0127f6",
"assets/assets/showcase/sceo_vp/vp_logo.png": "a307fc5e330aeae7b279a7dee020acb4",
"assets/FontManifest.json": "66b71d2bcd2b436ab06cceee43157084",
"assets/fonts/MaterialIcons-Regular.otf": "00b43757817a3dc8d6c752885fc22bbc",
"assets/NOTICES": "9f7436eb4f4daec11a62c5c5d4c611ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "d5bf7f019b5aee54c3f4a6806428ee85",
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
"faisal.png": "097a7c3e3388e166b857a004227479f9",
"faisal_rounded.png": "cc1fccd928c5bd08133f0b47dad1f8fe",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "7b2607ef52d2484a2dfa27bece14d0d2",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a271ab84614e63934faaafc335f6882e",
"/": "a271ab84614e63934faaafc335f6882e",
"main.dart.js": "6351578d14ae3d192dd93795818c5f52",
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
